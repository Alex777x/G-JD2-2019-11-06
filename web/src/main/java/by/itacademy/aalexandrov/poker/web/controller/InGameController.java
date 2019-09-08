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
import by.itacademy.aalexandrov.poker.web.converter.GameToDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.PlayerFromDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.PlayerToDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.TransactionToDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.UserAccountToDTOConverter;
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
	ICardService cardService;
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
		curentPlayer.setState(PlayerStatus.FINISHED);
		playerService.save(curentPlayer);
		greatingNextPlayerForActiveGame(gameid, loggedUserId);
		return new ResponseEntity<Object>(HttpStatus.OK);
	}

//	@RequestMapping(value = "/gamestatus", method = RequestMethod.GET)
//	public ResponseEntity<Object> getGameStatus(@RequestParam(name = "gameid", required = true) final Integer gameid) {
//		IGame curentGame = gameService.getFullInfo(gameid);
//		Integer loggedUserId = AuthHelper.getLoggedUserId();
//		GameStatus gameStatus = curentGame.getState();
//
//		List<IPlayer> players = playerService.getPlayersByGame(gameid);
//
//		updateLastActivityForPlayers(players);
//
//		PlayerDTO dto = null;
//		try {
//			dto = playerToDtoConverter.apply(playerService.getPlayerByUser(loggedUserId));
//		} catch (Exception e) {
//
//		}
//
//		IPlayer entity;
//		if (dto != null) {
//			entity = playerFromDtoConverter.apply(dto);
//			entity.setUpdated(new Date());
//			playerService.save(entity);
//		}
//
//		// changeGameStateToNewOrEnd(gameid, curentGame, gameStatus);
//		long playersCount = playerService.getPlayersCount(gameid);
//		if (playersCount > 1 && gameStatus.equals(GameStatus.END)) {
//			curentGame.setState(GameStatus.NEW);
//			gameService.save(curentGame);
//
//		}
//		if (playersCount <= 1) {
//			curentGame.setState(GameStatus.END);
//			gameService.save(curentGame);
//		}
//
//		if (gameStatus.equals(GameStatus.NEW)) {
//			createDeckForGame(curentGame);
//			List<ICardInGame> listCardsInGame = cardInGameService.getAllCardsInGameByGame(gameid, CardStatus.INDECK);
//			Collections.shuffle(listCardsInGame);
//			setFirstTwoCardsForPlayers(players, listCardsInGame);
//			setFirstPlayerAsActive(gameid, players);
//			curentGame.setState(GameStatus.SETBLINDS);
//			gameService.save(curentGame);
//
//		} else if (gameStatus.equals(GameStatus.SETBLINDS)) {
//			IGame game = gameService.getFullInfo(gameid);
//			Integer currentPlayer = game.getActivePlayerId();
//
//			IPlayer playerSmallBlind = playerService.getPlayerSmallBlind(gameid, PlayerStatus.SMALLBLIND);
//			playerSmallBlind.setCurentBet(5);
//			playerService.save(playerSmallBlind);
//			IPlayer playerBigBlind = playerService.getPlayerSmallBlind(gameid, PlayerStatus.BIGBLIND);
//			playerBigBlind.setCurentBet(10);
//			playerService.save(playerBigBlind);
//
//			ITransaction transactionForSmallBlindPlayer = transactionService.createEntity();
//			transactionForSmallBlindPlayer.setAmount(-5);
//			transactionForSmallBlindPlayer.setComment("smallblind");
//			transactionForSmallBlindPlayer.setUserAccount(playerSmallBlind.getUserAccount());
//			transactionService.save(transactionForSmallBlindPlayer);
//			ITransaction transactionForBigBlindPlayer = transactionService.createEntity();
//			transactionForBigBlindPlayer.setAmount(-10);
//			transactionForBigBlindPlayer.setComment("bigblind");
//			transactionForBigBlindPlayer.setUserAccount(playerBigBlind.getUserAccount());
//			transactionService.save(transactionForBigBlindPlayer);
//
//			List<PlayerDTO> dtop = players.stream().map(playerToDtoConverter).collect(Collectors.toList());
//			setNickNamesForPlayers(dtop);
//			getActivePlayer(dtop, currentPlayer);
//			curentGame.setState(GameStatus.ACTIVE);
//			curentGame.setBank(15);
//			gameService.save(curentGame);
//			return new ResponseEntity<Object>(dtop, HttpStatus.OK);
//
//		} else if (gameStatus.equals(GameStatus.ACTIVE)) {
//			List<PlayerDTO> dtop = players.stream().map(playerToDtoConverter).collect(Collectors.toList());
//			setNickNamesForPlayers(dtop);
//
//			return new ResponseEntity<Object>(dtop, HttpStatus.OK);
//
//		} else if (gameStatus.equals(GameStatus.ACTIVE2)) {
//			List<Object> iCardsForTable = new ArrayList<Object>();
//			List<ICardInGame> listCardsInGame = cardInGameService.getAllCardsInGameByGame(gameid, CardStatus.INDECK);
//			Collections.shuffle(listCardsInGame);
//			for (int i = 0; i < 5; i++) {
//				iCardsForTable.add(listCardsInGame.get(i));
//			}
//			return new ResponseEntity<Object>(iCardsForTable, HttpStatus.OK);
//
//		} else if (gameStatus.equals(GameStatus.ACTIVE3)) {
//
//		} else if (gameStatus.equals(GameStatus.ACTIVE4)) {
//
//		} else if (gameStatus.equals(GameStatus.OLD)) {
//
//		}
//
//		List<PlayerDTO> dtop = players.stream().map(playerToDtoConverter).collect(Collectors.toList());
//		setNickNamesForPlayers(dtop);
//		return new ResponseEntity<Object>(dtop, HttpStatus.OK);
//	}

	@RequestMapping(value = "/getGameState", method = RequestMethod.GET)
	public ResponseEntity<GameDTO> getGameState(@RequestParam(name = "gameid", required = true) final Integer gameid) {

		IGame game = gameService.getFullInfo(gameid);
		GameDTO dto = gameToDtoConverter.apply(game);
		long playersCount = playerService.getPlayersCount(gameid);
		dto.setPlaersCount(playersCount);

		return new ResponseEntity<GameDTO>(dto, HttpStatus.OK);
	}

	@RequestMapping(value = "/getThreeCards", method = RequestMethod.GET)
	public ResponseEntity<Object> getThreeCards(@RequestParam(name = "gameid", required = true) final Integer gameid) {

		return new ResponseEntity<Object>(HttpStatus.OK);
	}

//	@RequestMapping(value = "/changeActivePlayer", method = RequestMethod.GET)
//	public ResponseEntity<GameDTO> changeActivePlayer(
//			@RequestParam(name = "gameid", required = true) final Integer gameid) {
//
//		IGame game = gameService.getFullInfo(gameid);
//		Integer currentPlayer = game.getActivePlayerId();
//
//		greatingNextPlayer(gameid, game, currentPlayer);
//
//		GameDTO dto = gameToDtoConverter.apply(game);
//
//		return new ResponseEntity<GameDTO>(dto, HttpStatus.OK);
//	}

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
		List<IPlayer> players = playerService.getPlayersByGame(gameid);
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
			curentGame.setState(GameStatus.ACTIVE2);
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
