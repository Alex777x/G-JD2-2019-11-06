package by.itacademy.aalexandrov.poker.service.impl;

import static org.junit.Assert.assertNull;
import static org.junit.Assert.fail;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import javax.swing.text.StyledEditorKit.BoldAction;

import org.junit.jupiter.api.Test;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPokerAction;

public class PokerActionServiceTest extends AbstractTest {

	@Test
	public void testCreate() {
		final IPokerAction entity = saveNewPokerAction();

		final IPokerAction entityFromDb = pokerActionService.get(entity.getId());

		assertNotNull(entityFromDb);
		assertEquals(entity.getBet(), entityFromDb.getBet());
		assertEquals(entity.getCall(), entityFromDb.getCall());
		assertEquals(entity.getRaise(), entityFromDb.getRaise());
		assertEquals(entity.isFold(), entityFromDb.isFold());
		assertEquals(entity.isCheck(), entityFromDb.isCheck());
		assertEquals(entity.getVaBank(), entityFromDb.getVaBank());
		assertEquals(entity.isSmallBlind(), entityFromDb.isSmallBlind());
		assertEquals(entity.isBigBlind(), entityFromDb.isBigBlind());
		assertNotNull(entityFromDb.getId());
		assertNotNull(entityFromDb.getCreated());
		assertNotNull(entityFromDb.getUpdated());
		assertTrue(entityFromDb.getCreated().equals(entityFromDb.getUpdated()));
	}

	@Test
	public void testCreateMultiple() {
		int initialSize = pokerActionService.getAll().size();

		final IPokerAction entity1 = pokerActionService.createEntity();
		entity1.setBet(getRandomObjectsCount());
		entity1.setCall(getRandomObjectsCount());
		entity1.setRaise(getRandomObjectsCount());
		entity1.setFold(false);
		entity1.setCheck(false);
		entity1.setVaBank(getRandomObjectsCount());
		entity1.setSmallBlind(true);
		entity1.setBigBlind(false);

		try {
			final IPokerAction entity2 = pokerActionService.createEntity();
			pokerActionService.save(entity1, entity2);
			fail("PokerAction save should fail if name not specified");
		} catch (Exception e) {
			assertEquals(initialSize, pokerActionService.getAll().size());
		}

	}

	@Test
	public void testUpdate() throws InterruptedException {
		final IPokerAction entity = saveNewPokerAction();

		int newBet = entity.getBet();
		int newCall = entity.getCall();
		int newRaise = entity.getRaise();
		boolean newFold = entity.isFold();
		boolean newCheck = entity.isCheck();
		int newVaBank = entity.getVaBank();
		boolean newSmallBlind = entity.isSmallBlind();
		boolean newBigBlind = entity.isBigBlind();
		entity.setBet(newBet);
		entity.setCall(newCall);
		entity.setRaise(newRaise);
		entity.setFold(newFold);
		entity.setCheck(newCheck);
		entity.setVaBank(newVaBank);
		Thread.sleep(2000);
		pokerActionService.save(entity);

		final IPokerAction entityFromDb = pokerActionService.get(entity.getId());

		assertNotNull(entityFromDb);
		assertEquals(newBet, entityFromDb.getBet());
		assertEquals(newCall, entityFromDb.getCall());
		assertEquals(newRaise, entityFromDb.getRaise());
		assertEquals(newFold, entityFromDb.isFold());
		assertEquals(newCheck, entityFromDb.isCheck());
		assertEquals(newVaBank, entityFromDb.getVaBank());
		assertEquals(newSmallBlind, entityFromDb.isSmallBlind());
		assertEquals(newBigBlind, entityFromDb.isBigBlind());
		assertNotNull(entityFromDb.getId());
		assertNotNull(entityFromDb.getCreated());
		assertNotNull(entityFromDb.getUpdated());
		assertEquals(entity.getCreated(), entityFromDb.getCreated());
		assertTrue(entityFromDb.getUpdated().after(entity.getCreated()));
	}

	@Test
	public void testGetAll() {
		final int intialCount = pokerActionService.getAll().size();

		final int randomObjectsCount = getRandomObjectsCount();
		for (int i = 0; i < randomObjectsCount; i++) {
			saveNewPokerAction();
		}

		final List<IPokerAction> allEntities = pokerActionService.getAll();

		for (final IPokerAction entityFromDb : allEntities) {
			assertNotNull(entityFromDb.getBet());
			assertNotNull(entityFromDb.getCall());
			assertNotNull(entityFromDb.getRaise());
			assertNotNull(entityFromDb.isFold());
			assertNotNull(entityFromDb.isCheck());
			assertNotNull(entityFromDb.getVaBank());
			assertNotNull(entityFromDb.isSmallBlind());
			assertNotNull(entityFromDb.isBigBlind());
			assertNotNull(entityFromDb.getId());
			assertNotNull(entityFromDb.getCreated());
			assertNotNull(entityFromDb.getUpdated());
		}

		assertEquals(randomObjectsCount + intialCount, allEntities.size());
	}

	@Test
	public void testDelete() {
		final IPokerAction entity = saveNewPokerAction();
		pokerActionService.delete(entity.getId());
		assertNull(pokerActionService.get(entity.getId()));
	}

	@Test
	public void testDeleteAll() {
		saveNewPokerAction();
		pokerActionService.deleteAll();
		assertEquals(0, pokerActionService.getAll().size());
	}
	
}
