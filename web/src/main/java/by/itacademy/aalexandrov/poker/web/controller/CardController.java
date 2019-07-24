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

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICard;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITransaction;
import by.itacademy.aalexandrov.poker.dao.api.filter.CardFilter;
import by.itacademy.aalexandrov.poker.service.ICardService;
import by.itacademy.aalexandrov.poker.web.converter.CardFromDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.CardToDTOConverter;
import by.itacademy.aalexandrov.poker.web.dto.CardDTO;
import by.itacademy.aalexandrov.poker.web.dto.TransactionDTO;
import by.itacademy.aalexandrov.poker.web.dto.grid.GridStateDTO;

@Controller
@RequestMapping(value = "/card")
public class CardController extends AbstractController {

	private ICardService cardService;

	private CardToDTOConverter toDtoConverter;

	private CardFromDTOConverter fromDtoConverter;

	@Autowired
	public CardController(ICardService cardService, CardToDTOConverter toDtoConverter,
			CardFromDTOConverter fromDtoConverter) {
		super();
		this.cardService = cardService;
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

		final CardFilter filter = new CardFilter();
		prepareFilter(gridState, filter);

		final List<ICard> entities = cardService.find(filter);
		List<CardDTO> dtos = entities.stream().map(toDtoConverter).collect(Collectors.toList());
		gridState.setTotalCount(cardService.getCount(filter));
		
		final Map<String, Object> cards = new HashMap<>();
		cards.put("gridItems", dtos);
		return new ModelAndView("card.list", cards);
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView showForm() {
		final Map<String, Object> hashMap = new HashMap<>();
		hashMap.put("formCard", new CardDTO());
		return new ModelAndView("card.edit", hashMap);
	}

	@RequestMapping(method = RequestMethod.POST)
	public Object save(@Valid @ModelAttribute("formCard") final CardDTO formCard,
			final BindingResult result) {
		if (result.hasErrors()) {
			final Map<String, Object> hashMap = new HashMap<>();
			hashMap.put("formCard", formCard);
			return new ModelAndView("card.edit", hashMap);
		} else {
			final ICard entity = fromDtoConverter.apply(formCard);
			cardService.save(entity);
			return "redirect:/card";
		}

	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public ModelAndView viewDetails(@PathVariable(name = "id", required = true) final Integer id) {
		final ICard dbModel = cardService.get(id);
		final CardDTO dto = toDtoConverter.apply(dbModel);
		final Map<String, Object> hashMap = new HashMap<>();
		hashMap.put("formCard", dto);
		hashMap.put("readonly", true);
		return new ModelAndView("card.edit", hashMap);
	}
	
	@RequestMapping(value = "/{id}/edit", method = RequestMethod.GET)
	public ModelAndView edit(@PathVariable(name = "id", required = true) final Integer id) {
		final CardDTO dto = toDtoConverter.apply(cardService.get(id));

		final Map<String, Object> hashMap = new HashMap<>();
		hashMap.put("formCard", dto);

		return new ModelAndView("card.edit", hashMap);
	}
	
	@RequestMapping(value = "/{id}/delete", method = RequestMethod.GET)
	public String delete(@PathVariable(name = "id", required = true) final Integer id) {
		cardService.delete(id);
		return "redirect:/card";
	}

}
