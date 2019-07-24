package by.itacademy.aalexandrov.poker.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IChat;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.dao.api.filter.ChatFilter;
import by.itacademy.aalexandrov.poker.service.IChatService;
import by.itacademy.aalexandrov.poker.service.IGameService;
import by.itacademy.aalexandrov.poker.service.IUserAccountService;
import by.itacademy.aalexandrov.poker.web.converter.ChatFromDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.ChatToDTOConverter;
import by.itacademy.aalexandrov.poker.web.dto.ChatDTO;
import by.itacademy.aalexandrov.poker.web.dto.grid.GridStateDTO;

@Controller
@RequestMapping(value = "/chat")
public class ChatController extends AbstractController {

	private IChatService chatService;

	private ChatToDTOConverter toDtoConverter;

	private ChatFromDTOConverter fromDtoConverter;

	private IUserAccountService userAccountService;

	private IGameService gameService;

	@Autowired
	public ChatController(IChatService chatService, ChatToDTOConverter toDtoConverter,
			ChatFromDTOConverter fromDtoConverter, IUserAccountService userAccountService, IGameService gameService) {
		super();
		this.chatService = chatService;
		this.toDtoConverter = toDtoConverter;
		this.fromDtoConverter = fromDtoConverter;
		this.userAccountService = userAccountService;
		this.gameService = gameService;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView index(final HttpServletRequest req,
			@RequestParam(name = "page", required = false) final Integer pageNumber,
			@RequestParam(name = "sort", required = false) final String sortColumn) {

		final GridStateDTO gridState = getListDTO(req);
		gridState.setPage(pageNumber);
		gridState.setSort(sortColumn, "id");

		final ChatFilter filter = new ChatFilter();
		prepareFilter(gridState, filter);

		final List<IChat> entities = chatService.find(filter);
		List<ChatDTO> dtos = entities.stream().map(toDtoConverter).collect(Collectors.toList());
		gridState.setTotalCount(chatService.getCount(filter));

		final Map<String, Object> chats = new HashMap<>();
		chats.put("gridItems", dtos);
		return new ModelAndView("chat.list", chats);
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView showForm() {
		final Map<String, Object> hashMap = new HashMap<>();
		hashMap.put("formChat", new ChatDTO());
		loadCommonFormTransactions(hashMap);
		return new ModelAndView("chat.edit", hashMap);
	}

	@RequestMapping(method = RequestMethod.POST)
	public Object save(@Valid @ModelAttribute("formChat") final ChatDTO formChat, final BindingResult result) {
		if (result.hasErrors()) {
			final Map<String, Object> hashMap = new HashMap<>();
			hashMap.put("formChat", formChat);
			loadCommonFormTransactions(hashMap);
			return new ModelAndView("chat.edit", hashMap);
		} else {
			final IChat entity = fromDtoConverter.apply(formChat);
			chatService.save(entity);
			return "redirect:/chat";
		}

	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public ModelAndView viewDetails(@PathVariable(name = "id", required = true) final Integer id) {
		final IChat dbModel = chatService.get(id);
		final ChatDTO dto = toDtoConverter.apply(dbModel);
		final Map<String, Object> hashMap = new HashMap<>();
		hashMap.put("formChat", dto);
		hashMap.put("readonly", true);
		loadCommonFormTransactions(hashMap);
		return new ModelAndView("chat.edit", hashMap);
	}

	@RequestMapping(value = "/{id}/edit", method = RequestMethod.GET)
	public ModelAndView edit(@PathVariable(name = "id", required = true) final Integer id) {
		final ChatDTO dto = toDtoConverter.apply(chatService.get(id));

		final Map<String, Object> hashMap = new HashMap<>();
		hashMap.put("formChat", dto);
		loadCommonFormTransactions(hashMap);

		return new ModelAndView("chat.edit", hashMap);
	}

	@RequestMapping(value = "/{id}/delete", method = RequestMethod.GET)
	public String delete(@PathVariable(name = "id", required = true) final Integer id) {
		chatService.delete(id);
		return "redirect:/chat";
	}

	private void loadCommonFormTransactions(final Map<String, Object> hashMap) {
		final List<IUserAccount> userAccounts = userAccountService.getAll();
		final List<IGame> games = gameService.getAll();

		final Map<Integer, String> userAccountsMap = userAccounts.stream()
				.collect(Collectors.toMap(IUserAccount::getId, IUserAccount::getNickname));
		hashMap.put("userAccountsChoices", userAccountsMap);

		final Map<Integer, Integer> gamesMap = games.stream().collect(Collectors.toMap(IGame::getId, IGame::getId));
		hashMap.put("gamesChoices", gamesMap);
	}

}
