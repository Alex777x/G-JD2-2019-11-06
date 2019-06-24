package by.itacademy.aalexandrov.poker.service.impl;

import static org.junit.Assert.assertNull;
import static org.junit.Assert.fail;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.Test;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IStatistic;


public class StatisticServiceTest extends AbstractTest {
	
	@Test
	public void testCreate() {
		final IStatistic entity = saveNewStatistic();

		final IStatistic entityFromDb = statisticService.get(entity.getId());

		assertNotNull(entityFromDb);
		assertEquals(entity.getSumGames(), entityFromDb.getSumGames());
		assertEquals(entity.getWonGames(), entityFromDb.getWonGames());
		assertNotNull(entityFromDb.getId());
	}
	
	@Test
    public void testCreateMultiple() {
        int initialSize = statisticService.getAll().size();

        final IStatistic entity1 = statisticService.createEntity();
        entity1.setSumGames(getRandomObjectsCount());
        entity1.setWonGames(getRandomObjectsCount());

        try {
            final IStatistic entity2 = statisticService.createEntity();
            statisticService.save(entity1, entity2);
            fail("Statistic save should fail if name not specified");
        } catch (Exception e) {
            assertEquals(initialSize, statisticService.getAll().size());
        }

    }
	
	@Test
    public void testUpdate() throws InterruptedException {
        final IStatistic entity = saveNewStatistic();

        int newSumGames = entity.getSumGames();
        int newWonGames = entity.getWonGames();
        entity.setSumGames(newSumGames);
        entity.setWonGames(newWonGames);
        Thread.sleep(2000);
        statisticService.save(entity);

        final IStatistic entityFromDb = statisticService.get(entity.getId());

        assertNotNull(entityFromDb);
        assertEquals(newSumGames, entityFromDb.getSumGames());
        assertEquals(newWonGames, entityFromDb.getWonGames());
        assertNotNull(entityFromDb.getId());
    }
	
	@Test
    public void testGetAll() {
        final int intialCount = statisticService.getAll().size();

        final int randomObjectsCount = getRandomObjectsCount();
        for (int i = 0; i < randomObjectsCount; i++) {
        	saveNewStatistic();
        }

        final List<IStatistic> allEntities = statisticService.getAll();

        for (final IStatistic entityFromDb : allEntities) {
            assertNotNull(entityFromDb.getSumGames());
            assertNotNull(entityFromDb.getWonGames());
            assertNotNull(entityFromDb.getId());
        }

        assertEquals(randomObjectsCount + intialCount, allEntities.size());
    }

    @Test
    public void testDelete() {
        final IStatistic entity = saveNewStatistic();
        statisticService.delete(entity.getId());
        assertNull(statisticService.get(entity.getId()));
    }

    @Test
    public void testDeleteAll() {
    	saveNewStatistic();
    	statisticService.deleteAll();
        assertEquals(0, statisticService.getAll().size());
    }

}
