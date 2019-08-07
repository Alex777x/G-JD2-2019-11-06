package by.itacademy.aalexandrov.poker.service.impl;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.fail;

import java.util.List;

import org.junit.jupiter.api.Test;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayerAction;

public class PlayerActionServiceTest extends AbstractTest {

	@Test
	public void testCreate() {
		final IPlayerAction entity = saveNewPlayerAction();

		final IPlayerAction entityFromDb = playerActionService.getFullInfo(entity.getId());

		assertNotNull(entityFromDb);
		assertEquals(entity.getPlayer().getId(), entityFromDb.getPlayer().getId());
		assertEquals(entity.getBet(), entityFromDb.getBet());
		assertEquals(entity.getCall(), entityFromDb.getCall());
		assertEquals(entity.getRaise(), entityFromDb.getRaise());
		assertEquals(entity.isFold(), entityFromDb.isFold());
		assertEquals(entity.isCheck(), entityFromDb.isCheck());
		assertEquals(entity.getAllIn(), entityFromDb.getAllIn());
		assertNotNull(entityFromDb.getId());
		assertNotNull(entityFromDb.getCreated());
		assertNotNull(entityFromDb.getUpdated());
		assertTrue(entityFromDb.getCreated().equals(entityFromDb.getUpdated()));
	}

	@Test
	public void testCreateMultiple() {
		int initialSize = playerActionService.getAll().size();

		final IPlayerAction entity1 = playerActionService.createEntity();
		entity1.setPlayer(saveNewPlayer());
		entity1.setBet(getRandomObjectsCount());
		entity1.setCall(getRandomObjectsCount());
		entity1.setRaise(getRandomObjectsCount());
		entity1.setFold(false);
		entity1.setCheck(false);
		entity1.setAllIn(getRandomObjectsCount());

		try {
			final IPlayerAction entity2 = playerActionService.createEntity();
			entity2.setBet(getRandomObjectsCount() / 0);
			playerActionService.save(entity1, entity2);
			fail("Action save should fail if name not specified");
		} catch (Exception e) {
			assertEquals(initialSize, playerActionService.getAll().size());
		}

	}

	@Test
	public void testUpdate() throws InterruptedException {
		final IPlayerAction entity = saveNewPlayerAction();

		int newBet = entity.getBet();
		int newCall = entity.getCall();
		int newRaise = entity.getRaise();
		boolean newFold = entity.isFold();
		boolean newCheck = entity.isCheck();
		int newVaBank = entity.getAllIn();
		entity.setBet(newBet);
		entity.setCall(newCall);
		entity.setRaise(newRaise);
		entity.setFold(newFold);
		entity.setCheck(newCheck);
		entity.setAllIn(newVaBank);
		Thread.sleep(2000);
		playerActionService.save(entity);

		final IPlayerAction entityFromDb = playerActionService.get(entity.getId());

		assertNotNull(entityFromDb);
		assertEquals(newBet, entityFromDb.getBet());
		assertEquals(newCall, entityFromDb.getCall());
		assertEquals(newRaise, entityFromDb.getRaise());
		assertEquals(newFold, entityFromDb.isFold());
		assertEquals(newCheck, entityFromDb.isCheck());
		assertEquals(newVaBank, entityFromDb.getAllIn());
		assertNotNull(entityFromDb.getId());
		assertNotNull(entityFromDb.getCreated());
		assertNotNull(entityFromDb.getUpdated());
		assertEquals(entity.getCreated(), entityFromDb.getCreated());
		assertTrue(entityFromDb.getUpdated().after(entity.getCreated()));
	}

	@Test
	public void testGetAll() {
		final int intialCount = playerActionService.getAll().size();

		final int randomObjectsCount = getRandomObjectsCount();
		for (int i = 0; i < randomObjectsCount; i++) {
			saveNewPlayerAction();
		}

		final List<IPlayerAction> allEntities = playerActionService.getFullInfo();

		for (final IPlayerAction entityFromDb : allEntities) {
			assertNotNull(entityFromDb.getPlayer().getId());
			assertNotNull(entityFromDb.getBet());
			assertNotNull(entityFromDb.getCall());
			assertNotNull(entityFromDb.getRaise());
			assertNotNull(entityFromDb.isFold());
			assertNotNull(entityFromDb.isCheck());
			assertNotNull(entityFromDb.getAllIn());
			assertNotNull(entityFromDb.getId());
			assertNotNull(entityFromDb.getCreated());
			assertNotNull(entityFromDb.getUpdated());
		}

		assertEquals(randomObjectsCount + intialCount, allEntities.size());
	}

	@Test
	public void testDelete() {
		final IPlayerAction entity = saveNewPlayerAction();
		playerActionService.delete(entity.getId());
		assertNull(playerActionService.get(entity.getId()));
	}

	@Test
	public void testDeleteAll() {
		saveNewPlayerAction();
		playerActionService.deleteAll();
		assertEquals(0, playerActionService.getAll().size());
	}

}
