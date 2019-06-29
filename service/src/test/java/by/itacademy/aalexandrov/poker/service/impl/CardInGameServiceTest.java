package by.itacademy.aalexandrov.poker.service.impl;

import static org.junit.Assert.assertNull;
import static org.junit.Assert.fail;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.Test;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.CardStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICardInGame;


public class CardInGameServiceTest extends AbstractTest {
	
	@Test
	public void testCreate() {
		final ICardInGame entity = saveNewPlayerCard();

		final ICardInGame entityFromDb = cardInGameService.get(entity.getId());

		assertNotNull(entityFromDb);
		assertEquals(entity.getCardId().getId(), entityFromDb.getCardId().getId());
		assertEquals(entity.getGameId().getId(), entityFromDb.getGameId().getId());
		assertEquals(entity.getPlayerId().getId(), entityFromDb.getPlayerId().getId());
		assertEquals(entity.getCardStatus(), entityFromDb.getCardStatus());
		assertNotNull(entityFromDb.getId());
		assertNotNull(entityFromDb.getCreated());
		assertNotNull(entityFromDb.getUpdated());
		assertTrue(entityFromDb.getCreated().equals(entityFromDb.getUpdated()));
	}

	@Test
	public void testCreateMultiple() {
		int initialSize = cardInGameService.getAll().size();

		final ICardInGame entity1 = cardInGameService.createEntity();
		entity1.setCardId(saveNewCard());
		entity1.setGameId(saveNewGame());
		entity1.setPlayerId(saveNewPlayer());
		entity1.setCardStatus(CardStatus.PLAYERCARDCLOSED);

		try {
			final ICardInGame entity2 = cardInGameService.createEntity();
			cardInGameService.save(entity1, entity2);
			fail("PlayerCard save should fail if name not specified");
		} catch (Exception e) {
			assertEquals(initialSize, chatService.getAll().size());
		}

	}

	@Test
	public void testUpdate() throws InterruptedException {
		final ICardInGame entity = saveNewPlayerCard();

		CardStatus newCardStatus = entity.getCardStatus();
		entity.setCardStatus(newCardStatus);
		Thread.sleep(2000);
		cardInGameService.save(entity);

		final ICardInGame entityFromDb = cardInGameService.get(entity.getId());

		assertNotNull(entityFromDb);
		assertEquals(newCardStatus, entityFromDb.getCardStatus());
		assertNotNull(entityFromDb.getId());
		assertNotNull(entityFromDb.getCreated());
		assertNotNull(entityFromDb.getUpdated());
		assertEquals(entity.getCreated(), entityFromDb.getCreated());
		assertTrue(entityFromDb.getUpdated().after(entity.getCreated()));
	}

	@Test
	public void testGetAll() {
		final int intialCount = cardInGameService.getAll().size();

		final int randomObjectsCount = getRandomObjectsCount();
		for (int i = 0; i < randomObjectsCount; i++) {
			saveNewPlayerCard();
		}

		final List<ICardInGame> allEntities = cardInGameService.getAll();

		for (final ICardInGame entityFromDb : allEntities) {
			assertNotNull(entityFromDb.getCardId().getId());
			assertNotNull(entityFromDb.getGameId().getId());
			assertNotNull(entityFromDb.getPlayerId().getId());
			assertNotNull(entityFromDb.getCardStatus());
			assertNotNull(entityFromDb.getId());
			assertNotNull(entityFromDb.getCreated());
			assertNotNull(entityFromDb.getUpdated());
		}

		assertEquals(randomObjectsCount + intialCount, allEntities.size());
	}

	@Test
	public void testDelete() {
		final ICardInGame entity = saveNewPlayerCard();
		cardInGameService.delete(entity.getId());
		assertNull(cardInGameService.get(entity.getId()));
	}

	@Test
	public void testDeleteAll() {
		saveNewPlayerCard();
		cardInGameService.deleteAll();
		assertEquals(0, cardInGameService.getAll().size());
	}

}
