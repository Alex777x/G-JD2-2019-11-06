package by.itacademy.aalexandrov.poker.service.impl;

import java.util.Random;

import org.junit.jupiter.api.BeforeEach;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.GameStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerPosition;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.Rank;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.Suits;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.UserRole;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.UserStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IBoard;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICard;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IChat;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICountry;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayerAction;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayerCard;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IStatistic;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITiket;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITransaction;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.service.IBoardService;
import by.itacademy.aalexandrov.poker.service.ICardService;
import by.itacademy.aalexandrov.poker.service.IChatService;
import by.itacademy.aalexandrov.poker.service.ICountryService;
import by.itacademy.aalexandrov.poker.service.IGameService;
import by.itacademy.aalexandrov.poker.service.IPlayerActionService;
import by.itacademy.aalexandrov.poker.service.IPlayerCardService;
import by.itacademy.aalexandrov.poker.service.IPlayerService;
import by.itacademy.aalexandrov.poker.service.IStatisticService;
import by.itacademy.aalexandrov.poker.service.ITiketService;
import by.itacademy.aalexandrov.poker.service.ITransactionService;
import by.itacademy.aalexandrov.poker.service.IUserAccountService;

public abstract class AbstractTest {
	protected ITiketService tiketService = new TiketServiceImpl();
	protected ICountryService countryService = new CountryServiceImpl();
	protected IStatisticService statisticService = new StatisticServiceImpl();
	protected ITransactionService transactionService = new TransactionServiceImpl();
	protected IPlayerActionService playerActionService = new PlayerActionServiceImpl();
	protected IUserAccountService userAccountService = new UserAccountServiceImpl();
	protected ICardService cardService = new CardServiceImpl();
	protected IChatService chatService = new ChatServiceImpl();
	protected IGameService gameService = new GameServiceImpl();
	protected IPlayerService playerService = new PlayerServiceImpl();
	protected IBoardService boardService = new BoardServiceImpl();
	protected IPlayerCardService playerCardService = new PlayerCardServiceImpl();

	private static final Random RANDOM = new Random();

	@BeforeEach
	public void setUpMethod() {
		// clean DB recursive
		tiketService.deleteAll();
		gameService.deleteAll();
		chatService.deleteAll();
		boardService.deleteAll();
		playerService.deleteAll();
		playerActionService.deleteAll();
		playerCardService.deleteAll();
		cardService.deleteAll();
		userAccountService.deleteAll();
		countryService.deleteAll();
		transactionService.deleteAll();
		statisticService.deleteAll();

	}

	protected String getRandomPrefix() {
		return RANDOM.nextInt(99999) + "";
	}

	protected int getRandomObjectsCount() {
		return RANDOM.nextInt(9) + 1;
	}

	public Random getRandom() {
		return RANDOM;
	}

	protected ITiket saveNewTiket() {
		ITiket entity = tiketService.createEntity();
		entity.setUserAccountId(saveNewUserAccount());
		entity.setTiketTitle("tiket-title" + getRandomPrefix());
		entity.setTiketText("tiket-text" + getRandomPrefix());
		entity.setStatus("tiket-status" + getRandomPrefix());
		tiketService.save(entity);
		return entity;
	}

	protected ICountry saveNewCountry() {
		ICountry entity = countryService.createEntity();
		entity.setCountry("country" + getRandomPrefix());
		countryService.save(entity);
		return entity;
	}

	protected IStatistic saveNewStatistic() {
		IStatistic entity = statisticService.createEntity();
		entity.setSumGames(getRandomObjectsCount());
		entity.setWonGames(getRandomObjectsCount());
		statisticService.save(entity);
		return entity;
	}

	protected ITransaction saveNewTransaction() {
		ITransaction entity = transactionService.createEntity();
		entity.setAmount(getRandomObjectsCount());
		entity.setComment("comment" + getRandomPrefix());
		transactionService.save(entity);
		return entity;
	}

	protected IPlayerAction saveNewPlayerAction() {
		IPlayerAction entity = playerActionService.createEntity();
		entity.setBet(getRandomObjectsCount());
		entity.setCall(getRandomObjectsCount());
		entity.setRaise(getRandomObjectsCount());
		entity.setFold(false);
		entity.setCheck(true);
		entity.setAllIn(getRandomObjectsCount());
		playerActionService.save(entity);
		return entity;
	}

	protected IUserAccount saveNewUserAccount() {
		IUserAccount entity = userAccountService.createEntity();
		entity.setNickname("nickname" + getRandomPrefix());
		entity.setPassword("password" + getRandomPrefix());
		entity.setEmail("email" + getRandomPrefix());
		entity.setFoto("foto" + getRandomPrefix());
		entity.setCountryId(saveNewCountry());
		entity.setStatisticId(saveNewStatistic());
		entity.setUserRole(UserRole.MEMBER);
		entity.setUserStatus(UserStatus.ACTIVE);
		entity.setTransactionId(saveNewTransaction());
		userAccountService.save(entity);
		return entity;
	}

	protected IChat saveNewChat() {
		IChat entity = chatService.createEntity();
		entity.setGameId(saveNewGame());
		entity.setUserAccountId(saveNewUserAccount());
		entity.setMessage(getRandomPrefix());
		chatService.save(entity);
		return entity;
	}

	protected IGame saveNewGame() {
		IGame entity = gameService.createEntity();
		entity.setChatId(saveNewChat());
		entity.setPlayerId(saveNewPlayer());
		entity.setBoardId(saveNewBoard());
		entity.setState(GameStatus.ACTIVE);
		entity.setBank(getRandomObjectsCount());
		gameService.save(entity);
		return entity;
	}

	protected IPlayer saveNewPlayer() {
		IPlayer entity = playerService.createEntity();
		entity.setUserAccountId(saveNewUserAccount());
		entity.setPositionId(PlayerPosition.ONE);
		entity.setPlayerCardId(saveNewPlayerCard());
		entity.setPlayerActionId(saveNewPlayerAction());
		entity.setInGame(true);
		entity.setState(PlayerStatus.DEALER);
		entity.setStack(getRandomObjectsCount());
		playerService.save(entity);
		return entity;
	}

	protected ICard saveNewCard() {
		ICard entity = cardService.createEntity();
		entity.setSuit(Suits.HEARTS);
		entity.setRank(Rank.ACE);
		entity.setFilename(getRandomPrefix());
		cardService.save(entity);
		return entity;
	}

	protected IBoard saveNewBoard() {
		IBoard entity = boardService.createEntity();
		entity.setFlopCard1Id(saveNewCard());
		entity.setFlopCard2Id(saveNewCard());
		entity.setFlopCard3Id(saveNewCard());
		entity.setTurnCardId(saveNewCard());
		entity.setRiverCardId(saveNewCard());
		boardService.save(entity);
		return entity;
	}

	protected IPlayerCard saveNewPlayerCard() {
		IPlayerCard entity = playerCardService.createEntity();
		entity.setCard1Id(saveNewCard());
		entity.setCard2Id(saveNewCard());
		entity.setCardState(false);
		playerCardService.save(entity);
		return entity;
	}

}