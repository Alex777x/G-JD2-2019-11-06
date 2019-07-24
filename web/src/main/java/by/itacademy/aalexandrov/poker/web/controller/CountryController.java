package by.itacademy.aalexandrov.poker.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICountry;
import by.itacademy.aalexandrov.poker.dao.api.filter.CountryFilter;
import by.itacademy.aalexandrov.poker.service.ICountryService;
import by.itacademy.aalexandrov.poker.web.converter.CountryFromDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.CountryToDTOConverter;
import by.itacademy.aalexandrov.poker.web.dto.CountryDTO;
import by.itacademy.aalexandrov.poker.web.dto.grid.GridStateDTO;

@Controller
@RequestMapping(value = "/country")
public class CountryController extends AbstractController {

	private ICountryService countryService;

	private CountryToDTOConverter toDtoConverter;

	private CountryFromDTOConverter fromDtoConverter;

	@Autowired
	public CountryController(ICountryService countryService, CountryToDTOConverter toDtoConverter,
			CountryFromDTOConverter fromDtoConverter) {
		super();
		this.countryService = countryService;
		this.toDtoConverter = toDtoConverter;
		this.fromDtoConverter = fromDtoConverter;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView index(final HttpServletRequest req,
			@RequestParam(name = "page", required = false) final Integer pageNumber,
			@RequestParam(name = "sort", required = false) final String sortColumn) {

		final GridStateDTO gridState = getListDTO(req);
		gridState.setPage(pageNumber);
		gridState.setSort(sortColumn, "id");

		final CountryFilter filter = new CountryFilter();
		prepareFilter(gridState, filter);

		final List<ICountry> entities = countryService.find(filter);
		List<CountryDTO> dtos = entities.stream().map(toDtoConverter).collect(Collectors.toList());
		gridState.setTotalCount(countryService.getCount(filter));
		
		final Map<String, Object> countries = new HashMap<>();
		countries.put("gridItems", dtos);
		return new ModelAndView("country.list", countries);
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView showForm() {
		final Map<String, Object> hashMap = new HashMap<>();
		hashMap.put("formCountry", new CountryDTO());
		return new ModelAndView("country.edit", hashMap);
	}

	@RequestMapping(method = RequestMethod.POST)
	public Object save(@Valid @ModelAttribute("formCountry") final CountryDTO formCountry,
			final BindingResult result) {
		if (result.hasErrors()) {
			final Map<String, Object> hashMap = new HashMap<>();
			hashMap.put("formCountry", formCountry);
			return new ModelAndView("country.edit", hashMap);
		} else {
			final ICountry entity = fromDtoConverter.apply(formCountry);
			countryService.save(entity);
			return "redirect:/country";
		}

	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public ModelAndView viewDetails(@PathVariable(name = "id", required = true) final Integer id) {
		final ICountry dbModel = countryService.get(id);
		final CountryDTO dto = toDtoConverter.apply(dbModel);
		final Map<String, Object> hashMap = new HashMap<>();
		hashMap.put("formCountry", dto);
		hashMap.put("readonly", true);
		return new ModelAndView("country.edit", hashMap);
	}
	
	@RequestMapping(value = "/{id}/edit", method = RequestMethod.GET)
	public ModelAndView edit(@PathVariable(name = "id", required = true) final Integer id) {
		final CountryDTO dto = toDtoConverter.apply(countryService.get(id));

		final Map<String, Object> hashMap = new HashMap<>();
		hashMap.put("formCountry", dto);

		return new ModelAndView("country.edit", hashMap);
	}
	
	@RequestMapping(value = "/{id}/delete", method = RequestMethod.GET)
	public String delete(@PathVariable(name = "id", required = true) final Integer id) {
		countryService.delete(id);
		return "redirect:/country";
	}

}
