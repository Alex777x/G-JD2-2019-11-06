package by.itacademy.aalexandrov.poker.service.impl;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.fail;

import java.util.List;

import org.junit.jupiter.api.Test;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IChatInHome;

public class ChatInHomeServiceTest extends AbstractTest {

	@Test
	public void testCreate() {
		final IChatInHome entity = saveNewChatInHome();

		final IChatInHome entityFromDb = chatInHomeService.getFullInfo(entity.getId());

		assertNotNull(entityFromDb);
		assertEquals(entity.getUserAccount().getId(), entityFromDb.getUserAccount().getId());
		assertEquals(entity.getMessage(), entityFromDb.getMessage());
		assertNotNull(entityFromDb.getId());
		assertNotNull(entityFromDb.getCreated());
		assertNotNull(entityFromDb.getUpdated());
		assertTrue(entityFromDb.getCreated().equals(entityFromDb.getUpdated()));
	}

	@Test
	public void testCreateMultiple() {
		int initialSize = chatInHomeService.getAll().size();

		final IChatInHome entity1 = chatInHomeService.createEntity();
		entity1.setUserAccount(saveNewUserAccount());
		entity1.setMessage("message" + getRandomPrefix());

		try {
			final IChatInHome entity2 = chatInHomeService.createEntity();
			chatInHomeService.save(entity1, entity2);
			fail("Chat save should fail if name not specified");
		} catch (Exception e) {
			assertEquals(initialSize, chatInHomeService.getAll().size());
		}

	}

	@Test
	public void testUpdate() throws InterruptedException {
		final IChatInHome entity = saveNewChatInHome();

		String newTitle = entity.getMessage() + "_updated";
		entity.setMessage(newTitle);
		Thread.sleep(2000);
		chatInHomeService.save(entity);

		final IChatInHome entityFromDb = chatInHomeService.get(entity.getId());

		assertNotNull(entityFromDb);
		assertEquals(newTitle, entityFromDb.getMessage());
		assertNotNull(entityFromDb.getId());
		assertNotNull(entityFromDb.getCreated());
		assertNotNull(entityFromDb.getUpdated());
		assertEquals(entity.getCreated(), entityFromDb.getCreated());
		assertTrue(entityFromDb.getUpdated().after(entity.getCreated()));
	}

	@Test
	public void testGetAll() {
		final int intialCount = chatInHomeService.getAll().size();

		final int randomObjectsCount = getRandomObjectsCount();
		for (int i = 0; i < randomObjectsCount; i++) {
			saveNewChat();
		}

		final List<IChatInHome> allEntities = chatInHomeService.getFullInfo();

		for (final IChatInHome entityFromDb : allEntities) {
			assertNotNull(entityFromDb.getUserAccount());
			assertNotNull(entityFromDb.getMessage());
			assertNotNull(entityFromDb.getId());
			assertNotNull(entityFromDb.getCreated());
			assertNotNull(entityFromDb.getUpdated());
		}

		assertEquals(randomObjectsCount + intialCount, allEntities.size());
	}

	@Test
	public void testDelete() {
		final IChatInHome entity = saveNewChatInHome();
		chatInHomeService.delete(entity.getId());
		assertNull(chatInHomeService.get(entity.getId()));
	}

	@Test
	public void testDeleteAll() {
		saveNewChatInHome();
		chatInHomeService.deleteAll();
		assertEquals(0, chatInHomeService.getAll().size());
	}

}
