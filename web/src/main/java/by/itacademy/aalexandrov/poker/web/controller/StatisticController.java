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

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IStatistic;
import by.itacademy.aalexandrov.poker.dao.api.filter.StatisticFilter;
import by.itacademy.aalexandrov.poker.service.IStatisticService;
import by.itacademy.aalexandrov.poker.web.converter.StatisticToDTOConverter;
import by.itacademy.aalexandrov.poker.web.dto.StatisticDTO;

@Controller
@RequestMapping(value = "/statistic")
public class StatisticController {

	private IStatisticService statisticService;

	private StatisticToDTOConverter toDtoConverter;

	@Autowired
	public StatisticController(IStatisticService statisticService, StatisticToDTOConverter toDtoConverter) {
		super();
		this.statisticService = statisticService;
		this.toDtoConverter = toDtoConverter;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView index(final HttpServletRequest req) {

		final StatisticFilter filter = new StatisticFilter();

		final List<IStatistic> entities = statisticService.find(filter);
		List<StatisticDTO> dtos = entities.stream().map(toDtoConverter).collect(Collectors.toList());

		final Map<String, Object> models = new HashMap<>();
		models.put("gridItems", dtos);
		return new ModelAndView("statistic.list", models);
	}

}
