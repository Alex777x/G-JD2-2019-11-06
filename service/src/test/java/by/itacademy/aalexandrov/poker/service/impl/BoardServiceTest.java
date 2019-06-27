package by.itacademy.aalexandrov.poker.service.impl;

import static org.junit.Assert.assertNull;
import static org.junit.Assert.fail;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.Test;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IBoard;

public class BoardServiceTest extends AbstractTest {

	@Test
	public void testCreate() {
		IBoard entity = saveNewBoard();

		final IBoard entityFromDb = boardService.get(entity.getId());

		assertNotNull(entityFromDb);
		assertEquals(entity.getFlopCard1Id().getId(), entityFromDb.getFlopCard1Id().getId());
		assertEquals(entity.getFlopCard2Id().getId(), entityFromDb.getFlopCard2Id().getId());
		assertEquals(entity.getFlopCard3Id().getId(), entityFromDb.getFlopCard3Id().getId());
		assertEquals(entity.getTurnCardId().getId(), entityFromDb.getTurnCardId().getId());
		assertEquals(entity.getRiverCardId().getId(), entityFromDb.getRiverCardId().getId());
		assertNotNull(entityFromDb.getId());
		assertNotNull(entityFromDb.getCreated());
		assertNotNull(entityFromDb.getUpdated());
		assertTrue(entityFromDb.getCreated().equals(entityFromDb.getUpdated()));
	}

	@Test
	public void testCreateMultiple() {
		int initialSize = boardService.getAll().size();

		final IBoard entity1 = boardService.createEntity();
		entity1.setFlopCard1Id(saveNewCard());
		entity1.setFlopCard2Id(saveNewCard());
		entity1.setFlopCard3Id(saveNewCard());
		entity1.setTurnCardId(saveNewCard());
		entity1.setRiverCardId(saveNewCard());

		try {
			final IBoard entity2 = boardService.createEntity();
			boardService.save(entity1, entity2);
			fail("Board save should fail if name not specified");
		} catch (Exception e) {
			assertEquals(initialSize, boardService.getAll().size());
		}

	}

	@Test
	public void testUpdate() throws InterruptedException {
		final IBoard entity = saveNewBoard();

		Thread.sleep(2000);
		boardService.save(entity);

		final IBoard entityFromDb = boardService.get(entity.getId());

		assertNotNull(entityFromDb);
		assertNotNull(entityFromDb.getId());
		assertNotNull(entityFromDb.getCreated());
		assertNotNull(entityFromDb.getUpdated());
		assertEquals(entity.getCreated(), entityFromDb.getCreated());
		assertTrue(entityFromDb.getUpdated().after(entity.getCreated()));
	}

	@Test
	public void testGetAll() {
		final int intialCount = boardService.getAll().size();

		final int randomObjectsCount = getRandomObjectsCount();
		for (int i = 0; i < randomObjectsCount; i++) {
			saveNewBoard();
		}

		final List<IBoard> allEntities = boardService.getAll();

		for (final IBoard entityFromDb : allEntities) {
			assertNotNull(entityFromDb.getFlopCard1Id());
			assertNotNull(entityFromDb.getFlopCard2Id());
			assertNotNull(entityFromDb.getFlopCard3Id());
			assertNotNull(entityFromDb.getTurnCardId());
			assertNotNull(entityFromDb.getRiverCardId());
			assertNotNull(entityFromDb.getId());
			assertNotNull(entityFromDb.getCreated());
			assertNotNull(entityFromDb.getUpdated());
		}

		assertEquals(randomObjectsCount + intialCount, allEntities.size());
	}

	@Test
	public void testDelete() {
		final IBoard entity = saveNewBoard();
		boardService.delete(entity.getId());
		assertNull(boardService.get(entity.getId()));
	}

	@Test
	public void testDeleteAll() {
		saveNewBoard();
		boardService.deleteAll();
		assertEquals(0, boardService.getAll().size());
	}

}
