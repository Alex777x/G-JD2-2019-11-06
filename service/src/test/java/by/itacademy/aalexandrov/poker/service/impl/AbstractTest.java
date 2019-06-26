package by.itacademy.aalexandrov.poker.service.impl;

import java.util.Random;

import org.junit.jupiter.api.BeforeEach;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.UserRole;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.UserStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICountry;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPokerAction;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IStatistic;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITiket;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITranzaction;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.service.ICountryService;
import by.itacademy.aalexandrov.poker.service.IPokerActionService;
import by.itacademy.aalexandrov.poker.service.IStatisticService;
import by.itacademy.aalexandrov.poker.service.ITiketService;
import by.itacademy.aalexandrov.poker.service.ITranzactionService;
import by.itacademy.aalexandrov.poker.service.IUserAccountService;

public abstract class AbstractTest {
	protected ITiketService tiketService = new TiketServiceImpl();
	protected ICountryService countryService = new CountryServiceImpl();
	protected IStatisticService statisticService = new StatisticServiceImpl();
	protected ITranzactionService tranzactionService = new TranzactionServiceImpl();
	protected IPokerActionService pokerActionService = new PokerActionServiceImpl();
	protected IUserAccountService userAccountService = new UserAccountServiceImpl();

	private static final Random RANDOM = new Random();

	@BeforeEach
	public void setUpMethod() {
		// clean DB recursive
		userAccountService.deleteAll();
		tiketService.deleteAll();
		countryService.deleteAll();
		statisticService.deleteAll();
		tranzactionService.deleteAll();
		pokerActionService.deleteAll();
		

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

	protected ITranzaction saveNewTranzaction() {
		ITranzaction entity = tranzactionService.createEntity();
		entity.setAmount(getRandomObjectsCount());
		entity.setComment("comment" + getRandomPrefix());
		tranzactionService.save(entity);
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
		entity.setCountry(saveNewCountry());
		entity.setStatisticId(saveNewStatistic());
		entity.setUserRole(UserRole.member);
		entity.setUserStatus(UserStatus.active);
		entity.setTranzaction(saveNewTranzaction());
		userAccountService.save(entity);
		return entity;
	}

}