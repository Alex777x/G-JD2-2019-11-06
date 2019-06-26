package by.itacademy.aalexandrov.poker.service.impl;

import static org.junit.Assert.assertNull;
import static org.junit.Assert.fail;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.Test;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITransaction;


public class TransactionServiceTest extends AbstractTest {

	
	@Test
	public void testCreate() {
		final ITransaction entity = saveNewTranzaction();

		final ITransaction entityFromDb = tranzactionService.get(entity.getId());

		assertNotNull(entityFromDb);
		assertEquals(entity.getAmount(), entityFromDb.getAmount());
		assertEquals(entity.getComment(), entityFromDb.getComment());
		assertNotNull(entityFromDb.getId());
		assertNotNull(entityFromDb.getCreated());
		assertNotNull(entityFromDb.getUpdated());
		assertTrue(entityFromDb.getCreated().equals(entityFromDb.getUpdated()));
	}
	
	@Test
    public void testCreateMultiple() {
        int initialSize = tranzactionService.getAll().size();

        final ITransaction entity1 = tranzactionService.createEntity();
        entity1.setAmount(getRandomObjectsCount());
        entity1.setComment("tiket_text" + getRandomPrefix());

        try {
            final ITransaction entity2 = tranzactionService.createEntity();
            tranzactionService.save(entity1, entity2);
            fail("Tranzaction save should fail if name not specified");
        } catch (Exception e) {
            assertEquals(initialSize, tranzactionService.getAll().size());
        }

    }
	
	@Test
    public void testUpdate() throws InterruptedException {
        final ITransaction entity = saveNewTranzaction();

        double newAmount = entity.getAmount() + 1001;
        String newComment = entity.getComment() + "_updated";
        entity.setAmount(newAmount);
        entity.setComment(newComment);
        Thread.sleep(2000);
        tranzactionService.save(entity);

        final ITransaction entityFromDb = tranzactionService.get(entity.getId());

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
        final int intialCount = tranzactionService.getAll().size();

        final int randomObjectsCount = getRandomObjectsCount();
        for (int i = 0; i < randomObjectsCount; i++) {
        	saveNewTranzaction();
        }

        final List<ITransaction> allEntities = tranzactionService.getAll();

        for (final ITransaction entityFromDb : allEntities) {
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
        final ITransaction entity = saveNewTranzaction();
        tranzactionService.delete(entity.getId());
        assertNull(tranzactionService.get(entity.getId()));
    }

    @Test
    public void testDeleteAll() {
    	saveNewTranzaction();
    	tranzactionService.deleteAll();
        assertEquals(0, tranzactionService.getAll().size());
    }
}
