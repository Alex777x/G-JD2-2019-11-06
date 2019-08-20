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

import by.itacademy.aalexandrov.poker.dao.api.entity.table.INews;
import by.itacademy.aalexandrov.poker.dao.api.filter.NewsFilter;
import by.itacademy.aalexandrov.poker.service.INewsService;
import by.itacademy.aalexandrov.poker.web.converter.NewsFromDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.NewsToDTOConverter;
import by.itacademy.aalexandrov.poker.web.dto.NewsDTO;
import by.itacademy.aalexandrov.poker.web.dto.grid.GridStateDTO;

@Controller
@RequestMapping(value = "/news")
public class NewsController extends AbstractController {

	private INewsService newsService;

	private NewsToDTOConverter toDtoConverter;

	private NewsFromDTOConverter fromDtoConverter;

	@Autowired
	public NewsController(INewsService newsService, NewsToDTOConverter toDtoConverter,
			NewsFromDTOConverter fromDtoConverter) {
		super();
		this.newsService = newsService;
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

		NewsFilter filter = new NewsFilter();
		prepareFilter(gridState, filter);

		List<INews> entities = newsService.find(filter);
		List<NewsDTO> dtos = entities.stream().map(toDtoConverter).collect(Collectors.toList());
		gridState.setTotalCount(newsService.getCount(filter));

		Map<String, Object> news = new HashMap<>();
		news.put("gridItems", dtos);
		return new ModelAndView("news.list", news);
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView showForm() {
		final Map<String, Object> hashMap = new HashMap<>();
		hashMap.put("formNews", new NewsDTO());
		return new ModelAndView("news.edit", hashMap);
	}

	@RequestMapping(method = RequestMethod.POST)
	public Object save(@Valid @ModelAttribute("formNews") final NewsDTO formNews, final BindingResult result) {
		if (result.hasErrors()) {
			final Map<String, Object> hashMap = new HashMap<>();
			hashMap.put("formNews", formNews);
			return new ModelAndView("news.edit", hashMap);
		} else {
			final INews entity = fromDtoConverter.apply(formNews);
			newsService.save(entity);
			return "redirect:/news";
		}

	}

	@RequestMapping(value = "/{id}/edit", method = RequestMethod.GET)
	public ModelAndView edit(@PathVariable(name = "id", required = true) final Integer id) {
		final NewsDTO dto = toDtoConverter.apply(newsService.get(id));
		final Map<String, Object> hashMap = new HashMap<>();
		hashMap.put("formNews", dto);

		return new ModelAndView("news.edit", hashMap);
	}

	@RequestMapping(value = "/{id}/delete", method = RequestMethod.GET)
	public String delete(@PathVariable(name = "id", required = true) final Integer id) {
		newsService.delete(id);
		return "redirect:/news";
	}

}
