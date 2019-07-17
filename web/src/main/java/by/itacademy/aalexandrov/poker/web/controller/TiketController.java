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

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITiket;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.dao.api.filter.TiketFilter;
import by.itacademy.aalexandrov.poker.service.ITiketService;
import by.itacademy.aalexandrov.poker.service.IUserAccountService;
import by.itacademy.aalexandrov.poker.web.converter.TiketFromDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.TiketToDTOConverter;
import by.itacademy.aalexandrov.poker.web.dto.TiketDTO;
import by.itacademy.aalexandrov.poker.web.dto.grid.GridStateDTO;

@Controller
@RequestMapping(value = "/tiket")
public class TiketController extends AbstractController {

	private ITiketService tiketService;

	private TiketToDTOConverter toDtoConverter;

	private TiketFromDTOConverter fromDtoConverter;

	private IUserAccountService userAccountService;

	@Autowired
	public TiketController(ITiketService tiketService, TiketToDTOConverter toDtoConverter,
			TiketFromDTOConverter fromDtoConverter, IUserAccountService userAccountService) {
		super();
		this.tiketService = tiketService;
		this.toDtoConverter = toDtoConverter;
		this.fromDtoConverter = fromDtoConverter;
		this.userAccountService = userAccountService;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView index(final HttpServletRequest req,
			@RequestParam(name = "page", required = false) final Integer pageNumber,
			@RequestParam(name = "sort", required = false) final String sortColumn) {

		final GridStateDTO gridState = getListDTO(req);
		gridState.setPage(pageNumber);
		gridState.setSort(sortColumn, "id");

		final TiketFilter filter = new TiketFilter();
		prepareFilter(gridState, filter);

		final List<ITiket> entities = tiketService.find(filter);
		List<TiketDTO> dtos = entities.stream().map(toDtoConverter).collect(Collectors.toList());
		gridState.setTotalCount(tiketService.getCount(filter));

		final Map<String, Object> tikets = new HashMap<>();
		tikets.put("gridItems", dtos);
		return new ModelAndView("tiket.list", tikets);
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView showForm() {
		final Map<String, Object> hashMap = new HashMap<>();
		//final ITiket newEntity = tiketService.createEntity();
		hashMap.put("formTiket", new TiketDTO());
		loadCommonFormUserAccounts(hashMap);
		return new ModelAndView("tiket.edit", hashMap);
	}

	@RequestMapping(method = RequestMethod.POST)
	public Object save(@Valid @ModelAttribute("formTiket") final TiketDTO formTiket, final BindingResult result) {
		if (result.hasErrors()) {
			final Map<String, Object> hashMap = new HashMap<>();
			hashMap.put("formTiket", formTiket);
			loadCommonFormUserAccounts(hashMap);
			return new ModelAndView("tiket.edit", hashMap);
		} else {
			final ITiket entity = fromDtoConverter.apply(formTiket);
			tiketService.save(entity);
			return "redirect:/tiket";
		}
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public ModelAndView viewDetails(@PathVariable(name = "id", required = true) final Integer id) {
		final ITiket dbModel = tiketService.get(id);
		final TiketDTO dto = toDtoConverter.apply(dbModel);
		final Map<String, Object> hashMap = new HashMap<>();
		hashMap.put("formTiket", dto);
		hashMap.put("readonly", true);
		loadCommonFormUserAccounts(hashMap);
		return new ModelAndView("tiket.edit", hashMap);
	}

	@RequestMapping(value = "/{id}/edit", method = RequestMethod.GET)
	public ModelAndView edit(@PathVariable(name = "id", required = true) final Integer id) {
		final TiketDTO dto = toDtoConverter.apply(tiketService.get(id));

		final Map<String, Object> hashMap = new HashMap<>();
		hashMap.put("formTiket", dto);
		loadCommonFormUserAccounts(hashMap);

		return new ModelAndView("tiket.edit", hashMap);
	}

	@RequestMapping(value = "/{id}/delete", method = RequestMethod.GET)
	public String delete(@PathVariable(name = "id", required = true) final Integer id) {
		tiketService.delete(id);
		return "redirect:/tiket";
	}

	private void loadCommonFormUserAccounts(final Map<String, Object> hashMap) {
		final List<IUserAccount> userAccounts = userAccountService.getAll();

		final Map<Integer, String> userAccountsMap = userAccounts.stream()
				.collect(Collectors.toMap(IUserAccount::getId, IUserAccount::getNickname));
		hashMap.put("userAccountsChoices", userAccountsMap);
	}

}