package by.itacademy.aalexandrov.poker.service.impl;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.fail;

import java.util.List;

import org.junit.jupiter.api.Test;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITiket;

public class TiketServiceTest extends AbstractTest {

	@Test
	public void testCreate() {
		final ITiket entity = saveNewTiket();

		final ITiket entityFromDb = tiketService.getFullInfo(entity.getId());

		assertNotNull(entityFromDb);
		assertEquals(entity.getUserAccount().getId(), entityFromDb.getUserAccount().getId());
		assertEquals(entity.getTiketTitle(), entityFromDb.getTiketTitle());
		assertEquals(entity.getTiketText(), entityFromDb.getTiketText());
		assertEquals(entity.getStatus(), entityFromDb.getStatus());
		assertNotNull(entityFromDb.getId());
		assertNotNull(entityFromDb.getCreated());
		assertNotNull(entityFromDb.getUpdated());
		assertTrue(entityFromDb.getCreated().equals(entityFromDb.getUpdated()));
	}

	@Test
	public void testCreateMultiple() {
		int initialSize = tiketService.getAll().size();

		final ITiket entity1 = tiketService.createEntity();
		entity1.setTiketTitle("tiket_title" + getRandomPrefix());
		entity1.setTiketText("tiket_text" + getRandomPrefix());
		entity1.setStatus("status" + getRandomPrefix());

		try {
			final ITiket entity2 = tiketService.createEntity();
			tiketService.save(entity1, entity2);
			fail("Tiket save should fail if name not specified");
		} catch (Exception e) {
			assertEquals(initialSize, tiketService.getAll().size());
		}

	}

	@Test
	public void testUpdate() throws InterruptedException {
		final ITiket entity = saveNewTiket();

		String newTitle = entity.getTiketTitle() + "_updated";
		String newText = entity.getTiketText() + "_updated";
		String newStatus = entity.getStatus() + "_updated";
		entity.setTiketTitle(newTitle);
		entity.setTiketText(newText);
		entity.setStatus(newStatus);
		Thread.sleep(2000);
		tiketService.save(entity);

		final ITiket entityFromDb = tiketService.get(entity.getId());

		assertNotNull(entityFromDb);
		assertEquals(newTitle, entityFromDb.getTiketTitle());
		assertEquals(newText, entityFromDb.getTiketText());
		assertEquals(newStatus, entityFromDb.getStatus());
		assertNotNull(entityFromDb.getId());
		assertNotNull(entityFromDb.getCreated());
		assertNotNull(entityFromDb.getUpdated());
		assertEquals(entity.getCreated(), entityFromDb.getCreated());
		assertTrue(entityFromDb.getUpdated().after(entity.getCreated()));
	}

	@Test
	public void testGetAll() {
		final int intialCount = tiketService.getAll().size();

		final int randomObjectsCount = getRandomObjectsCount();
		for (int i = 0; i < randomObjectsCount; i++) {
			saveNewTiket();
		}

		final List<ITiket> allEntities = tiketService.getAll();

		for (final ITiket entityFromDb : allEntities) {
			assertNotNull(entityFromDb.getTiketTitle());
			assertNotNull(entityFromDb.getTiketText());
			assertNotNull(entityFromDb.getStatus());
			assertNotNull(entityFromDb.getId());
			assertNotNull(entityFromDb.getCreated());
			assertNotNull(entityFromDb.getUpdated());
		}

		assertEquals(randomObjectsCount + intialCount, allEntities.size());
	}

	@Test
	public void testDelete() {
		final ITiket entity = saveNewTiket();
		tiketService.delete(entity.getId());
		assertNull(tiketService.get(entity.getId()));
	}

	@Test
	public void testDeleteAll() {
		saveNewTiket();
		tiketService.deleteAll();
		assertEquals(0, tiketService.getAll().size());
	}

}