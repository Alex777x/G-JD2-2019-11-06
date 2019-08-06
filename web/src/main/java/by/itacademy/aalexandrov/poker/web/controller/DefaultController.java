package by.itacademy.aalexandrov.poker.web.controller;

import java.util.HashMap;
import java.util.List;
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
import by.itacademy.aalexandrov.poker.service.IChatService;
import by.itacademy.aalexandrov.poker.service.IGameService;
import by.itacademy.aalexandrov.poker.web.converter.ChatFromDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.ChatToDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.GameFromDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.GameToDTOConverter;
import by.itacademy.aalexandrov.poker.web.dto.GameDTO;
import by.itacademy.aalexandrov.poker.web.dto.grid.GridStateDTO;

@Controller
@RequestMapping(value = "/")
public class DefaultController extends AbstractController {

	private IGameService gameService;

	private IChatService chatService;

	private GameToDTOConverter gameToDtoConverter;

	private GameFromDTOConverter gameFromDtoConverter;

	private ChatToDTOConverter chatToDtoConverter;

	private ChatFromDTOConverter chatFromDtoConverter;

	@Autowired
	public DefaultController(IGameService gameService, IChatService chatService, GameToDTOConverter gameToDtoConverter,
			GameFromDTOConverter gameFromDtoConverter, ChatToDTOConverter chatToDtoConverter,
			ChatFromDTOConverter chatFromDtoConverter) {
		super();
		this.gameService = gameService;
		this.chatService = chatService;
		this.gameToDtoConverter = gameToDtoConverter;
		this.gameFromDtoConverter = gameFromDtoConverter;
		this.chatToDtoConverter = chatToDtoConverter;
		this.chatFromDtoConverter = chatFromDtoConverter;
	}

//	@RequestMapping(method = RequestMethod.GET)
//	public String index() {
//		return "home";
//	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView index(final HttpServletRequest req,
			@RequestParam(name = "page", required = false) final Integer pageNumber,
			@RequestParam(name = "sort", required = false) final String sortColumn) {

		final GridStateDTO gridState = getListDTO(req);
		gridState.setPage(pageNumber);
		gridState.setSort(sortColumn, "id");

		final GameFilter filter = new GameFilter();
		prepareFilter(gridState, filter);

		final List<IGame> entities = gameService.find(filter);
		List<GameDTO> dtos = entities.stream().map(gameToDtoConverter).collect(Collectors.toList());
		gridState.setTotalCount(gameService.getCount(filter));

		final Map<String, Object> games = new HashMap<>();
		games.put("gridItems", dtos);
		return new ModelAndView("home", games);
	}

}