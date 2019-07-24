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
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICardInGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.dao.api.filter.CardInGameFilter;
import by.itacademy.aalexandrov.poker.service.ICardInGameService;
import by.itacademy.aalexandrov.poker.service.ICardService;
import by.itacademy.aalexandrov.poker.service.IGameService;
import by.itacademy.aalexandrov.poker.service.IPlayerService;
import by.itacademy.aalexandrov.poker.web.converter.CardInGameFromDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.CardInGameToDTOConverter;
import by.itacademy.aalexandrov.poker.web.dto.CardInGameDTO;
import by.itacademy.aalexandrov.poker.web.dto.grid.GridStateDTO;

@Controller
@RequestMapping(value = "/cardInGame")
public class CardInGameController extends AbstractController {

	private ICardInGameService cardInGameService;

	private CardInGameToDTOConverter toDtoConverter;

	private CardInGameFromDTOConverter fromDtoConverter;

	private ICardService cardService;

	private IGameService gameService;

	private IPlayerService playerService;

	@Autowired
	public CardInGameController(ICardInGameService cardInGameService, CardInGameToDTOConverter toDtoConverter,
			CardInGameFromDTOConverter fromDtoConverter, ICardService cardService, IGameService gameService,
			IPlayerService playerService) {
		super();
		this.cardInGameService = cardInGameService;
		this.toDtoConverter = toDtoConverter;
		this.fromDtoConverter = fromDtoConverter;
		this.cardService = cardService;
		this.gameService = gameService;
		this.playerService = playerService;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView index(final HttpServletRequest req,
			@RequestParam(name = "page", required = false) final Integer pageNumber,
			@RequestParam(name = "sort", required = false) final String sortColumn) {

		final GridStateDTO gridState = getListDTO(req);
		gridState.setPage(pageNumber);
		gridState.setSort(sortColumn, "id");

		final CardInGameFilter filter = new CardInGameFilter();
		prepareFilter(gridState, filter);

		final List<ICardInGame> entities = cardInGameService.find(filter);
		List<CardInGameDTO> dtos = entities.stream().map(toDtoConverter).collect(Collectors.toList());
		gridState.setTotalCount(cardInGameService.getCount(filter));
		
		final Map<String, Object> cardInGames = new HashMap<>();
		cardInGames.put("gridItems", dtos);
		return new ModelAndView("cardInGame.list", cardInGames);
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView showForm() {
		final Map<String, Object> hashMap = new HashMap<>();
		hashMap.put("formCardInGame", new CardInGameDTO());
		loadCommonFormTransactions(hashMap);
		return new ModelAndView("cardInGame.edit", hashMap);
	}

	@RequestMapping(method = RequestMethod.POST)
	public Object save(@Valid @ModelAttribute("formCardInGame") final CardInGameDTO formCardInGame,
			final BindingResult result) {
		if (result.hasErrors()) {
			final Map<String, Object> hashMap = new HashMap<>();
			hashMap.put("formCardInGame", formCardInGame);
			loadCommonFormTransactions(hashMap);
			return new ModelAndView("cardInGame.edit", hashMap);
		} else {
			final ICardInGame entity = fromDtoConverter.apply(formCardInGame);
			cardInGameService.save(entity);
			return "redirect:/cardInGame";
		}

	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public ModelAndView viewDetails(@PathVariable(name = "id", required = true) final Integer id) {
		final ICardInGame dbModel = cardInGameService.get(id);
		final CardInGameDTO dto = toDtoConverter.apply(dbModel);
		final Map<String, Object> hashMap = new HashMap<>();
		hashMap.put("formCardInGame", dto);
		hashMap.put("readonly", true);
		loadCommonFormTransactions(hashMap);
		return new ModelAndView("cardInGame.edit", hashMap);
	}
	
	@RequestMapping(value = "/{id}/edit", method = RequestMethod.GET)
	public ModelAndView edit(@PathVariable(name = "id", required = true) final Integer id) {
		final CardInGameDTO dto = toDtoConverter.apply(cardInGameService.get(id));

		final Map<String, Object> hashMap = new HashMap<>();
		hashMap.put("formCardInGame", dto);
		loadCommonFormTransactions(hashMap);

		return new ModelAndView("cardInGame.edit", hashMap);
	}
	
	@RequestMapping(value = "/{id}/delete", method = RequestMethod.GET)
	public String delete(@PathVariable(name = "id", required = true) final Integer id) {
		cardInGameService.delete(id);
		return "redirect:/cardInGame";
	}
	
	private void loadCommonFormTransactions(final Map<String, Object> hashMap) {
		final List<IGame> games = gameService.getAll();
		final List<IPlayer> players = playerService.getAll();
		final List<ICard> cards = cardService.getAll();

		final Map<Integer, Integer> gamesMap = games.stream()
				.collect(Collectors.toMap(IGame::getId, IGame::getId));
		hashMap.put("gamesChoices", gamesMap);
		
		final Map<Integer, Integer> playersMap = players.stream()
				.collect(Collectors.toMap(IPlayer::getId, IPlayer::getId));
		hashMap.put("playersChoices", playersMap);
		
		final Map<Integer, String> cardsMap = cards.stream()
				.collect(Collectors.toMap(ICard::getId, ICard::getFilename));
		hashMap.put("cardsChoices", cardsMap);
	}

}
