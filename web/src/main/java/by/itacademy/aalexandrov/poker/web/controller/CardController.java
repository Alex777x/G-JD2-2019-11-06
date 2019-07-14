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

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICard;
import by.itacademy.aalexandrov.poker.dao.api.filter.CardFilter;
import by.itacademy.aalexandrov.poker.service.ICardService;
import by.itacademy.aalexandrov.poker.web.converter.CardToDTOConverter;
import by.itacademy.aalexandrov.poker.web.dto.CardDTO;

@Controller
@RequestMapping(value = "/card")
public class CardController {

	private ICardService cardService;

	private CardToDTOConverter toDtoConverter;

	@Autowired
	public CardController(ICardService cardService, CardToDTOConverter toDtoConverter) {
		super();
		this.cardService = cardService;
		this.toDtoConverter = toDtoConverter;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView index(final HttpServletRequest req) {

		final CardFilter filter = new CardFilter();

		final List<ICard> entities = cardService.find(filter);
		List<CardDTO> dtos = entities.stream().map(toDtoConverter).collect(Collectors.toList());

		final Map<String, Object> models = new HashMap<>();
		models.put("gridItems", dtos);
		return new ModelAndView("card.list", models);
	}

}
