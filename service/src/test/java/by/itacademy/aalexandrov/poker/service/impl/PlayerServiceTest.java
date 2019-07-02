package by.itacademy.aalexandrov.poker.service.impl;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.fail;

import java.util.List;

import org.junit.jupiter.api.Test;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerPosition;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;

public class PlayerServiceTest extends AbstractTest {

	@Test
	public void testCreate() {
		IPlayer entity = saveNewPlayer();

		final IPlayer entityFromDb = playerService.get(entity.getId());

		assertNotNull(entityFromDb);
		assertEquals(entity.getGameId().getId(), entityFromDb.getGameId().getId());
		assertEquals(entity.getUserAccountId().getId(), entityFromDb.getUserAccountId().getId());
		assertEquals(entity.getPositionId(), entityFromDb.getPositionId());
		assertEquals(entity.isInGame(), entityFromDb.isInGame());
		assertEquals(entity.getState(), entityFromDb.getState());
		assertEquals(entity.getStack(), entityFromDb.getStack());
		assertNotNull(entityFromDb.getId());
		assertNotNull(entityFromDb.getCreated());
		assertNotNull(entityFromDb.getUpdated());
		assertTrue(entityFromDb.getCreated().equals(entityFromDb.getUpdated()));
	}

	@Test
	public void testCreateMultiple() {
		int initialSize = playerService.getAll().size();

		final IPlayer entity1 = playerService.createEntity();
		entity1.setGameId(saveNewGame());
		entity1.setUserAccountId(saveNewUserAccount());
		entity1.setPositionId(PlayerPosition.ONE);
		entity1.setInGame(true);
		entity1.setState(PlayerStatus.DEALER);
		entity1.setStack(getRandomObjectsCount());

		try {
			final IPlayer entity2 = playerService.createEntity();
			entity2.setState(PlayerStatus.valueOf(getRandomPrefix()));
			playerService.save(entity1, entity2);
			fail("Player save should fail if name not specified");
		} catch (Exception e) {
			assertEquals(initialSize, playerService.getAll().size());
		}

	}

	@Test
	public void testUpdate() throws InterruptedException {
		final IPlayer entity = saveNewPlayer();

		PlayerPosition newPlayerPosition = entity.getPositionId();
		PlayerStatus newStatus = entity.getState();
		double newStack = entity.getStack();
		entity.setPositionId(newPlayerPosition);
		entity.setState(newStatus);
		entity.setStack(newStack);
		Thread.sleep(2000);
		playerService.save(entity);

		final IPlayer entityFromDb = playerService.get(entity.getId());

		assertNotNull(entityFromDb);
		assertEquals(newPlayerPosition, entityFromDb.getPositionId());
		assertEquals(newStatus, entityFromDb.getState());
		assertEquals(newStack, entityFromDb.getStack());
		assertNotNull(entityFromDb.getId());
		assertNotNull(entityFromDb.getCreated());
		assertNotNull(entityFromDb.getUpdated());
		assertEquals(entity.getCreated(), entityFromDb.getCreated());
		assertTrue(entityFromDb.getUpdated().after(entity.getCreated()));
	}

	@Test
	public void testGetAll() {
		final int intialCount = playerService.getAll().size();

		final int randomObjectsCount = getRandomObjectsCount();
		for (int i = 0; i < randomObjectsCount; i++) {
			saveNewPlayer();
		}

		final List<IPlayer> allEntities = playerService.getAll();

		for (final IPlayer entityFromDb : allEntities) {
			assertNotNull(entityFromDb.getGameId().getId());
			assertNotNull(entityFromDb.getUserAccountId().getId());
			assertNotNull(entityFromDb.getPositionId());
			assertNotNull(entityFromDb.isInGame());
			assertNotNull(entityFromDb.getState());
			assertNotNull(entityFromDb.getStack());
			assertNotNull(entityFromDb.getId());
			assertNotNull(entityFromDb.getCreated());
			assertNotNull(entityFromDb.getUpdated());
		}

		assertEquals(randomObjectsCount + intialCount, allEntities.size());
	}

	@Test
	public void testDelete() {
		final IPlayer entity = saveNewPlayer();
		playerService.delete(entity.getId());
		assertNull(playerService.get(entity.getId()));
	}

	@Test
	public void testDeleteAll() {
		saveNewPlayer();
		playerService.deleteAll();
		assertEquals(0, playerService.getAll().size());
	}

}
