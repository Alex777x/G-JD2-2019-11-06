package by.itacademy.aalexandrov.poker.service.impl;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.fail;

import java.util.List;

import org.junit.jupiter.api.Test;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IChat;

public class ChatServiceTest extends AbstractTest {

	@Test
	public void testCreate() {
		final IChat entity = saveNewChat();

		final IChat entityFromDb = chatService.getFullInfo(entity.getId());

		assertNotNull(entityFromDb);
		assertEquals(entity.getGame().getId(), entityFromDb.getGame().getId());
		assertEquals(entity.getUserAccount().getId(), entityFromDb.getUserAccount().getId());
		assertEquals(entity.getMessage(), entityFromDb.getMessage());
		assertNotNull(entityFromDb.getId());
		assertNotNull(entityFromDb.getCreated());
		assertNotNull(entityFromDb.getUpdated());
		assertTrue(entityFromDb.getCreated().equals(entityFromDb.getUpdated()));
	}

	@Test
	public void testCreateMultiple() {
		int initialSize = chatService.getAll().size();

		final IChat entity1 = chatService.createEntity();
		entity1.setGame(saveNewGame());
		entity1.setUserAccount(saveNewUserAccount());
		entity1.setMessage("message" + getRandomPrefix());

		try {
			final IChat entity2 = chatService.createEntity();
			chatService.save(entity1, entity2);
			fail("Chat save should fail if name not specified");
		} catch (Exception e) {
			assertEquals(initialSize, chatService.getAll().size());
		}

	}

	@Test
	public void testUpdate() throws InterruptedException {
		final IChat entity = saveNewChat();

		String newTitle = entity.getMessage() + "_updated";
		entity.setMessage(newTitle);
		Thread.sleep(2000);
		chatService.save(entity);

		final IChat entityFromDb = chatService.get(entity.getId());

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
		final int intialCount = chatService.getAll().size();

		final int randomObjectsCount = getRandomObjectsCount();
		for (int i = 0; i < randomObjectsCount; i++) {
			saveNewChat();
		}

		final List<IChat> allEntities = chatService.getAll();

		for (final IChat entityFromDb : allEntities) {
			assertNotNull(entityFromDb.getGame());
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
		final IChat entity = saveNewChat();
		chatService.delete(entity.getId());
		assertNull(chatService.get(entity.getId()));
	}

	@Test
	public void testDeleteAll() {
		saveNewChat();
		chatService.deleteAll();
		assertEquals(0, chatService.getAll().size());
	}

}
