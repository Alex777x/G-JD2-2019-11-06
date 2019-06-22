package by.itacademy.aalexandrov.poker.service.impl;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITiket;
import by.itacademy.aalexandrov.poker.service.ITiketService;
import java.util.Random;
import org.junit.jupiter.api.BeforeEach;

public abstract class AbstractTest {
	protected ITiketService tiketService = new TiketServiceImpl();

	private static final Random RANDOM = new Random();

	@BeforeEach
	public void setUpMethod() {
		// clean DB recursive
		tiketService.deleteAll();

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
		final ITiket entity = tiketService.createEntity();
		entity.setTiketTitle("tiket-title" + getRandomPrefix());
		entity.setTiketText("tiket-text" + getRandomPrefix());
		entity.setStatus("tiket-status" + getRandomPrefix());
		tiketService.save(entity);
		return entity;
	}

}