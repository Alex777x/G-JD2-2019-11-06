package by.itacademy.aalexandrov.poker.service.impl;

import static org.junit.Assert.assertNull;
import static org.junit.Assert.fail;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.Test;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayerCard;


public class PlayerCardServiceTest extends AbstractTest {
	
	@Test
	public void testCreate() {
		final IPlayerCard entity = saveNewPlayerCard();

		final IPlayerCard entityFromDb = playerCardService.get(entity.getId());

		assertNotNull(entityFromDb);
		assertEquals(entity.getCard1Id().getId(), entityFromDb.getCard1Id().getId());
		assertEquals(entity.getCard2Id().getId(), entityFromDb.getCard2Id().getId());
		assertEquals(entity.isCardState(), entityFromDb.isCardState());
		assertNotNull(entityFromDb.getId());
		assertNotNull(entityFromDb.getCreated());
		assertNotNull(entityFromDb.getUpdated());
		assertTrue(entityFromDb.getCreated().equals(entityFromDb.getUpdated()));
	}

	@Test
	public void testCreateMultiple() {
		int initialSize = playerCardService.getAll().size();

		final IPlayerCard entity1 = playerCardService.createEntity();
		entity1.setCard1Id(saveNewCard());
		entity1.setCard2Id(saveNewCard());
		entity1.setCardState(false);

		try {
			final IPlayerCard entity2 = playerCardService.createEntity();
			playerCardService.save(entity1, entity2);
			fail("PlayerCard save should fail if name not specified");
		} catch (Exception e) {
			assertEquals(initialSize, chatService.getAll().size());
		}

	}

	@Test
	public void testUpdate() throws InterruptedException {
		final IPlayerCard entity = saveNewPlayerCard();

		boolean newState = entity.isCardState();
		entity.setCardState(newState);
		Thread.sleep(2000);
		playerCardService.save(entity);

		final IPlayerCard entityFromDb = playerCardService.get(entity.getId());

		assertNotNull(entityFromDb);
		assertEquals(newState, entityFromDb.isCardState());
		assertNotNull(entityFromDb.getId());
		assertNotNull(entityFromDb.getCreated());
		assertNotNull(entityFromDb.getUpdated());
		assertEquals(entity.getCreated(), entityFromDb.getCreated());
		assertTrue(entityFromDb.getUpdated().after(entity.getCreated()));
	}

	@Test
	public void testGetAll() {
		final int intialCount = playerCardService.getAll().size();

		final int randomObjectsCount = getRandomObjectsCount();
		for (int i = 0; i < randomObjectsCount; i++) {
			saveNewPlayerCard();
		}

		final List<IPlayerCard> allEntities = playerCardService.getAll();

		for (final IPlayerCard entityFromDb : allEntities) {
			assertNotNull(entityFromDb.getCard1Id());
			assertNotNull(entityFromDb.getCard2Id());
			assertNotNull(entityFromDb.isCardState());
			assertNotNull(entityFromDb.getId());
			assertNotNull(entityFromDb.getCreated());
			assertNotNull(entityFromDb.getUpdated());
		}

		assertEquals(randomObjectsCount + intialCount, allEntities.size());
	}

	@Test
	public void testDelete() {
		final IPlayerCard entity = saveNewPlayerCard();
		playerCardService.delete(entity.getId());
		assertNull(playerCardService.get(entity.getId()));
	}

	@Test
	public void testDeleteAll() {
		saveNewPlayerCard();
		playerCardService.deleteAll();
		assertEquals(0, playerCardService.getAll().size());
	}

}
