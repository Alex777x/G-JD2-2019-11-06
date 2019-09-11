package by.itacademy.aalexandrov.poker.web.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.common.collect.Iterables;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.CardStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.CardsCombination;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.GameStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerPosition;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICard;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICardInGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITransaction;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.service.ICardInGameService;
import by.itacademy.aalexandrov.poker.service.ICardService;
import by.itacademy.aalexandrov.poker.service.IGameService;
import by.itacademy.aalexandrov.poker.service.IPlayerActionService;
import by.itacademy.aalexandrov.poker.service.IPlayerService;
import by.itacademy.aalexandrov.poker.service.ITransactionService;
import by.itacademy.aalexandrov.poker.service.IUserAccountService;
import by.itacademy.aalexandrov.poker.service.game.PokerLogicUtils;
import by.itacademy.aalexandrov.poker.web.converter.CardInGameToDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.CardToDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.GameToDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.PlayerFromDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.PlayerToDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.TransactionToDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.UserAccountToDTOConverter;
import by.itacademy.aalexandrov.poker.web.dto.CardDTO;
import by.itacademy.aalexandrov.poker.web.dto.GameDTO;
import by.itacademy.aalexandrov.poker.web.dto.PlayerDTO;
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
	private IPlayerService playerService;
	@Autowired
	private PlayerToDTOConverter playerToDtoConverter;
	@Autowired
	private PlayerFromDTOConverter playerFromDtoConverter;
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
	CardInGameToDTOConverter cardInGameToDtoConverter;
	@Autowired
	ICardService cardService;
	@Autowired
	CardToDTOConverter cardToDtoConverter;
	@Autowired
	IPlayerActionService playerActionService;

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

		boolean tryAdd;
		if (curentGame.getState().equals(GameStatus.END)) {
			tryAdd = positions.add(pos);
		} else {
			tryAdd = false;
		}

		if (tryAdd) {
			try {
				if (playerService.findPlayer(loggedUserId)) {
					IPlayer retiringPlayer = playerService.getPlayerByUser(loggedUserId);
					retiringPlayer.setInGame(false);
					retiringPlayer.setState(PlayerStatus.INACTIVE);
					playerService.save(retiringPlayer);
				}

				newPlayer.setGame(curentGame);
				newPlayer.setUserAccount(curentUser);
				newPlayer.setPosition(pos);
				newPlayer.setInGame(true);
				newPlayer.setState(PlayerStatus.INACTIVE);
				newPlayer.setStack(balance);
				playerService.save(newPlayer);
			} catch (NullPointerException e) {

			}

		}

		return new ResponseEntity<Object>(tryAdd, HttpStatus.OK);

	}

	@RequestMapping(value = "/getPlayerData", method = RequestMethod.GET)
	public ResponseEntity<Object> getPlayerData(@RequestParam(name = "gameid", required = true) final Integer gameid) {
		Integer loggedUserId = AuthHelper.getLoggedUserId();
		IGame curentGame = gameService.getFullInfo(gameid);
		List<IPlayer> players = playerService.getPlayersByGame(gameid);
		List<PlayerDTO> dtos = players.stream().map(playerToDtoConverter).collect(Collectors.toList());
		setNickNamesForPlayers(dtos);
		Integer currentPlayer = curentGame.getActivePlayerId();
		getActivePlayer(dtos, currentPlayer);

		updateLastActivityForPlayers(players);
		PlayerDTO dto = null;
		try {
			dto = playerToDtoConverter.apply(playerService.getPlayerByUser(loggedUserId));
		} catch (Exception e) {

		}

		IPlayer entity;
		if (dto != null) {
			entity = playerFromDtoConverter.apply(dto);
			entity.setUpdated(new Date());
			playerService.save(entity);
		}

		long playersCount = playerService.getPlayersCount(gameid);
		if (playersCount <= 1) {
			curentGame.setState(GameStatus.END);
			gameService.save(curentGame);
		}

		// getUsersCurentHand(gameid, players);

		return new ResponseEntity<Object>(dtos, HttpStatus.OK);
	}

	@RequestMapping(value = "/changeGameToNew", method = RequestMethod.POST)
	public ResponseEntity<Object> changeGameToNew(
			@RequestParam(name = "gameid", required = true) final Integer gameid) {
		IGame curentGame = gameService.getFullInfo(gameid);
		curentGame.setState(GameStatus.NEW);
		gameService.save(curentGame);
		createDeckForGame(curentGame);
		List<ICardInGame> listCardsInGame = cardInGameService.getAllCardsInGameByGame(gameid, CardStatus.INDECK);
		Collections.shuffle(listCardsInGame);
		List<IPlayer> players = playerService.getPlayersByGame(gameid);
		setFirstTwoCardsForPlayers(players, listCardsInGame, gameid);
		Calendar c1 = Calendar.getInstance();
		Date dateOne = c1.getTime();
		curentGame.setActivePlayerId(players.get(0).getId());
		curentGame.setTimestampEndStep(dateOne.getTime() + 15000);
		curentGame.setState(GameStatus.ACTIVE);
		gameService.save(curentGame);
		return new ResponseEntity<Object>(HttpStatus.OK);
	}

	@RequestMapping(value = "/setFirstBet", method = RequestMethod.POST)
	public ResponseEntity<Object> setFirstBet(@RequestParam(name = "gameid", required = true) final Integer gameid) {
		Integer loggedUserId = AuthHelper.getLoggedUserId();
		IPlayer curentPlayer = playerService.getPlayerByUser(loggedUserId);
		curentPlayer.setCurentBet(10);
		playerService.save(curentPlayer);
		ITransaction transactionForBigBlindPlayer = transactionService.createEntity();
		transactionForBigBlindPlayer.setAmount(-10);
		transactionForBigBlindPlayer.setComment("firstbet");
		transactionForBigBlindPlayer.setUserAccount(curentPlayer.getUserAccount());
		transactionService.save(transactionForBigBlindPlayer);
		IGame curentGame = gameService.getFullInfo(gameid);
		curentGame.setBank(curentGame.getBank() + 10);
		gameService.save(curentGame);
		greatingNextPlayerForActiveGame(gameid, loggedUserId);
		return new ResponseEntity<Object>(HttpStatus.OK);
	}

	@RequestMapping(value = "/isActive", method = RequestMethod.POST)
	public ResponseEntity<Object> isActive(@RequestParam(name = "gameid", required = true) final Integer gameid) {
		IGame curentGame = gameService.getFullInfo(gameid);
		Integer loggedUserId = AuthHelper.getLoggedUserId();
		IPlayer curentPlayer = playerService.getPlayerByUser(loggedUserId);
		if (curentPlayer.getId().equals(curentGame.getActivePlayerId())) {
			return new ResponseEntity<Object>(true, HttpStatus.OK);
		} else {
			return new ResponseEntity<Object>(false, HttpStatus.OK);
		}
	}

	@RequestMapping(value = "/clickFold", method = RequestMethod.POST)
	public ResponseEntity<Object> clickFold(@RequestParam(name = "gameid", required = true) final Integer gameid) {
		Integer loggedUserId = AuthHelper.getLoggedUserId();
		IPlayer curentPlayer = playerService.getPlayerByUser(loggedUserId);
		greatingNextPlayerForActiveGame(gameid, loggedUserId);
		curentPlayer.setState(PlayerStatus.FINISHED);
		playerService.save(curentPlayer);
		return new ResponseEntity<Object>(HttpStatus.OK);
	}

	@RequestMapping(value = "/clickCheck", method = RequestMethod.POST)
	public ResponseEntity<Object> clickCheck(@RequestParam(name = "gameid", required = true) final Integer gameid) {
		Integer loggedUserId = AuthHelper.getLoggedUserId();
		IPlayer curentPlayer = playerService.getPlayerByUser(loggedUserId);
		List<IPlayer> players = playerService.getPlayersByGameWithStateUsual(gameid, PlayerStatus.USUAL);
		if (curentPlayer.getId().equals(players.get(0).getId())) {
			HashSet<Object> curentBets = new HashSet<>();
			for (IPlayer iPlayer : players) {
				curentBets.add(iPlayer.getCurentBet());
			}
			if (curentBets.size() == 1) {
				greatingNextPlayerForActiveGame(gameid, loggedUserId);
			} else {
				return new ResponseEntity<Object>(false, HttpStatus.OK);
			}

		} else {
			if (curentPlayer.getCurentBet() == players.get(0).getCurentBet()) {
				greatingNextPlayerForActiveGame(gameid, loggedUserId);
				return new ResponseEntity<Object>(true, HttpStatus.OK);
			} else {
				return new ResponseEntity<Object>(false, HttpStatus.OK);
			}
		}
		return new ResponseEntity<Object>(true, HttpStatus.OK);
	}

	@RequestMapping(value = "/clickCall", method = RequestMethod.POST)
	public ResponseEntity<Object> clickCall(@RequestParam(name = "gameid", required = true) final Integer gameid) {
		List<IPlayer> players = playerService.getPlayersByGameWithStateUsual(gameid, PlayerStatus.USUAL);
		IPlayer lastPlayer = Iterables.getLast(players);
		Integer loggedUserId = AuthHelper.getLoggedUserId();
		IPlayer curentPlayer = playerService.getPlayerByUser(loggedUserId);
		if (curentPlayer.getId().equals(lastPlayer.getId())) {
			curentPlayer.setCurentBet(players.get(players.size() - 2).getCurentBet());
			playerService.save(curentPlayer);
			ITransaction transactionForBigBlindPlayer = transactionService.createEntity();
			transactionForBigBlindPlayer.setAmount(-players.get(players.size() - 2).getCurentBet());
			transactionForBigBlindPlayer.setComment("call");
			transactionForBigBlindPlayer.setUserAccount(curentPlayer.getUserAccount());
			transactionService.save(transactionForBigBlindPlayer);
			IGame curentGame = gameService.getFullInfo(gameid);
			curentGame.setBank(curentGame.getBank() + curentPlayer.getCurentBet());
			gameService.save(curentGame);
			HashSet<Integer> curentBets = new HashSet<>();
			for (IPlayer iPlayer : players) {
				curentBets.add(iPlayer.getCurentBet());
			}
			if (curentBets.size() == 1) {
				greatingNextPlayerForActiveGame(gameid, loggedUserId);
			} else {
				greatingNextPlayerForActiveGameInCall(gameid, loggedUserId);
			}

			return new ResponseEntity<Object>(HttpStatus.OK);
		} else {
			List<Integer> curentBets = new ArrayList<>();
			for (IPlayer iPlayer : players) {
				curentBets.add(iPlayer.getCurentBet());
			}
			Integer i = Collections.max(curentBets);
			curentPlayer.setCurentBet(i);
			playerService.save(curentPlayer);
			ITransaction transactionForBigBlindPlayer = transactionService.createEntity();
			transactionForBigBlindPlayer.setAmount(-i);
			transactionForBigBlindPlayer.setComment("call");
			transactionForBigBlindPlayer.setUserAccount(curentPlayer.getUserAccount());
			transactionService.save(transactionForBigBlindPlayer);
			IGame curentGame = gameService.getFullInfo(gameid);
			curentGame.setBank(curentGame.getBank() + curentPlayer.getCurentBet());
			gameService.save(curentGame);
			greatingNextPlayerForActiveGame(gameid, loggedUserId);
			return new ResponseEntity<Object>(HttpStatus.OK);
		}

	}

	@RequestMapping(value = "/clickRaise", method = RequestMethod.POST)
	public ResponseEntity<Object> clickRaise(@RequestParam(name = "gameid", required = true) final Integer gameid,
			@RequestParam(name = "value", required = true) final Integer value) {
		List<IPlayer> players = playerService.getPlayersByGameWithStateUsual(gameid, PlayerStatus.USUAL);
		IPlayer lastPlayer = Iterables.getLast(players);
		Integer loggedUserId = AuthHelper.getLoggedUserId();
		IPlayer curentPlayer = playerService.getPlayerByUser(loggedUserId);
		if (value < lastPlayer.getCurentBet()) {
			return new ResponseEntity<Object>(false, HttpStatus.OK);
		} else {
			curentPlayer.setCurentBet(value);
			playerService.save(curentPlayer);
			ITransaction transactionForBigBlindPlayer = transactionService.createEntity();
			transactionForBigBlindPlayer.setAmount(-value);
			transactionForBigBlindPlayer.setComment("raise");
			transactionForBigBlindPlayer.setUserAccount(curentPlayer.getUserAccount());
			transactionService.save(transactionForBigBlindPlayer);
			IGame curentGame = gameService.getFullInfo(gameid);
			curentGame.setBank(curentGame.getBank() + value);
			gameService.save(curentGame);
			greatingNextPlayerForActiveGameInCall(gameid, loggedUserId);
			return new ResponseEntity<Object>(true, HttpStatus.OK);
		}

	}

	@RequestMapping(value = "/getGameState", method = RequestMethod.GET)
	public ResponseEntity<GameDTO> getGameState(@RequestParam(name = "gameid", required = true) final Integer gameid) {

		IGame game = gameService.getFullInfo(gameid);
		GameDTO dto = gameToDtoConverter.apply(game);
		long playersCount = playerService.getPlayersCount(gameid);
		dto.setPlaersCount(playersCount);

		return new ResponseEntity<GameDTO>(dto, HttpStatus.OK);
	}

	@RequestMapping(value = "/getWinner", method = RequestMethod.GET)
	public ResponseEntity<Object> getWinner(@RequestParam(name = "gameid", required = true) final Integer gameid) {
		List<IPlayer> players = playerService.getPlayersByGameWithStateUsual(gameid, PlayerStatus.USUAL);
		getUsersCurentHand(gameid, players);

		return new ResponseEntity<Object>(HttpStatus.OK);
	}

	private void getUsersCurentHand(final Integer gameid, List<IPlayer> players) {
		List<ICardInGame> tableCards = cardInGameService.getAllCardsInGameByGame(gameid, CardStatus.INBOARDCLOSED);
		List<ICard> cards = new ArrayList<ICard>();
		for (ICardInGame iCardInGame : tableCards) {
			ICard card = cardService.getFullInfo(iCardInGame.getCard().getId());
			cards.add(card);
		}

		for (IPlayer iPlayer : players) {
			List<ICardInGame> twoPlayerCards = cardInGameService.getPlayerCards(iPlayer.getId());
			List<ICard> cardsPlayer = new ArrayList<ICard>();
			for (ICardInGame iCardInGame : twoPlayerCards) {
				ICard card = cardService.getFullInfo(iCardInGame.getCard().getId());
				cardsPlayer.add(card);
			}
			List<ICard> handCard = new ArrayList<ICard>();
			handCard.addAll(cards);
			handCard.addAll(cardsPlayer);
			CardsCombination combination = PokerLogicUtils.resolveCombination(handCard);
			iPlayer.setCurentHand(combination);
			playerService.save(iPlayer);
		}
	}

	@RequestMapping(value = "/getThreeCards", method = RequestMethod.GET)
	public ResponseEntity<List<CardDTO>> getThreeCards(
			@RequestParam(name = "gameid", required = true) final Integer gameid) {
		List<ICardInGame> threeCards = cardInGameService.getAllCardsInGameByGame(gameid, CardStatus.INBOARDCLOSED);
//		for (ICardInGame iCardInGame : threeCards) {
//			iCardInGame.setCardStatus(CardStatus.INBOARDOPEN);
//			cardInGameService.save(iCardInGame);
//		}
		ICard card1 = cardService.getFullInfo(threeCards.get(0).getCard().getId());
		ICard card2 = cardService.getFullInfo(threeCards.get(1).getCard().getId());
		ICard card3 = cardService.getFullInfo(threeCards.get(2).getCard().getId());
		List<ICard> flop = new ArrayList<ICard>();
		flop.add(card1);
		flop.add(card2);
		flop.add(card3);
		List<CardDTO> dtos = flop.stream().map(cardToDtoConverter).collect(Collectors.toList());
		return new ResponseEntity<List<CardDTO>>(dtos, HttpStatus.OK);
	}

	@RequestMapping(value = "/getFourCards", method = RequestMethod.GET)
	public ResponseEntity<List<CardDTO>> getFourCards(
			@RequestParam(name = "gameid", required = true) final Integer gameid) {
		List<ICardInGame> fourCards = cardInGameService.getAllCardsInGameByGame(gameid, CardStatus.INBOARDCLOSED);
		ICard card1 = cardService.getFullInfo(fourCards.get(0).getCard().getId());
		ICard card2 = cardService.getFullInfo(fourCards.get(1).getCard().getId());
		ICard card3 = cardService.getFullInfo(fourCards.get(2).getCard().getId());
		ICard card4 = cardService.getFullInfo(fourCards.get(3).getCard().getId());
		List<ICard> flop = new ArrayList<ICard>();
		flop.add(card1);
		flop.add(card2);
		flop.add(card3);
		flop.add(card4);
		List<CardDTO> dtos = flop.stream().map(cardToDtoConverter).collect(Collectors.toList());
		return new ResponseEntity<List<CardDTO>>(dtos, HttpStatus.OK);
	}

	@RequestMapping(value = "/getFiveCards", method = RequestMethod.GET)
	public ResponseEntity<List<CardDTO>> getFiveCards(
			@RequestParam(name = "gameid", required = true) final Integer gameid) {
		List<ICardInGame> fourCards = cardInGameService.getAllCardsInGameByGame(gameid, CardStatus.INBOARDCLOSED);
		ICard card1 = cardService.getFullInfo(fourCards.get(0).getCard().getId());
		ICard card2 = cardService.getFullInfo(fourCards.get(1).getCard().getId());
		ICard card3 = cardService.getFullInfo(fourCards.get(2).getCard().getId());
		ICard card4 = cardService.getFullInfo(fourCards.get(3).getCard().getId());
		ICard card5 = cardService.getFullInfo(fourCards.get(4).getCard().getId());
		List<ICard> flop = new ArrayList<ICard>();
		flop.add(card1);
		flop.add(card2);
		flop.add(card3);
		flop.add(card4);
		flop.add(card5);
		List<CardDTO> dtos = flop.stream().map(cardToDtoConverter).collect(Collectors.toList());
		IGame curentGame = gameService.getFullInfo(gameid);
		curentGame.setState(GameStatus.CHECKHAND);
		gameService.save(curentGame);
		return new ResponseEntity<List<CardDTO>>(dtos, HttpStatus.OK);
	}

	@RequestMapping(value = "/getCountPlayers", method = RequestMethod.GET)
	public ResponseEntity<Integer> getCountPlayers(
			@RequestParam(name = "gameid", required = true) final Integer gameid) {
		Integer playersCount = (int) playerService.getPlayersCount(gameid);

		return new ResponseEntity<Integer>(playersCount, HttpStatus.OK);
	}

	private void getActivePlayer(List<PlayerDTO> dtop, Integer currentPlayer) {
		for (PlayerDTO playerDTO : dtop) {
			if (playerDTO.getId().equals(currentPlayer)) {
				playerDTO.setActive(true);
			} else {
				playerDTO.setActive(false);
			}

		}
	}

	private void greatingNextPlayerForActiveGame(final Integer gameid, Integer currentPlayer) {
		List<IPlayer> players = playerService.getPlayersByGameWithStateUsual(gameid, PlayerStatus.USUAL);
		IGame curentGame = gameService.getFullInfo(gameid);
		Integer loggedUserId = AuthHelper.getLoggedUserId();
		IPlayer curentPlayer = playerService.getPlayerByUser(loggedUserId);
		IPlayer lastPlayer = Iterables.getLast(players);
		if (!curentPlayer.getId().equals(lastPlayer.getId())) {
			for (IPlayer iPlayer : players) {
				if (iPlayer.getId().equals(curentPlayer.getId())) {
					int index = players.indexOf(iPlayer);
					curentGame.setActivePlayerId(players.get(index + 1).getId());
					gameService.save(curentGame);
				}
			}

		} else {
			GameStatus gameStatus = curentGame.getState();
			if (gameStatus.equals(GameStatus.NEW)) {
				curentGame.setActivePlayerId(players.get(0).getId());
				curentGame.setState(GameStatus.ACTIVE);
				gameService.save(curentGame);
			} else if (gameStatus.equals(GameStatus.ACTIVE)) {
				curentGame.setActivePlayerId(players.get(0).getId());
				curentGame.setState(GameStatus.ACTIVE2);
				gameService.save(curentGame);
			} else if (gameStatus.equals(GameStatus.ACTIVE2)) {
				curentGame.setActivePlayerId(players.get(0).getId());
				curentGame.setState(GameStatus.ACTIVE3);
				gameService.save(curentGame);
				for (IPlayer iPlayer : players) {
					iPlayer.setCurentBet(0);
					playerService.save(iPlayer);
				}
			} else if (gameStatus.equals(GameStatus.ACTIVE3)) {
				curentGame.setActivePlayerId(players.get(0).getId());
				curentGame.setState(GameStatus.ACTIVE4);
				gameService.save(curentGame);
			} else if (gameStatus.equals(GameStatus.ACTIVE4)) {
				curentGame.setActivePlayerId(players.get(0).getId());
				curentGame.setState(GameStatus.CHECKHAND);
				gameService.save(curentGame);
			}
		}

	}

	private void greatingNextPlayerForActiveGameInCall(final Integer gameid, Integer currentPlayer) {
		List<IPlayer> players = playerService.getPlayersByGameWithStateUsual(gameid, PlayerStatus.USUAL);
		IGame curentGame = gameService.getFullInfo(gameid);
		Integer loggedUserId = AuthHelper.getLoggedUserId();
		IPlayer curentPlayer = playerService.getPlayerByUser(loggedUserId);
		IPlayer lastPlayer = Iterables.getLast(players);
		if (!curentPlayer.getId().equals(lastPlayer.getId())) {
			for (IPlayer iPlayer : players) {
				if (iPlayer.getId().equals(curentPlayer.getId())) {
					int index = players.indexOf(iPlayer);
					curentGame.setActivePlayerId(players.get(index + 1).getId());
					gameService.save(curentGame);
				}
			}

		} else {
			curentGame.setActivePlayerId(players.get(0).getId());
			gameService.save(curentGame);
		}

	}

	private void setFirstTwoCardsForPlayers(List<IPlayer> players, List<ICardInGame> listCardsInGame, Integer gameid) {
		int index = 0;
		for (IPlayer iPlayer2 : players) {
			ICard card = cardService.getFullInfo(listCardsInGame.get(index).getCard().getId());
			ICardInGame cardInGame1 = listCardsInGame.get(index);
			cardInGame1.setCardStatus(CardStatus.PLAYERCARDCLOSED);
			cardInGame1.setPlayer(iPlayer2);
			cardInGameService.save(cardInGame1);
			iPlayer2.setCard1(card.getFilename());
			index++;
			ICard card2 = cardService.getFullInfo(listCardsInGame.get(index).getCard().getId());
			ICardInGame cardInGame2 = listCardsInGame.get(index);
			cardInGame2.setCardStatus(CardStatus.PLAYERCARDCLOSED);
			cardInGame2.setPlayer(iPlayer2);
			cardInGameService.save(cardInGame2);
			iPlayer2.setCard2(card2.getFilename());
			index++;
			iPlayer2.setState(PlayerStatus.USUAL);
			playerService.save(iPlayer2);
		}
		List<Object> iCardsForTable = new ArrayList<Object>();
		List<ICardInGame> listCardsInGameForTable = cardInGameService.getAllCardsInGameByGame(gameid,
				CardStatus.INDECK);
		Collections.shuffle(listCardsInGameForTable);
		for (int i = 0; i < 5; i++) {
			iCardsForTable.add(listCardsInGameForTable.get(i));
			ICardInGame cardInGame = listCardsInGameForTable.get(i);
			cardInGame.setCardStatus(CardStatus.INBOARDCLOSED);
			cardInGameService.save(cardInGame);
		}

	}

	private void createDeckForGame(IGame curentGame) {
		for (int i = 0; i < 52; i++) {
			ICardInGame newCardInGame = cardInGameService.createEntity();
			List<ICard> listCard = cardService.getFullInfo();
			newCardInGame.setCard(listCard.get(i));
			newCardInGame.setGame(curentGame);
			newCardInGame.setPlayer(null);
			newCardInGame.setCardStatus(CardStatus.INDECK);
			cardInGameService.save(newCardInGame);
		}
	}

	private void updateLastActivityForPlayers(List<IPlayer> players) {
		for (IPlayer iPlayer : players) {
			Date lastUpdated = iPlayer.getUpdated();
			long milli = lastUpdated.getTime();
			Date curentTime = new Date();
			long curentMilli = curentTime.getTime();
			long diff = curentMilli - milli;

			if (diff > 10000) {
				iPlayer.setInGame(false);
				iPlayer.setState(PlayerStatus.INACTIVE);
				playerService.save(iPlayer);
			}

		}
	}

	private void setNickNamesForPlayers(List<PlayerDTO> dtop) {
		for (PlayerDTO playerDTO : dtop) {
			IUserAccount user = userAccountService.getFullInfo(playerDTO.getUserAccountId());
			playerDTO.setNick(user.getNickname());
		}
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
