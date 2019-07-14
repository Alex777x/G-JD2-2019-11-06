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

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICardInGame;
import by.itacademy.aalexandrov.poker.dao.api.filter.CardInGameFilter;
import by.itacademy.aalexandrov.poker.service.ICardInGameService;
import by.itacademy.aalexandrov.poker.web.converter.CardInGameToDTOConverter;
import by.itacademy.aalexandrov.poker.web.dto.CardInGameDTO;

@Controller
@RequestMapping(value = "/cardInGame")
public class CardInGameController {

	private ICardInGameService cardInGameService;

	private CardInGameToDTOConverter toDtoConverter;

	@Autowired
	public CardInGameController(ICardInGameService cardInGameService, CardInGameToDTOConverter toDtoConverter) {
		super();
		this.cardInGameService = cardInGameService;
		this.toDtoConverter = toDtoConverter;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView index(final HttpServletRequest req) {

		final CardInGameFilter filter = new CardInGameFilter();

		final List<ICardInGame> entities = cardInGameService.find(filter);
		List<CardInGameDTO> dtos = entities.stream().map(toDtoConverter).collect(Collectors.toList());

		final Map<String, Object> models = new HashMap<>();
		models.put("gridItems", dtos);
		return new ModelAndView("cardInGame.list", models);
	}

}
