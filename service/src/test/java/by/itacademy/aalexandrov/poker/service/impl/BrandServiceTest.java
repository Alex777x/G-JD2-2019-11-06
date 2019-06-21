package by.itacademy.aalexandrov.poker.service.impl;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITiket;

public class BrandServiceTest extends AbstractTest {

	@Test
	public void testCreate() {
		final ITiket entity = saveNewTiket();

		final ITiket entityFromDb = tiketService.get(entity.getId());

		assertNotNull(entityFromDb);
		assertEquals(entity.getTiketTitle(), entityFromDb.getTiketTitle());
		assertEquals(entity.getTiketText(), entityFromDb.getTiketText());
		assertEquals(entity.getStatus(), entityFromDb.getStatus());
		assertNotNull(entityFromDb.getId());
		assertNotNull(entityFromDb.getCreated());
		assertNotNull(entityFromDb.getUpdated());
		assertTrue(entityFromDb.getCreated().equals(entityFromDb.getUpdated()));
	}

}