package by.itacademy.aalexandrov.poker.service.impl;

import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;
import java.util.Random;

import org.junit.jupiter.api.BeforeEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.CardStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.GameStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerPosition;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.Rank;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.Suits;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.UserRole;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.UserStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IBaseEntity;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICard;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICardInGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IChat;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICountry;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayerAction;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITiket;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITransaction;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.service.ICardInGameService;
import by.itacademy.aalexandrov.poker.service.ICardService;
import by.itacademy.aalexandrov.poker.service.IChatService;
import by.itacademy.aalexandrov.poker.service.ICountryService;
import by.itacademy.aalexandrov.poker.service.IGameService;
import by.itacademy.aalexandrov.poker.service.IPlayerActionService;
import by.itacademy.aalexandrov.poker.service.IPlayerService;
import by.itacademy.aalexandrov.poker.service.ITiketService;
import by.itacademy.aalexandrov.poker.service.ITransactionService;
import by.itacademy.aalexandrov.poker.service.IUserAccountService;

@SpringJUnitConfig(locations = "classpath:service-context-test.xml")
public abstract class AbstractTest {
	@Autowired
	protected ITiketService tiketService;
	@Autowired
	protected ICountryService countryService;
	@Autowired
	protected ITransactionService transactionService;
	@Autowired
	protected IPlayerActionService playerActionService;
	@Autowired
	protected IUserAccountService userAccountService;
	@Autowired
	protected ICardService cardService;
	@Autowired
	protected IChatService chatService;
	@Autowired
	protected IGameService gameService;
	@Autowired
	protected IPlayerService playerService;
	@Autowired
	protected ICardInGameService cardInGameService;

	private static final Random RANDOM = new Random();

	@BeforeEach
	public void setUpMethod() {
		// clean DB recursive
		tiketService.deleteAll();
		chatService.deleteAll();
		cardInGameService.deleteAll();
		cardService.deleteAll();
		playerActionService.deleteAll();
		playerService.deleteAll();
		gameService.deleteAll();
		transactionService.deleteAll();
		userAccountService.deleteAll();
		countryService.deleteAll();

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
		entity.setUserAccount(saveNewUserAccount());
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

	protected ITransaction saveNewTransaction() {
		ITransaction entity = transactionService.createEntity();
		entity.setUserAccount(saveNewUserAccount());
		entity.setAmount(getRandomObjectsCount());
		entity.setComment("comment" + getRandomPrefix());
		transactionService.save(entity);
		return entity;
	}

	protected IPlayerAction saveNewPlayerAction() {
		IPlayerAction entity = playerActionService.createEntity();
		entity.setPlayer(saveNewPlayer());
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
		entity.setCountry(saveNewCountry());
		entity.setUserRole(UserRole.MEMBER);
		entity.setUserStatus(UserStatus.ACTIVE);
		entity.setSumGames(getRandomObjectsCount());
		entity.setWonGames(getRandomObjectsCount());
		userAccountService.save(entity);
		return entity;
	}

	protected IChat saveNewChat() {
		IChat entity = chatService.createEntity();
		entity.setGame(saveNewGame());
		entity.setUserAccount(saveNewUserAccount());
		entity.setMessage(getRandomPrefix());
		chatService.save(entity);
		return entity;
	}

	protected IGame saveNewGame() {
		IGame entity = gameService.createEntity();
		entity.setState(GameStatus.ACTIVE);
		entity.setBank(getRandomObjectsCount());
		gameService.save(entity);
		return entity;
	}

	protected IPlayer saveNewPlayer() {
		IPlayer entity = playerService.createEntity();
		entity.setGame(saveNewGame());
		entity.setUserAccount(saveNewUserAccount());
		entity.setPosition(PlayerPosition.ONE);
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

	protected ICardInGame saveNewCardInGame() {
		ICardInGame entity = cardInGameService.createEntity();
		entity.setCard(saveNewCard());
		entity.setGame(saveNewGame());
		entity.setPlayer(saveNewPlayer());
		entity.setCardStatus(CardStatus.PLAYERCARDOPEN);
		cardInGameService.save(entity);
		return entity;
	}

	protected IBaseEntity verifyOrderById(List<? extends IBaseEntity> ascBrands, boolean ascending) {
		IBaseEntity previousEntity = null;
		for (IBaseEntity entity : ascBrands) {
			if (previousEntity == null) {
				previousEntity = entity;
				continue;
			}
			if (ascending) {
				assertTrue(previousEntity.getId().intValue() < entity.getId().intValue());
			} else {
				assertTrue(previousEntity.getId().intValue() > entity.getId().intValue());
			}
			previousEntity = entity;
		}
		return previousEntity;
	}

}