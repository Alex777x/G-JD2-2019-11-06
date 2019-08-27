package by.itacademy.aalexandrov.poker.web.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.CardStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.GameStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerPosition;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICard;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICardInGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.service.ICardInGameService;
import by.itacademy.aalexandrov.poker.service.ICardService;
import by.itacademy.aalexandrov.poker.service.IGameService;
import by.itacademy.aalexandrov.poker.service.IPlayerService;
import by.itacademy.aalexandrov.poker.service.ITransactionService;
import by.itacademy.aalexandrov.poker.service.IUserAccountService;
import by.itacademy.aalexandrov.poker.web.converter.GameFromDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.GameToDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.TransactionToDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.UserAccountToDTOConverter;
import by.itacademy.aalexandrov.poker.web.dto.GameDTO;
import by.itacademy.aalexandrov.poker.web.dto.UserAccountDTO;
import by.itacademy.aalexandrov.poker.web.security.AuthHelper;

@Controller
@RequestMapping(value = "/inGame")
public class InGameController extends AbstractController {

	@Autowired
	private IGameService gameService;
	@Autowired
	private GameToDTOConverter gameToDtoConverter;
	@Autowired
	private GameFromDTOConverter gameFromDtoConverter;
	@Autowired
	private IPlayerService playerService;
	@Autowired
	private IUserAccountService userAccountService;
	@Autowired
	private ITransactionService transactionService;
	@Autowired
	private UserAccountToDTOConverter userAccountToDtoConverter;
	@Autowired
	TransactionToDTOConverter transactionToDtoConverter;
	@Autowired
	ICardInGameService cardInGameService;
	@Autowired
	ICardService cardService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView index(@RequestParam(name = "id", required = true) Integer gameId) {
		IGame game = gameService.getFullInfo(gameId);
		Integer loggedUserId = AuthHelper.getLoggedUserId();
		IUserAccount curentUser = userAccountService.getFullInfo(loggedUserId);
		double balance = transactionService.getSumm(curentUser.getId());
		GameDTO dtog = gameToDtoConverter.apply(game);
		UserAccountDTO dto = userAccountToDtoConverter.apply(curentUser);
		final Map<String, Object> userAccount = new HashMap<>();
		userAccount.put("user", dto);
		userAccount.put("balance", balance);
		userAccount.put("game", dtog);

		return new ModelAndView("inGame.index", userAccount);
	}

	@RequestMapping(value = "/setposition", method = RequestMethod.POST)
	public ResponseEntity<Object> setPosition(@RequestParam(name = "id", required = true) final Integer id,
			@RequestParam(name = "gameid", required = true) final Integer gameid) {
		Integer loggedUserId = AuthHelper.getLoggedUserId();
		IUserAccount curentUser = userAccountService.getFullInfo(loggedUserId);
		double balance = transactionService.getSumm(curentUser.getId());
		IGame curentGame = gameService.getFullInfo(gameid);
		IPlayer newPlayer = playerService.createEntity();

		List<IPlayer> plaers = playerService.getPlayersByGame(gameid);
		PlayerPosition pos = idToString(id);
		HashSet<PlayerPosition> positions = new HashSet<>();

		for (IPlayer iPlayer : plaers) {
			PlayerPosition i = iPlayer.getPosition();
			positions.add(i);
		}

		boolean tryAdd = positions.add(pos);

		if (tryAdd) {
			try {
				if (playerService.findPlayer(loggedUserId)) {
					IPlayer retiringPlayer = playerService.getPlayerByUser(loggedUserId);
					playerService.delete(retiringPlayer.getId());
				}

				newPlayer.setGame(curentGame);
				newPlayer.setUserAccount(curentUser);
				newPlayer.setPosition(pos);
				newPlayer.setInGame(true);
				newPlayer.setState(PlayerStatus.INACTIVE);
				newPlayer.setStack(balance);
				playerService.save(newPlayer);
			} catch (NullPointerException e) {
				return new ResponseEntity<Object>("CHANGE", HttpStatus.OK);
			}

		}

		return new ResponseEntity<Object>(tryAdd, HttpStatus.OK);

	}

	@RequestMapping(value = "/gamestatus", method = RequestMethod.GET)
	public ResponseEntity<Object> getChatsInHome(@RequestParam(name = "gameid", required = true) final Integer gameid) {
		IGame curentGame = gameService.getFullInfo(gameid);
		GameStatus gameStatus = curentGame.getState();

		long playersCount = playerService.getPlayersCount(gameid);
		if (playersCount > 1 && gameStatus.equals(GameStatus.END)) {
			curentGame.setState(GameStatus.NEW);
			gameService.save(curentGame);

		}

		List<ICardInGame> listCardsInGame;
		if (gameStatus.equals(GameStatus.NEW)) {
			for (int i = 0; i < 52; i++) {
				ICardInGame newCardInGame = cardInGameService.createEntity();
				List<ICard> listCard = cardService.getFullInfo();
				newCardInGame.setCard(listCard.get(i));
				newCardInGame.setGame(curentGame);
				newCardInGame.setPlayer(null);
				newCardInGame.setCardStatus(CardStatus.INDECK);
				cardInGameService.save(newCardInGame);
				curentGame.setState(GameStatus.ACTIVE);
				gameService.save(curentGame);
			}
			listCardsInGame = cardInGameService.getAllCardsInGameByGame(gameid);
			Collections.shuffle(listCardsInGame);
		}

		if (gameStatus.equals(GameStatus.ACTIVE)) {

		}

		return new ResponseEntity<Object>(HttpStatus.OK);
	}

	private PlayerPosition idToString(final Integer id) {
		PlayerPosition pos = null;
		switch (id) {
		case 1:
			pos = PlayerPosition.ONE;
			break;
		case 2:
			pos = PlayerPosition.TWO;
			break;
		case 3:
			pos = PlayerPosition.THREE;
			break;
		case 4:
			pos = PlayerPosition.FOUR;
			break;
		case 5:
			pos = PlayerPosition.FIVE;
			break;
		case 6:
			pos = PlayerPosition.SIX;
			break;
		case 7:
			pos = PlayerPosition.SEVEN;
			break;
		case 8:
			pos = PlayerPosition.EIGHT;
			break;
		case 9:
			pos = PlayerPosition.NINE;
			break;
		case 10:
			pos = PlayerPosition.TEN;
			break;
		}
		return pos;
	}

}
