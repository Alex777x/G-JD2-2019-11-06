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

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IChatInHome;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.filter.ChatInHomeFilter;
import by.itacademy.aalexandrov.poker.dao.api.filter.GameFilter;
import by.itacademy.aalexandrov.poker.service.IChatInHomeService;
import by.itacademy.aalexandrov.poker.service.IGameService;
import by.itacademy.aalexandrov.poker.service.IPlayerService;
import by.itacademy.aalexandrov.poker.web.converter.ChatInHomeFromDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.ChatInHomeToDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.GameFromDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.GameToDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.PlayerToDTOConverter;
import by.itacademy.aalexandrov.poker.web.dto.ChatInHomeDTO;
import by.itacademy.aalexandrov.poker.web.dto.GameDTO;
import by.itacademy.aalexandrov.poker.web.dto.grid.GridStateDTO;

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

		final Map<String, Object> model = new HashMap<>();
		model.put("gridItems", dtos);
		model.put("chatItems", dtosC);

		ModelAndView modelAndView = new ModelAndView("home", model);

		// String login =
		// SecurityContextHolder.getContext().getAuthentication().getPrincipal().toString();

		// modelAndView.addObject("welcomeMessage",
		// messageSource.getMessage("page.home.welcomeMessage", new Object[] { login },
		// locale));

		return modelAndView;
	}

}