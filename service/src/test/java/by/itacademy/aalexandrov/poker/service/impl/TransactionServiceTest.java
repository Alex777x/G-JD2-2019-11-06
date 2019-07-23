package by.itacademy.aalexandrov.poker.service.impl;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.fail;

import java.util.List;

import org.junit.jupiter.api.Test;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITransaction;

public class TransactionServiceTest extends AbstractTest {

	@Test
	public void testCreate() {
		final ITransaction entity = saveNewTransaction();

		final ITransaction entityFromDb = transactionService.get(entity.getId());

		assertNotNull(entityFromDb);
		assertEquals(entity.getUserAccount().getId(), entityFromDb.getUserAccount().getId());
		assertEquals(entity.getAmount(), entityFromDb.getAmount());
		assertEquals(entity.getComment(), entityFromDb.getComment());
		assertNotNull(entityFromDb.getId());
		assertNotNull(entityFromDb.getCreated());
		assertNotNull(entityFromDb.getUpdated());
		assertTrue(entityFromDb.getCreated().equals(entityFromDb.getUpdated()));
	}

	@Test
	public void testCreateMultiple() {
		int initialSize = transactionService.getAll().size();

		final ITransaction entity1 = transactionService.createEntity();
		entity1.setAmount(getRandomObjectsCount());
		entity1.setComment("tiket_text" + getRandomPrefix());

		try {
			final ITransaction entity2 = transactionService.createEntity();
			transactionService.save(entity1, entity2);
			fail("Tranzaction save should fail if name not specified");
		} catch (Exception e) {
			assertEquals(initialSize, transactionService.getAll().size());
		}

	}

	@Test
	public void testUpdate() throws InterruptedException {
		final ITransaction entity = saveNewTransaction();

		double newAmount = entity.getAmount() + 1001;
		String newComment = entity.getComment() + "_updated";
		entity.setUserAccount(saveNewUserAccount());
		entity.setAmount(newAmount);
		entity.setComment(newComment);
		Thread.sleep(2000);
		transactionService.save(entity);

		final ITransaction entityFromDb = transactionService.get(entity.getId());

		assertNotNull(entityFromDb);
		assertEquals(newAmount, entityFromDb.getAmount());
		assertEquals(newComment, entityFromDb.getComment());
		assertNotNull(entityFromDb.getId());
		assertNotNull(entityFromDb.getCreated());
		assertNotNull(entityFromDb.getUpdated());
		assertEquals(entity.getCreated(), entityFromDb.getCreated());
		assertTrue(entityFromDb.getUpdated().after(entity.getCreated()));
	}

	@Test
	public void testGetAll() {
		final int intialCount = transactionService.getAll().size();

		final int randomObjectsCount = getRandomObjectsCount();
		for (int i = 0; i < randomObjectsCount; i++) {
			saveNewTransaction();
		}

		final List<ITransaction> allEntities = transactionService.getAll();

		for (final ITransaction entityFromDb : allEntities) {
			assertNotNull(entityFromDb.getUserAccount().getId());
			assertNotNull(entityFromDb.getAmount());
			assertNotNull(entityFromDb.getComment());
			assertNotNull(entityFromDb.getId());
			assertNotNull(entityFromDb.getCreated());
			assertNotNull(entityFromDb.getUpdated());
		}

		assertEquals(randomObjectsCount + intialCount, allEntities.size());
	}

	@Test
	public void testDelete() {
		final ITransaction entity = saveNewTransaction();
		transactionService.delete(entity.getId());
		assertNull(transactionService.get(entity.getId()));
	}

	@Test
	public void testDeleteAll() {
		saveNewTransaction();
		transactionService.deleteAll();
		assertEquals(0, transactionService.getAll().size());
	}
}
