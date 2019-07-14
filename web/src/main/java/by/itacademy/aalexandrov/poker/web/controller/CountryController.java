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

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICountry;
import by.itacademy.aalexandrov.poker.dao.api.filter.CountryFilter;
import by.itacademy.aalexandrov.poker.service.ICountryService;
import by.itacademy.aalexandrov.poker.web.converter.CountryToDTOConverter;
import by.itacademy.aalexandrov.poker.web.dto.CountryDTO;

@Controller
@RequestMapping(value = "/country")
public class CountryController {

	private ICountryService countryService;

	private CountryToDTOConverter toDtoConverter;

	@Autowired
	public CountryController(ICountryService countryService, CountryToDTOConverter toDtoConverter) {
		super();
		this.countryService = countryService;
		this.toDtoConverter = toDtoConverter;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView index(final HttpServletRequest req) {

		final CountryFilter filter = new CountryFilter();

		final List<ICountry> entities = countryService.find(filter);
		List<CountryDTO> dtos = entities.stream().map(toDtoConverter).collect(Collectors.toList());

		final Map<String, Object> models = new HashMap<>();
		models.put("gridItems", dtos);
		return new ModelAndView("country.list", models);
	}

}
