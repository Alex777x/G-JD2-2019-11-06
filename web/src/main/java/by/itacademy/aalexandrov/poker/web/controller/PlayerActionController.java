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

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayerAction;
import by.itacademy.aalexandrov.poker.dao.api.filter.PlayerActionFilter;
import by.itacademy.aalexandrov.poker.service.IPlayerActionService;
import by.itacademy.aalexandrov.poker.service.IPlayerService;
import by.itacademy.aalexandrov.poker.web.converter.PlayerActionFromDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.PlayerActionToDTOConverter;
import by.itacademy.aalexandrov.poker.web.dto.PlayerActionDTO;
import by.itacademy.aalexandrov.poker.web.dto.grid.GridStateDTO;

@Controller
@RequestMapping(value = "/playerAction")
public class PlayerActionController extends AbstractController {

	private IPlayerActionService playerActionService;

	private PlayerActionToDTOConverter toDtoConverter;

	private PlayerActionFromDTOConverter fromDtoConverter;

	private IPlayerService playerService;

	@Autowired
	public PlayerActionController(IPlayerActionService playerActionService, PlayerActionToDTOConverter toDtoConverter,
			PlayerActionFromDTOConverter fromDtoConverter, IPlayerService playerService) {
		super();
		this.playerActionService = playerActionService;
		this.toDtoConverter = toDtoConverter;
		this.fromDtoConverter = fromDtoConverter;
		this.playerService = playerService;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView index(final HttpServletRequest req,
			@RequestParam(name = "page", required = false) final Integer pageNumber,
			@RequestParam(name = "sort", required = false) final String sortColumn) {

		final GridStateDTO gridState = getListDTO(req);
		gridState.setPage(pageNumber);
		gridState.setSort(sortColumn, "id");

		final PlayerActionFilter filter = new PlayerActionFilter();
		prepareFilter(gridState, filter);

		final List<IPlayerAction> entities = playerActionService.find(filter);
		List<PlayerActionDTO> dtos = entities.stream().map(toDtoConverter).collect(Collectors.toList());
		gridState.setTotalCount(playerActionService.getCount(filter));

		final Map<String, Object> playerActions = new HashMap<>();
		playerActions.put("gridItems", dtos);
		return new ModelAndView("playerAction.list", playerActions);
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView showForm() {
		final Map<String, Object> hashMap = new HashMap<>();
		hashMap.put("formPlayerAction", new PlayerActionDTO());
		loadCommonFormPlayerActions(hashMap);
		return new ModelAndView("playerAction.edit", hashMap);
	}

	@RequestMapping(method = RequestMethod.POST)
	public Object save(@Valid @ModelAttribute("formPlayerAction") final PlayerActionDTO formPlayerAction,
			final BindingResult result) {
		if (result.hasErrors()) {
			final Map<String, Object> hashMap = new HashMap<>();
			hashMap.put("formPlayerAction", formPlayerAction);
			loadCommonFormPlayerActions(hashMap);
			return new ModelAndView("playerAction.edit", hashMap);
		} else {
			final IPlayerAction entity = fromDtoConverter.apply(formPlayerAction);
			playerActionService.save(entity);
			return "redirect:/playerAction";
		}

	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public ModelAndView viewDetails(@PathVariable(name = "id", required = true) final Integer id) {
		final IPlayerAction dbModel = playerActionService.get(id);
		final PlayerActionDTO dto = toDtoConverter.apply(dbModel);
		final Map<String, Object> hashMap = new HashMap<>();
		hashMap.put("formPlayerAction", dto);
		hashMap.put("readonly", true);
		loadCommonFormPlayerActions(hashMap);
		return new ModelAndView("playerAction.edit", hashMap);
	}

	@RequestMapping(value = "/{id}/edit", method = RequestMethod.GET)
	public ModelAndView edit(@PathVariable(name = "id", required = true) final Integer id) {
		final PlayerActionDTO dto = toDtoConverter.apply(playerActionService.get(id));

		final Map<String, Object> hashMap = new HashMap<>();
		hashMap.put("formPlayerAction", dto);
		loadCommonFormPlayerActions(hashMap);

		return new ModelAndView("playerAction.edit", hashMap);
	}

	@RequestMapping(value = "/{id}/delete", method = RequestMethod.GET)
	public String delete(@PathVariable(name = "id", required = true) final Integer id) {
		playerActionService.delete(id);
		return "redirect:/playerAction";
	}

	private void loadCommonFormPlayerActions(final Map<String, Object> hashMap) {
		final List<IPlayer> players = playerService.getAll();

		final Map<Integer, Integer> playersMap = players.stream()
				.collect(Collectors.toMap(IPlayer::getId, IPlayer::getId));
		hashMap.put("playersChoices", playersMap);
	}

}
