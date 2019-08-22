package by.itacademy.aalexandrov.poker.web.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.dao.api.filter.PlayerFilter;
import by.itacademy.aalexandrov.poker.service.IGameService;
import by.itacademy.aalexandrov.poker.service.IPlayerService;
import by.itacademy.aalexandrov.poker.service.IUserAccountService;
import by.itacademy.aalexandrov.poker.web.converter.PlayerFromDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.PlayerToDTOConverter;
import by.itacademy.aalexandrov.poker.web.dto.PlayerDTO;
import by.itacademy.aalexandrov.poker.web.dto.grid.GridStateDTO;
import by.itacademy.aalexandrov.poker.web.security.AuthHelper;

@Controller
@RequestMapping(value = "/player")
public class PlayerController extends AbstractController {

	private IPlayerService playerService;

	private PlayerToDTOConverter toDtoConverter;

	private PlayerFromDTOConverter fromDtoConverter;

	private IGameService gameService;

	private IUserAccountService userAccountService;

	@Autowired
	public PlayerController(IPlayerService playerService, PlayerToDTOConverter toDtoConverter,
			PlayerFromDTOConverter fromDtoConverter, IGameService gameService, IUserAccountService userAccountService) {
		super();
		this.playerService = playerService;
		this.toDtoConverter = toDtoConverter;
		this.fromDtoConverter = fromDtoConverter;
		this.gameService = gameService;
		this.userAccountService = userAccountService;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView index(final HttpServletRequest req,
			@RequestParam(name = "page", required = false) final Integer pageNumber,
			@RequestParam(name = "sort", required = false) final String sortColumn) {

		final GridStateDTO gridState = getListDTO(req);
		gridState.setPage(pageNumber);
		gridState.setSort(sortColumn, "id");

		final PlayerFilter filter = new PlayerFilter();
		prepareFilter(gridState, filter);

		final List<IPlayer> entities = playerService.find(filter);
		List<PlayerDTO> dtos = entities.stream().map(toDtoConverter).collect(Collectors.toList());
		gridState.setTotalCount(playerService.getCount(filter));

		final Map<String, Object> players = new HashMap<>();
		players.put("gridItems", dtos);
		return new ModelAndView("player.list", players);
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView showForm() {
		final Map<String, Object> hashMap = new HashMap<>();
		hashMap.put("formPlayer", new PlayerDTO());
		loadCommonFormTransactions(hashMap);
		return new ModelAndView("player.edit", hashMap);
	}

	@RequestMapping(method = RequestMethod.POST)
	public Object save(@Valid @ModelAttribute("formPlayer") final PlayerDTO formPlayer, final BindingResult result) {
		if (result.hasErrors()) {
			final Map<String, Object> hashMap = new HashMap<>();
			hashMap.put("formPlayer", formPlayer);
			loadCommonFormTransactions(hashMap);
			return new ModelAndView("player.edit", hashMap);
		} else {
			final IPlayer entity = fromDtoConverter.apply(formPlayer);
			playerService.save(entity);
			return "redirect:/player";
		}

	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public ModelAndView viewDetails(@PathVariable(name = "id", required = true) final Integer id) {
		final IPlayer dbModel = playerService.get(id);
		final PlayerDTO dto = toDtoConverter.apply(dbModel);
		final Map<String, Object> hashMap = new HashMap<>();
		hashMap.put("formPlayer", dto);
		hashMap.put("readonly", true);
		loadCommonFormTransactions(hashMap);
		return new ModelAndView("player.edit", hashMap);
	}

	@RequestMapping(value = "/{id}/edit", method = RequestMethod.GET)
	public ModelAndView edit(@PathVariable(name = "id", required = true) final Integer id) {
		final PlayerDTO dto = toDtoConverter.apply(playerService.get(id));

		final Map<String, Object> hashMap = new HashMap<>();
		hashMap.put("formPlayer", dto);
		loadCommonFormTransactions(hashMap);

		return new ModelAndView("player.edit", hashMap);
	}

	@RequestMapping(value = "/{id}/delete", method = RequestMethod.GET)
	public String delete(@PathVariable(name = "id", required = true) final Integer id) {
		playerService.delete(id);
		return "redirect:/player";
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

	@RequestMapping(value = "/playerout", method = RequestMethod.GET)
	public ResponseEntity<PlayerDTO> getChatsInHome() {
		Integer loggedUserId = AuthHelper.getLoggedUserId();

		PlayerDTO dto = toDtoConverter.apply(playerService.getPlayerByUser(loggedUserId));

		IPlayer entity = fromDtoConverter.apply(dto);
		entity.setUpdated(new Date());
		playerService.save(entity);
		PlayerDTO dtonew = toDtoConverter.apply(playerService.getPlayerByUser(loggedUserId));

		return new ResponseEntity<PlayerDTO>(dtonew, HttpStatus.OK);
	}

}
