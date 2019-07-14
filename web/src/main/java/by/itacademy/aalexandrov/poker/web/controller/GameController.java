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
import org.springframework.web.servlet.ModelAndView;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.filter.GameFilter;
import by.itacademy.aalexandrov.poker.service.IGameService;
import by.itacademy.aalexandrov.poker.web.converter.GameToDTOConverter;
import by.itacademy.aalexandrov.poker.web.dto.GameDTO;

@Controller
@RequestMapping(value = "/game")
public class GameController {

	private IGameService gameService;

	private GameToDTOConverter toDtoConverter;

	@Autowired
	public GameController(IGameService gameService, GameToDTOConverter toDtoConverter) {
		super();
		this.gameService = gameService;
		this.toDtoConverter = toDtoConverter;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView index(final HttpServletRequest req) {

		final GameFilter filter = new GameFilter();

		final List<IGame> entities = gameService.find(filter);
		List<GameDTO> dtos = entities.stream().map(toDtoConverter).collect(Collectors.toList());

		final Map<String, Object> models = new HashMap<>();
		models.put("gridItems", dtos);
		return new ModelAndView("game.list", models);
	}

}