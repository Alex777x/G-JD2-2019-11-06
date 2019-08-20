package by.itacademy.aalexandrov.poker.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.GameStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerPosition;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IChatInHome;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.dao.api.filter.ChatInHomeFilter;
import by.itacademy.aalexandrov.poker.dao.api.filter.GameFilter;
import by.itacademy.aalexandrov.poker.service.IChatInHomeService;
import by.itacademy.aalexandrov.poker.service.IGameService;
import by.itacademy.aalexandrov.poker.service.IPlayerService;
import by.itacademy.aalexandrov.poker.service.ITransactionService;
import by.itacademy.aalexandrov.poker.service.IUserAccountService;
import by.itacademy.aalexandrov.poker.web.converter.ChatInHomeFromDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.ChatInHomeToDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.GameFromDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.GameToDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.PlayerToDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.UserAccountToDTOConverter;
import by.itacademy.aalexandrov.poker.web.dto.ChatInHomeDTO;
import by.itacademy.aalexandrov.poker.web.dto.GameDTO;
import by.itacademy.aalexandrov.poker.web.dto.grid.GridStateDTO;
import by.itacademy.aalexandrov.poker.web.security.AuthHelper;

@Controller
@RequestMapping(value = "/")
public class DefaultController extends AbstractController {

	// @Autowired
	// private MessageSource messageSource;
	@Autowired
	private IGameService gameService;
	@Autowired
	private GameToDTOConverter gameToDtoConverter;
	@Autowired
	private GameFromDTOConverter gameFromDtoConverter;
	@Autowired
	private IChatInHomeService chatInHomeService;
	@Autowired
	private ChatInHomeFromDTOConverter chatFromDtoConverter;
	@Autowired
	private ChatInHomeToDTOConverter chatToDtoConverter;
	@Autowired
	private IPlayerService playerService;
	@Autowired
	private PlayerToDTOConverter playerToDtoConverter;
	@Autowired
	private IUserAccountService userAccountService;
	@Autowired
	UserAccountToDTOConverter userAccountDtoConverter;
	@Autowired
	private ITransactionService transactionService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView index(final HttpServletRequest req,
			@RequestParam(name = "page", required = false) final Integer pageNumber,
			@RequestParam(name = "sort", required = false) final String sortColumn, Locale locale) {

		final GridStateDTO gridState = getListDTO(req);
		gridState.setPage(pageNumber);
		gridState.setSort(sortColumn, "id");

		final GameFilter filter = new GameFilter();
		prepareFilter(gridState, filter);

		final List<IGame> gamesEntities = gameService.find(filter);
		List<GameDTO> dtos = gamesEntities.stream().map(gameToDtoConverter).collect(Collectors.toList());

		for (GameDTO gameDTO : dtos) {
			long playerCount = playerService.getPlayersCount(gameDTO.getId());
			gameDTO.setPlaersCount(playerCount);
		}

		gridState.setTotalCount(gameService.getCount(filter));

		ChatInHomeFilter filterC = new ChatInHomeFilter();
		prepareFilter(gridState, filterC);

		List<IChatInHome> messagesEntities = chatInHomeService.find(filterC);
		List<ChatInHomeDTO> dtosC = messagesEntities.stream().map(chatToDtoConverter).collect(Collectors.toList());
		gridState.setTotalCount(chatInHomeService.getCount(filterC));

		final IChatInHome newestmessage = chatInHomeService.getNewestMessage();

		final Map<String, Object> model = new HashMap<>();
		model.put("gridItems", dtos);
		model.put("chatItems", dtosC);
		model.put("formChats", new ChatInHomeDTO());
		model.put("newestMessage", newestmessage == null ? null : newestmessage.getId());

		ModelAndView modelAndView = new ModelAndView("home", model);

		// String login =
		// SecurityContextHolder.getContext().getAuthentication().getPrincipal().toString();

		// modelAndView.addObject("welcomeMessage",
		// messageSource.getMessage("page.home.welcomeMessage", new Object[] { login },
		// locale));

		return modelAndView;
	}

	@RequestMapping(value = "/json", method = RequestMethod.POST)
	public ResponseEntity<ChatInHomeDTO> getChatsInHome(
			@RequestParam(name = "message", required = true) final String message) {
		Integer loggedUserId = AuthHelper.getLoggedUserId();
		IUserAccount curentUser = userAccountService.getFullInfo(loggedUserId);
		IChatInHome entity = chatInHomeService.createEntity();
		entity.setUserAccount(curentUser);
		entity.setMessage(message);
		chatInHomeService.save(entity);

		ChatInHomeDTO dto = chatToDtoConverter.apply(chatInHomeService.getFullInfo(entity.getId()));

		return new ResponseEntity<ChatInHomeDTO>(dto, HttpStatus.OK);
	}

	@RequestMapping(value = "/newGame", method = RequestMethod.POST)
	public ResponseEntity<GameDTO> createNewGame() {
		Integer loggedUserId = AuthHelper.getLoggedUserId();
		IUserAccount curentUser = userAccountService.getFullInfo(loggedUserId);

		double balance = transactionService.getSumm(curentUser.getId());

		IGame game = gameService.createEntity();
		game.setState(GameStatus.ACTIVE);
		game.setBank(0);
		gameService.save(game);

		IPlayer player = playerService.createEntity();
		player.setGame(game);
		player.setUserAccount(curentUser);
		player.setPosition(PlayerPosition.ONE);
		player.setInGame(true);
		player.setState(PlayerStatus.DEALER);
		player.setStack(balance);

		playerService.save(player);

		GameDTO dto = gameToDtoConverter.apply(gameService.getFullInfo(game.getId()));

		return new ResponseEntity<GameDTO>(dto, HttpStatus.OK);
	}

	@RequestMapping(value = "/lastId", method = RequestMethod.GET)
	public ResponseEntity<Integer> getNewestChat() {
		final IChatInHome newestChat = chatInHomeService.getNewestMessage();
		return new ResponseEntity<Integer>(newestChat == null ? null : newestChat.getId(), HttpStatus.OK);
	}

	@RequestMapping(value = "/getfromserver", method = RequestMethod.GET)
	public ResponseEntity<ChatInHomeDTO> getNewestMessage(
			@RequestParam(name = "id", required = true) final Integer id) {
		IChatInHome entity = chatInHomeService.getFullInfo(id);

		ChatInHomeDTO dto = chatToDtoConverter.apply(chatInHomeService.getFullInfo(entity.getId()));

		return new ResponseEntity<ChatInHomeDTO>(dto, HttpStatus.OK);
	}

}