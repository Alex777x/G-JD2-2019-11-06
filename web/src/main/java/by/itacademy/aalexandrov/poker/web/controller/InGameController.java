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

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.CardStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.GameStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerPosition;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICard;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICardInGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayerAction;
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
					// playerActionService.delete(retiringPlayer.getId());
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

	@RequestMapping(value = "/gamestatus", method = RequestMethod.GET)
	public ResponseEntity<Object> getGameStatus(@RequestParam(name = "gameid", required = true) final Integer gameid) {
		IGame curentGame = gameService.getFullInfo(gameid);
		Integer loggedUserId = AuthHelper.getLoggedUserId();
		GameStatus gameStatus = curentGame.getState();

		List<IPlayer> players = playerService.getPlayersByGame(gameid);

		for (IPlayer iPlayer : players) {
			Date lastUpdated = iPlayer.getUpdated();
			long milli = lastUpdated.getTime();
			Date curentTime = new Date();
			long curentMilli = curentTime.getTime();
			long diff = curentMilli - milli;

			if (diff > 10000) {
				iPlayer.setInGame(false);
				iPlayer.setState(PlayerStatus.INACTIVE);
				// playerActionService.delete(iPlayer.getId());
				playerService.save(iPlayer);
			}

		}

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
		if (playersCount > 1 && gameStatus.equals(GameStatus.END)) {
			curentGame.setState(GameStatus.NEW);
			gameService.save(curentGame);

		}
		if (playersCount <= 1) {
			curentGame.setState(GameStatus.END);
			gameService.save(curentGame);
		}

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
			List<ICardInGame> listCardsInGame = cardInGameService.getAllCardsInGameByGame(gameid, CardStatus.INDECK);
			Collections.shuffle(listCardsInGame);

			int index = 0;
			for (IPlayer iPlayer2 : players) {
				ICard card = cardService.getFullInfo(listCardsInGame.get(index).getCard().getId());
				ICardInGame cardInGame1 = listCardsInGame.get(index);
				cardInGame1.setCardStatus(CardStatus.PLAYERCARDCLOSED);
				cardInGameService.save(cardInGame1);
				iPlayer2.setCard1(card.getFilename());
				index++;
				ICard card2 = cardService.getFullInfo(listCardsInGame.get(index).getCard().getId());
				ICardInGame cardInGame2 = listCardsInGame.get(index);
				cardInGame2.setCardStatus(CardStatus.PLAYERCARDCLOSED);
				cardInGameService.save(cardInGame2);
				iPlayer2.setCard2(card2.getFilename());
				index++;
				iPlayer2.setState(PlayerStatus.DEALER);
				playerService.save(iPlayer2);
			}
			Calendar c1 = Calendar.getInstance();
			Date dateOne = c1.getTime();
			IGame game = gameService.getFullInfo(gameid);
			game.setActivePlayerId(players.get(0).getId());
			game.setTimestampEndStep(dateOne.getTime() + 15000);
			gameService.save(game);
		}

		if (gameStatus.equals(GameStatus.ACTIVE)) {
			List<PlayerDTO> dtop = players.stream().map(playerToDtoConverter).collect(Collectors.toList());
			setNickNamesForPlayers(dtop);
			IGame game = gameService.getFullInfo(gameid);
			Integer currentPlayer = game.getActivePlayerId();
			for (PlayerDTO playerDTO : dtop) {
				if (playerDTO.getId().equals(currentPlayer)) {
					playerDTO.setActive(true);
				} else {
					playerDTO.setActive(false);
				}
			}
			return new ResponseEntity<Object>(dtop, HttpStatus.OK);
		}

		if (gameStatus.equals(GameStatus.ACTIVE2)) {
			List<Object> iCardsForTable = new ArrayList<Object>();
			List<ICardInGame> listCardsInGame = cardInGameService.getAllCardsInGameByGame(gameid, CardStatus.INDECK);
			Collections.shuffle(listCardsInGame);
			for (int i = 0; i < 5; i++) {
				iCardsForTable.add(listCardsInGame.get(i));
			}
			return new ResponseEntity<Object>(iCardsForTable, HttpStatus.OK);
		}

		List<PlayerDTO> dtop = players.stream().map(playerToDtoConverter).collect(Collectors.toList());
		setNickNamesForPlayers(dtop);
		return new ResponseEntity<Object>(dtop, HttpStatus.OK);
	}

	@RequestMapping(value = "/getPlayerCards", method = RequestMethod.GET)
	public ResponseEntity<PlayerDTO> getPlayerCard(
			@RequestParam(name = "gameid", required = true) final Integer gameid) {
		Integer loggedUserId = AuthHelper.getLoggedUserId();
		IPlayer player = null;
		try {
			player = playerService.getPlayerByUserAccunt(loggedUserId);
		} catch (NullPointerException e) {

		}

		PlayerDTO dto = playerToDtoConverter.apply(player);
		return new ResponseEntity<PlayerDTO>(dto, HttpStatus.OK);
	}

	@RequestMapping(value = "/getGameState", method = RequestMethod.GET)
	public ResponseEntity<GameDTO> getGameState(@RequestParam(name = "gameid", required = true) final Integer gameid) {

		IGame game = gameService.getFullInfo(gameid);
		GameDTO dto = gameToDtoConverter.apply(game);
		long playersCount = playerService.getPlayersCount(gameid);
		dto.setPlaersCount(playersCount);
		return new ResponseEntity<GameDTO>(dto, HttpStatus.OK);
	}

	@RequestMapping(value = "/changeActivePlayer", method = RequestMethod.GET)
	public ResponseEntity<GameDTO> changeActivePlayer(
			@RequestParam(name = "gameid", required = true) final Integer gameid) {

		IGame game = gameService.getFullInfo(gameid);
		Integer currentPlayer = game.getActivePlayerId();

		List<IPlayer> players = playerService.getPlayersByGame(gameid);
		for (IPlayer iPlayer : players) {
			if (iPlayer.getId().equals(currentPlayer)) {
				int index = players.indexOf(iPlayer);
				try {
					game.setActivePlayerId(players.get(index + 1).getId());
					gameService.save(game);
				} catch (IndexOutOfBoundsException e) {
					game.setState(GameStatus.ACTIVE2);
					gameService.save(game);
				}

				Calendar c1 = Calendar.getInstance();
				Date dateOne = c1.getTime();
				game.setTimestampEndStep(dateOne.getTime() + 15000);
				gameService.save(game);
			}
		}

		GameDTO dto = gameToDtoConverter.apply(game);

		return new ResponseEntity<GameDTO>(dto, HttpStatus.OK);
	}

	@RequestMapping(value = "/getCountPlayers", method = RequestMethod.GET)
	public ResponseEntity<Integer> getCountPlayers(
			@RequestParam(name = "gameid", required = true) final Integer gameid) {
		Integer playersCount = (int) playerService.getPlayersCount(gameid);

		return new ResponseEntity<Integer>(playersCount, HttpStatus.OK);
	}

	@RequestMapping(value = "/setBetsForTwoPlayers", method = RequestMethod.GET)
	public ResponseEntity<List<PlayerDTO>> setBetsForTwoPlayers(
			@RequestParam(name = "gameid", required = true) final Integer gameid) {
		List<IPlayer> players = playerService.getPlayersByGame(gameid);
		List<PlayerDTO> dtos = players.stream().map(playerToDtoConverter).collect(Collectors.toList());
		dtos.get(0).setCurentBet(10);
		dtos.get(1).setCurentBet(10);
		dtos.get(0).setStack(dtos.get(0).getStack() - 10);
		dtos.get(1).setStack(dtos.get(1).getStack() - 10);
		IPlayerAction setBet = playerActionService.createEntity();
		setBet.setPlayer(players.get(0));
		setBet.setBet(5);
		playerActionService.save(setBet);
		IPlayerAction setBet2 = playerActionService.createEntity();
		setBet2.setPlayer(players.get(1));
		setBet2.setBet(10);
		playerActionService.save(setBet2);
		IUserAccount user1 = userAccountService.getFullInfo(dtos.get(0).getUserAccountId());
		IUserAccount user2 = userAccountService.getFullInfo(dtos.get(1).getUserAccountId());
		ITransaction transaction1 = transactionService.createEntity();
		transaction1.setComment("preflop");
		transaction1.setUserAccount(user1);
		transaction1.setAmount(-10);
		transactionService.save(transaction1);
		ITransaction transaction2 = transactionService.createEntity();
		transaction2.setComment("preflop");
		transaction2.setUserAccount(user2);
		transaction2.setAmount(-10);
		transactionService.save(transaction2);
		IGame curentGame = gameService.getFullInfo(gameid);
		curentGame.setState(GameStatus.ACTIVE2);
		curentGame.setBank(20);
		gameService.save(curentGame);
		return new ResponseEntity<List<PlayerDTO>>(dtos, HttpStatus.OK);
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
