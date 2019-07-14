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

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.dao.api.filter.PlayerFilter;
import by.itacademy.aalexandrov.poker.service.IPlayerService;
import by.itacademy.aalexandrov.poker.web.converter.PlayerToDTOConverter;
import by.itacademy.aalexandrov.poker.web.dto.PlayerDTO;

@Controller
@RequestMapping(value = "/player")
public class PlayerController {

	private IPlayerService playerdService;

	private PlayerToDTOConverter toDtoConverter;

	@Autowired
	public PlayerController(IPlayerService playerdService, PlayerToDTOConverter toDtoConverter) {
		super();
		this.playerdService = playerdService;
		this.toDtoConverter = toDtoConverter;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView index(final HttpServletRequest req) {

		final PlayerFilter filter = new PlayerFilter();

		final List<IPlayer> entities = playerdService.find(filter);
		List<PlayerDTO> dtos = entities.stream().map(toDtoConverter).collect(Collectors.toList());

		final Map<String, Object> models = new HashMap<>();
		models.put("gridItems", dtos);
		return new ModelAndView("player.list", models);
	}

}
