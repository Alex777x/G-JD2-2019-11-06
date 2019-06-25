package by.itacademy.aalexandrov.poker.service.impl;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.UserRole;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.UserStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICountry;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPokerAction;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IStatistic;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITiket;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITranzaction;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.Country;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.Tranzaction;
import by.itacademy.aalexandrov.poker.service.ICountryService;
import by.itacademy.aalexandrov.poker.service.IPokerActionService;
import by.itacademy.aalexandrov.poker.service.IStatisticService;
import by.itacademy.aalexandrov.poker.service.ITiketService;
import by.itacademy.aalexandrov.poker.service.ITranzactionService;
import by.itacademy.aalexandrov.poker.service.IUserAccountService;

import java.util.Random;
import org.junit.jupiter.api.BeforeEach;

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
		tiketService.deleteAll();
		countryService.deleteAll();
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
		entity.setNickname(getRandomPrefix());
		entity.setPassword(getRandomPrefix());
		entity.setEmail(getRandomPrefix());
		entity.setFoto(getRandomPrefix());
		entity.setCountry(new Country());
		entity.setUserRole(UserRole.member);
		entity.setUserStatus(UserStatus.active);
		entity.setTranzaction(new Tranzaction());
		userAccountService.save(entity);
		return entity;
	}

}