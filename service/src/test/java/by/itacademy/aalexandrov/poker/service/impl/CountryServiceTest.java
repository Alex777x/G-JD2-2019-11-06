package by.itacademy.aalexandrov.poker.service.impl;

import static org.junit.Assert.assertNull;
import static org.junit.Assert.fail;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import java.util.List;

import org.junit.jupiter.api.Test;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICountry;


public class CountryServiceTest extends AbstractTest {
	
	@Test
	public void testCreate() {
		final ICountry entity = saveNewCountry();

		final ICountry entityFromDb = countryService.get(entity.getId());

		assertNotNull(entityFromDb);
		assertEquals(entity.getCountry(), entityFromDb.getCountry());
		assertNotNull(entityFromDb.getId());
	}
	
	@Test
    public void testCreateMultiple() {
        int initialSize = countryService.getAll().size();

        final ICountry entity1 = countryService.createEntity();
        entity1.setCountry("country" + getRandomPrefix());

        try {
            final ICountry entity2 = countryService.createEntity();
            countryService.save(entity1, entity2);
            fail("Country save should fail if name not specified");
        } catch (Exception e) {
            assertEquals(initialSize, countryService.getAll().size());
        }

    }
	
	@Test
    public void testUpdate() throws InterruptedException {
        final ICountry entity = saveNewCountry();

        String newTitle = entity.getCountry() + "_updated";
        entity.setCountry(newTitle);
        Thread.sleep(2000);
        countryService.save(entity);

        final ICountry entityFromDb = countryService.get(entity.getId());

        assertNotNull(entityFromDb);
        assertEquals(newTitle, entityFromDb.getCountry());
        assertNotNull(entityFromDb.getId());
    }
	
	@Test
    public void testGetAll() {
        final int intialCount = countryService.getAll().size();

        final int randomObjectsCount = getRandomObjectsCount();
        for (int i = 0; i < randomObjectsCount; i++) {
        	saveNewCountry();
        }

        final List<ICountry> allEntities = countryService.getAll();

        for (final ICountry entityFromDb : allEntities) {
            assertNotNull(entityFromDb.getCountry());
            assertNotNull(entityFromDb.getId());
        }

        assertEquals(randomObjectsCount + intialCount, allEntities.size());
    }

    @Test
    public void testDelete() {
        final ICountry entity = saveNewCountry();
        countryService.delete(entity.getId());
        assertNull(countryService.get(entity.getId()));
    }

    @Test
    public void testDeleteAll() {
    	saveNewCountry();
        tiketService.deleteAll();
        assertEquals(0, tiketService.getAll().size());
    }

}
