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

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayerAction;
import by.itacademy.aalexandrov.poker.dao.api.filter.PlayerActionFilter;
import by.itacademy.aalexandrov.poker.service.IPlayerActionService;
import by.itacademy.aalexandrov.poker.web.converter.PlayerActionToDTOConverter;
import by.itacademy.aalexandrov.poker.web.dto.PlayerActionDTO;

@Controller
@RequestMapping(value = "/playerAction")
public class PlayerActionController {

	private IPlayerActionService playerActionService;

	private PlayerActionToDTOConverter toDtoConverter;

	@Autowired
	public PlayerActionController(IPlayerActionService playerActionService, PlayerActionToDTOConverter toDtoConverter) {
		super();
		this.playerActionService = playerActionService;
		this.toDtoConverter = toDtoConverter;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView index(final HttpServletRequest req) {

		final PlayerActionFilter filter = new PlayerActionFilter();

		final List<IPlayerAction> entities = playerActionService.find(filter);
		List<PlayerActionDTO> dtos = entities.stream().map(toDtoConverter).collect(Collectors.toList());

		final Map<String, Object> models = new HashMap<>();
		models.put("gridItems", dtos);
		return new ModelAndView("playerAction.list", models);
	}

}
