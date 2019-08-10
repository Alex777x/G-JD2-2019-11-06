package by.itacademy.aalexandrov.poker.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.filter.GameFilter;
import by.itacademy.aalexandrov.poker.service.IChatInHomeService;
import by.itacademy.aalexandrov.poker.service.IGameService;
import by.itacademy.aalexandrov.poker.web.converter.ChatInHomeFromDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.ChatInHomeToDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.GameFromDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.GameToDTOConverter;
import by.itacademy.aalexandrov.poker.web.dto.GameDTO;
import by.itacademy.aalexandrov.poker.web.dto.grid.GridStateDTO;

@Controller
@RequestMapping(value = "/")
public class DefaultController extends AbstractController {

//	@Autowired
//	private MessageSource messageSource;

	private IGameService gameService;

	private GameToDTOConverter gameToDtoConverter;

	private GameFromDTOConverter gameFromDtoConverter;

	private IChatInHomeService chatInHomeService;

	private ChatInHomeFromDTOConverter chatFromDtoConverter;

	private ChatInHomeToDTOConverter chatToDtoConverter;

	@Autowired
	public DefaultController(IGameService gameService, GameToDTOConverter gameToDtoConverter,
			GameFromDTOConverter gameFromDtoConverter, IChatInHomeService chatInHomeService,
			ChatInHomeFromDTOConverter chatFromDtoConverter, ChatInHomeToDTOConverter chatToDtoConverter) {
		super();
		this.gameService = gameService;
		this.gameToDtoConverter = gameToDtoConverter;
		this.gameFromDtoConverter = gameFromDtoConverter;
		this.chatInHomeService = chatInHomeService;
		this.chatFromDtoConverter = chatFromDtoConverter;
		this.chatToDtoConverter = chatToDtoConverter;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView index(final HttpServletRequest req,
			@RequestParam(name = "page", required = false) final Integer pageNumber,
			@RequestParam(name = "sort", required = false) final String sortColumn, Locale locale) {

		final GridStateDTO gridState = getListDTO(req);
		gridState.setPage(pageNumber);
		gridState.setSort(sortColumn, "id");

		final GameFilter filter = new GameFilter();
		prepareFilter(gridState, filter);

		final List<IGame> entities = gameService.find(filter);
		List<GameDTO> dtos = entities.stream().map(gameToDtoConverter).collect(Collectors.toList());
		gridState.setTotalCount(gameService.getCount(filter));

//		ChatInHomeFilter filterC = new ChatInHomeFilter();
//		prepareFilter(gridState, filterC);
//
//		List<IChatInHome> messages = chatInHomeService.find(filterC);
//		List<ChatInHomeDTO> dtosC = messages.stream().map(chatToDtoConverter).collect(Collectors.toList());
//		gridState.setTotalCount(chatInHomeService.getCount(filterC));

		final Map<String, Object> gamesAndChats = new HashMap<>();
		gamesAndChats.put("gridItems", dtos);
//		gamesAndChats.put("gridItems", dtosC);

		ModelAndView modelAndView = new ModelAndView("home", gamesAndChats);

//		String login = SecurityContextHolder.getContext().getAuthentication().getPrincipal().toString();

//		modelAndView.addObject("welcomeMessage",
//				messageSource.getMessage("page.home.welcomeMessage", new Object[] { login }, locale));

		return modelAndView;
	}

}