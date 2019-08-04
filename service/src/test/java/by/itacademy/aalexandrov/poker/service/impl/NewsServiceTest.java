package by.itacademy.aalexandrov.poker.service.impl;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.fail;

import java.util.List;

import org.junit.jupiter.api.Test;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.INews;

public class NewsServiceTest extends AbstractTest {

	@Test
	public void testCreate() {
		final INews entity = saveNewNews();

		final INews entityFromDb = newsService.get(entity.getId());

		assertNotNull(entityFromDb);
		assertEquals(entity.getNewsTitle(), entityFromDb.getNewsTitle());
		assertEquals(entity.getNewsText(), entityFromDb.getNewsText());
		assertNotNull(entityFromDb.getId());
		assertNotNull(entityFromDb.getCreated());
		assertNotNull(entityFromDb.getUpdated());
		assertTrue(entityFromDb.getCreated().equals(entityFromDb.getUpdated()));
	}

	@Test
	public void testCreateMultiple() {
		int initialSize = newsService.getAll().size();

		final INews entity1 = newsService.createEntity();
		entity1.setNewsTitle("message" + getRandomPrefix());
		entity1.setNewsText("message" + getRandomPrefix());

		try {
			final INews entity2 = newsService.createEntity();
			newsService.save(entity1, entity2);
			fail("Chat save should fail if name not specified");
		} catch (Exception e) {
			assertEquals(initialSize, newsService.getAll().size());
		}

	}

	@Test
	public void testUpdate() throws InterruptedException {
		final INews entity = saveNewNews();

		String newNewsTitle = entity.getNewsTitle() + "_updated";
		String newNewsText = entity.getNewsText() + "_updated";
		entity.setNewsTitle(newNewsTitle);
		entity.setNewsText(newNewsText);
		Thread.sleep(2000);
		newsService.save(entity);

		final INews entityFromDb = newsService.get(entity.getId());

		assertNotNull(entityFromDb);
		assertEquals(newNewsTitle, entityFromDb.getNewsTitle());
		assertEquals(newNewsText, entityFromDb.getNewsText());
		assertNotNull(entityFromDb.getId());
		assertNotNull(entityFromDb.getCreated());
		assertNotNull(entityFromDb.getUpdated());
		assertEquals(entity.getCreated(), entityFromDb.getCreated());
		assertTrue(entityFromDb.getUpdated().after(entity.getCreated()));
	}

	@Test
	public void testGetAll() {
		final int intialCount = newsService.getAll().size();

		final int randomObjectsCount = getRandomObjectsCount();
		for (int i = 0; i < randomObjectsCount; i++) {
			saveNewNews();
		}

		final List<INews> allEntities = newsService.getAll();

		for (final INews entityFromDb : allEntities) {
			assertNotNull(entityFromDb.getNewsTitle());
			assertNotNull(entityFromDb.getNewsText());
			assertNotNull(entityFromDb.getId());
			assertNotNull(entityFromDb.getCreated());
			assertNotNull(entityFromDb.getUpdated());
		}

		assertEquals(randomObjectsCount + intialCount, allEntities.size());
	}

	@Test
	public void testDelete() {
		final INews entity = saveNewNews();
		newsService.delete(entity.getId());
		assertNull(newsService.get(entity.getId()));
	}

	@Test
	public void testDeleteAll() {
		saveNewNews();
		newsService.deleteAll();
		assertEquals(0, newsService.getAll().size());
	}

}
