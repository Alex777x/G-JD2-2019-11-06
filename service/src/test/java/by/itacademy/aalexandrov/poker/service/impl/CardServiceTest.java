package by.itacademy.aalexandrov.poker.service.impl;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.fail;

import java.util.List;

import org.junit.jupiter.api.Test;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.Rank;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.Suits;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICard;
import by.itacademy.aalexandrov.poker.dao.api.filter.CardFilter;

public class CardServiceTest extends AbstractTest {

	@Test
	public void testCreate() {
		ICard entity = saveNewCard();

		final ICard entityFromDb = cardService.get(entity.getId());

		assertNotNull(entityFromDb);
		assertEquals(entity.getSuit(), entityFromDb.getSuit());
		assertEquals(entity.getRank(), entityFromDb.getRank());
		assertEquals(entity.getFilename(), entityFromDb.getFilename());
		assertNotNull(entityFromDb.getId());
		assertNotNull(entityFromDb.getCreated());
		assertNotNull(entityFromDb.getUpdated());
		assertTrue(entityFromDb.getCreated().equals(entityFromDb.getUpdated()));
	}

	@Test
	public void testCreateMultiple() {
		int initialSize = cardService.getAll().size();

		final ICard entity1 = cardService.createEntity();
		entity1.setSuit(Suits.DIAMONDS);
		entity1.setRank(Rank.JACK);
		entity1.setFilename(getRandomPrefix());

		try {
			final ICard entity2 = cardService.createEntity();
			cardService.save(entity1, entity2);
			fail("Card save should fail if name not specified");
		} catch (Exception e) {
			assertEquals(initialSize, cardService.getAll().size());
		}

	}

	@Test
	public void testUpdate() throws InterruptedException {
		final ICard entity = saveNewCard();

		Suits newSuit = entity.getSuit();
		Rank newRank = entity.getRank();
		String newFilename = entity.getFilename() + "_updated";
		entity.setSuit(newSuit);
		entity.setRank(newRank);
		entity.setFilename(newFilename);
		Thread.sleep(2000);
		cardService.save(entity);

		final ICard entityFromDb = cardService.get(entity.getId());

		assertNotNull(entityFromDb);
		assertEquals(newSuit, entityFromDb.getSuit());
		assertEquals(newRank, entityFromDb.getRank());
		assertEquals(newFilename, entityFromDb.getFilename());
		assertNotNull(entityFromDb.getId());
		assertNotNull(entityFromDb.getCreated());
		assertNotNull(entityFromDb.getUpdated());
		assertEquals(entity.getCreated(), entityFromDb.getCreated());
		assertTrue(entityFromDb.getUpdated().after(entity.getCreated()));
	}

	@Test
	public void testGetAll() {
		final int intialCount = cardService.getAll().size();

		final int randomObjectsCount = getRandomObjectsCount();
		for (int i = 0; i < randomObjectsCount; i++) {
			saveNewCard();
		}

		final List<ICard> allEntities = cardService.getAll();

		for (final ICard entityFromDb : allEntities) {
			assertNotNull(entityFromDb.getSuit());
			assertNotNull(entityFromDb.getRank());
			assertNotNull(entityFromDb.getFilename());
			assertNotNull(entityFromDb.getId());
			assertNotNull(entityFromDb.getCreated());
			assertNotNull(entityFromDb.getUpdated());
		}

		assertEquals(randomObjectsCount + intialCount, allEntities.size());
	}

	@Test
	public void testDelete() {
		final ICard entity = saveNewCard();
		cardService.delete(entity.getId());
		assertNull(cardService.get(entity.getId()));
	}

	@Test
	public void testDeleteAll() {
		saveNewCard();
		cardService.deleteAll();
		assertEquals(0, cardService.getAll().size());
	}

	@Test
	public void testFind() {
		for (int i = 0; i < 6; i++) {
			saveNewCard();
		}

		CardFilter filter = new CardFilter();

		assertEquals(6, cardService.getCount(filter));
		assertEquals(6, cardService.find(filter).size());

		filter.setLimit(5);
		assertEquals(5, cardService.find(filter).size());

		filter.setOffset(5);
		assertEquals(1, cardService.find(filter).size());

		filter = new CardFilter();
		filter.setSortColumn("id");
		filter.setSortOrder(true);
		List<ICard> ascBrands = cardService.find(filter);
		verifyOrderById(ascBrands, true);

		filter.setSortOrder(false);
		List<ICard> descBrands = cardService.find(filter);
		verifyOrderById(descBrands, false);

	}

}
