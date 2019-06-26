package by.itacademy.aalexandrov.poker.service.impl;

import java.util.Random;

import org.junit.jupiter.api.BeforeEach;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.GameStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.Rank;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.Suits;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.UserRole;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.UserStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IBlackjacBoard;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IBlackjackAction;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IBlackjackPlayerCard;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICard;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IChat;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICountry;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPokerAction;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPokerBoard;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPokerPlayerCard;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IStatistic;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITiket;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITransaction;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.service.IBlackjackActionService;
import by.itacademy.aalexandrov.poker.service.IBlackjackBoardService;
import by.itacademy.aalexandrov.poker.service.IBlackjackPlayerCardService;
import by.itacademy.aalexandrov.poker.service.ICardService;
import by.itacademy.aalexandrov.poker.service.IChatService;
import by.itacademy.aalexandrov.poker.service.ICountryService;
import by.itacademy.aalexandrov.poker.service.IGameService;
import by.itacademy.aalexandrov.poker.service.IPlayerService;
import by.itacademy.aalexandrov.poker.service.IPokerActionService;
import by.itacademy.aalexandrov.poker.service.IPokerBoardService;
import by.itacademy.aalexandrov.poker.service.IPokerPlayerCardService;
import by.itacademy.aalexandrov.poker.service.IStatisticService;
import by.itacademy.aalexandrov.poker.service.ITiketService;
import by.itacademy.aalexandrov.poker.service.ITransactionService;
import by.itacademy.aalexandrov.poker.service.IUserAccountService;

public abstract class AbstractTest {
	protected ITiketService tiketService = new TiketServiceImpl();
	protected ICountryService countryService = new CountryServiceImpl();
	protected IStatisticService statisticService = new StatisticServiceImpl();
	protected ITransactionService transactionService = new TransactionServiceImpl();
	protected IPokerActionService pokerActionService = new PokerActionServiceImpl();
	protected IUserAccountService userAccountService = new UserAccountServiceImpl();
	protected IBlackjackActionService blackjackActionService = new BlackjackActionServiceImpl();
	protected IBlackjackBoardService blackjackBoardService = new BlackjackBoardServiceImpl();
	protected IBlackjackPlayerCardService blackjackPlayerCardService = new BlackjackPlayerCardServiceImpl();
	protected ICardService cardService = new CardServiceImpl();
	protected IChatService chatService = new ChatServiceImpl();
	protected IGameService gameService = new GameServiceImpl();
	protected IPlayerService playerService = new PlayerServiceImpl();
	protected IPokerBoardService pokerBoardService = new PokerBoardServiceImpl();
	protected IPokerPlayerCardService pokerPlayerCardService = new PokerPlayerCardServiceImpl();

	private static final Random RANDOM = new Random();

	@BeforeEach
	public void setUpMethod() {
		// clean DB recursive
		tiketService.deleteAll();
		pokerActionService.deleteAll();
		userAccountService.deleteAll();
		countryService.deleteAll();
		statisticService.deleteAll();
		transactionService.deleteAll();
		blackjackActionService.deleteAll();
		blackjackBoardService.deleteAll();
		blackjackPlayerCardService.deleteAll();
		cardService.deleteAll();
		chatService.deleteAll();
		gameService.deleteAll();
		playerService.deleteAll();
		pokerBoardService.deleteAll();
		pokerPlayerCardService.deleteAll();

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

	protected ITransaction saveNewTranzaction() {
		ITransaction entity = transactionService.createEntity();
		entity.setAmount(getRandomObjectsCount());
		entity.setComment("comment" + getRandomPrefix());
		transactionService.save(entity);
		return entity;
	}

	protected IPokerAction saveNewPokerAction() {
		IPokerAction entity = pokerActionService.createEntity();
		entity.setBet(getRandomObjectsCount());
		entity.setCall(getRandomObjectsCount());
		entity.setRaise(getRandomObjectsCount());
		entity.setFold(false);
		entity.setCheck(true);
		entity.setVaBank(getRandomObjectsCount());
		entity.setSmallBlind(true);
		entity.setBigBlind(false);
		pokerActionService.save(entity);
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
		entity.setUserRole(UserRole.member);
		entity.setUserStatus(UserStatus.active);
		entity.setTranzaction(saveNewTranzaction());
		userAccountService.save(entity);
		return entity;
	}

	protected IChat saveNewChat() {
		IChat entity = chatService.createEntity();
		entity.setPlayerId(saveNewPlayer());
		entity.setMessage(getRandomPrefix());
		chatService.save(entity);
		return entity;
	}

	protected IGame saveNewGame() {
		IGame entity = gameService.createEntity();
		entity.setGameStatus(GameStatus.active);
		entity.setWinnerId(saveNewUserAccount());
		entity.setNexStepPerformerId(saveNewUserAccount());
		entity.setPokerBoardId(saveNewPokerBoard());
		entity.setBank(getRandomObjectsCount());
		entity.setChatId(saveNewChat());
		gameService.save(entity);
		return entity;
	}

	protected IPlayer saveNewPlayer() {
		IPlayer entity = playerService.createEntity();
		entity.setUserAccountId(saveNewUserAccount());
		entity.setGameId(saveNewGame());
		entity.setDealer(false);
		entity.setStack(getRandomObjectsCount());
		entity.setPokerActionId(saveNewPokerAction());
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

	protected IPokerBoard saveNewPokerBoard() {
		IPokerBoard entity = pokerBoardService.createEntity();
		entity.setFlopCard1Id(saveNewCard());
		entity.setFlopCard2Id(saveNewCard());
		entity.setFlopCard3Id(saveNewCard());
		entity.setTurnCardId(saveNewCard());
		entity.setRiverCardId(saveNewCard());
		entity.setGameId(saveNewGame());
		pokerBoardService.save(entity);
		return entity;
	}

	protected IPokerPlayerCard saveNewPokerPlayerCard() {
		IPokerPlayerCard entity = pokerPlayerCardService.createEntity();
		entity.setPokerPlayerId(saveNewUserAccount());
		entity.setCard1Id(saveNewCard());
		entity.setCard2Id(saveNewCard());
		entity.setCardState(false);
		pokerPlayerCardService.save(entity);
		return entity;
	}

	protected IBlackjackPlayerCard saveNewBlackjackPlayerCard() {
		IBlackjackPlayerCard entity = blackjackPlayerCardService.createEntity();
		entity.setPlayerId(saveNewPlayer());
		entity.setCardId(saveNewCard());
		entity.setBlackjackActionId(saveNewBlackjackAction());
		entity.setStack(getRandomObjectsCount());
		blackjackPlayerCardService.save(entity);
		return entity;
	}

	protected IBlackjacBoard saveNewIBlackjacBoard() {
		IBlackjacBoard entity = blackjackBoardService.createEntity();
		entity.setGameId(saveNewGame());
		entity.setCardId(saveNewCard());
		blackjackBoardService.save(entity);
		return entity;
	}

	protected IBlackjackAction saveNewBlackjackAction() {
		IBlackjackAction entity = blackjackActionService.createEntity();
		entity.setBet(getRandomObjectsCount());
		entity.setHitMe(false);
		entity.setStop(false);
		blackjackActionService.save(entity);
		return entity;
	}

}