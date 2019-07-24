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

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.filter.GameFilter;
import by.itacademy.aalexandrov.poker.service.IGameService;
import by.itacademy.aalexandrov.poker.web.converter.GameFromDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.GameToDTOConverter;
import by.itacademy.aalexandrov.poker.web.dto.GameDTO;
import by.itacademy.aalexandrov.poker.web.dto.grid.GridStateDTO;

@Controller
@RequestMapping(value = "/game")
public class GameController extends AbstractController {

	private IGameService gameService;

	private GameToDTOConverter toDtoConverter;

	private GameFromDTOConverter fromDtoConverter;

	@Autowired
	public GameController(IGameService gameService, GameToDTOConverter toDtoConverter,
			GameFromDTOConverter fromDtoConverter) {
		super();
		this.gameService = gameService;
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

		final GameFilter filter = new GameFilter();
		prepareFilter(gridState, filter);

		final List<IGame> entities = gameService.find(filter);
		List<GameDTO> dtos = entities.stream().map(toDtoConverter).collect(Collectors.toList());
		gridState.setTotalCount(gameService.getCount(filter));
		
		final Map<String, Object> games = new HashMap<>();
		games.put("gridItems", dtos);
		return new ModelAndView("game.list", games);
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView showForm() {
		final Map<String, Object> hashMap = new HashMap<>();
		hashMap.put("formGame", new GameDTO());
		return new ModelAndView("game.edit", hashMap);
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public Object save(@Valid @ModelAttribute("formGame") final GameDTO formGame,
			final BindingResult result) {
		if (result.hasErrors()) {
			final Map<String, Object> hashMap = new HashMap<>();
			hashMap.put("formGame", formGame);
			return new ModelAndView("game.edit", hashMap);
		} else {
			final IGame entity = fromDtoConverter.apply(formGame);
			gameService.save(entity);
			return "redirect:/game";
		}

	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public ModelAndView viewDetails(@PathVariable(name = "id", required = true) final Integer id) {
		final IGame dbModel = gameService.get(id);
		final GameDTO dto = toDtoConverter.apply(dbModel);
		final Map<String, Object> hashMap = new HashMap<>();
		hashMap.put("formGame", dto);
		hashMap.put("readonly", true);
		return new ModelAndView("game.edit", hashMap);
	}
	
	@RequestMapping(value = "/{id}/edit", method = RequestMethod.GET)
	public ModelAndView edit(@PathVariable(name = "id", required = true) final Integer id) {
		final GameDTO dto = toDtoConverter.apply(gameService.get(id));

		final Map<String, Object> hashMap = new HashMap<>();
		hashMap.put("formGame", dto);

		return new ModelAndView("game.edit", hashMap);
	}
	
	@RequestMapping(value = "/{id}/delete", method = RequestMethod.GET)
	public String delete(@PathVariable(name = "id", required = true) final Integer id) {
		gameService.delete(id);
		return "redirect:/game";
	}

}