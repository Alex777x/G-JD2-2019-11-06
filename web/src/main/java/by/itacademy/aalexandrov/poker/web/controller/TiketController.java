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

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITiket;
import by.itacademy.aalexandrov.poker.dao.api.filter.TiketFilter;
import by.itacademy.aalexandrov.poker.service.ITiketService;
import by.itacademy.aalexandrov.poker.web.converter.TiketToDTOConverter;
import by.itacademy.aalexandrov.poker.web.dto.TiketDTO;

@Controller
@RequestMapping(value = "/tiket")
public class TiketController {

	private ITiketService tiketService;

	private TiketToDTOConverter toDtoConverter;

	@Autowired
	public TiketController(ITiketService tiketService, TiketToDTOConverter toDtoConverter) {
		super();
		this.tiketService = tiketService;
		this.toDtoConverter = toDtoConverter;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView index(final HttpServletRequest req) {

		final TiketFilter filter = new TiketFilter();

		final List<ITiket> entities = tiketService.find(filter);
		List<TiketDTO> dtos = entities.stream().map(toDtoConverter).collect(Collectors.toList());

		final Map<String, Object> models = new HashMap<>();
		models.put("gridItems", dtos);
		return new ModelAndView("tiket.list", models);
	}

}