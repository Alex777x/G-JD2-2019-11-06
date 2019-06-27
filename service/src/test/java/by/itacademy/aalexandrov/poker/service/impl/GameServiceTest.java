package by.itacademy.aalexandrov.poker.service.impl;

import static org.junit.Assert.assertNull;
import static org.junit.Assert.fail;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.Test;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.GameStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;

public class GameServiceTest extends AbstractTest {
	
	@Test
	public void testCreate() {
		IGame entity = saveNewGame();

		final IGame entityFromDb = gameService.get(entity.getId());

		assertNotNull(entityFromDb);
		assertEquals(entity.getChatId().getId(), entityFromDb.getChatId().getId());
		assertEquals(entity.getPlayerId().getId(), entityFromDb.getPlayerId().getId());
		assertEquals(entity.getBoardId().getId(), entityFromDb.getBoardId().getId());
		assertEquals(entity.getState(), entityFromDb.getState());
		assertEquals(entity.getBank(), entityFromDb.getBank());
		assertNotNull(entityFromDb.getId());
		assertNotNull(entityFromDb.getCreated());
		assertNotNull(entityFromDb.getUpdated());
		assertTrue(entityFromDb.getCreated().equals(entityFromDb.getUpdated()));
	}

	@Test
	public void testCreateMultiple() {
		int initialSize = gameService.getAll().size();

		final IGame entity1 = gameService.createEntity();
		entity1.setChatId(saveNewChat());
		entity1.setPlayerId(saveNewPlayer());
		entity1.setBoardId(saveNewBoard());
		entity1.setState(GameStatus.ACTIVE);
		entity1.setBank(getRandomObjectsCount());

		try {
			final IGame entity2 = gameService.createEntity();
			gameService.save(entity1, entity2);
			fail("Game save should fail if name not specified");
		} catch (Exception e) {
			assertEquals(initialSize, gameService.getAll().size());
		}

	}

	@Test
	public void testUpdate() throws InterruptedException {
		final IGame entity = saveNewGame();

		double newBank = entity.getBank();
		entity.setBank(newBank);
		Thread.sleep(2000);
		gameService.save(entity);

		final IGame entityFromDb = gameService.get(entity.getId());

		assertNotNull(entityFromDb);
		assertEquals(newBank, entityFromDb.getBank());
		assertNotNull(entityFromDb.getId());
		assertNotNull(entityFromDb.getCreated());
		assertNotNull(entityFromDb.getUpdated());
		assertEquals(entity.getCreated(), entityFromDb.getCreated());
		assertTrue(entityFromDb.getUpdated().after(entity.getCreated()));
	}

	@Test
	public void testGetAll() {
		final int intialCount = gameService.getAll().size();

		final int randomObjectsCount = getRandomObjectsCount();
		for (int i = 0; i < randomObjectsCount; i++) {
			saveNewGame();
		}

		final List<IGame> allEntities = gameService.getAll();

		for (final IGame entityFromDb : allEntities) {
			assertNotNull(entityFromDb.getChatId().getId());
			assertNotNull(entityFromDb.getPlayerId().getId());
			assertNotNull(entityFromDb.getBoardId().getId());
			assertNotNull(entityFromDb.getState());
			assertNotNull(entityFromDb.getBank());
			assertNotNull(entityFromDb.getId());
			assertNotNull(entityFromDb.getCreated());
			assertNotNull(entityFromDb.getUpdated());
		}

		assertEquals(randomObjectsCount + intialCount, allEntities.size());
	}

	@Test
	public void testDelete() {
		final IGame entity = saveNewGame();
		gameService.delete(entity.getId());
		assertNull(gameService.get(entity.getId()));
	}

	@Test
	public void testDeleteAll() {
		saveNewGame();
		gameService.deleteAll();
		assertEquals(0, gameService.getAll().size());
	}

}
