package by.itacademy.aalexandrov.poker.service.impl;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.fail;

import java.util.List;

import org.junit.jupiter.api.Test;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.UserRole;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.UserStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.dao.api.filter.UserAccountFilter;

public class UserAccountServiceTest extends AbstractTest {

	@Test
	public void testCreate() {
		IUserAccount entity = saveNewUserAccount();

		final IUserAccount entityFromDb = userAccountService.get(entity.getId());

		assertNotNull(entityFromDb);
		assertEquals(entity.getNickname(), entityFromDb.getNickname());
		assertEquals(entity.getPassword(), entityFromDb.getPassword());
		assertEquals(entity.getEmail(), entityFromDb.getEmail());
		assertEquals(entity.getFoto(), entityFromDb.getFoto());
		// assertEquals(entity.getCountry().getId(), entityFromDb.getCountry().getId());
		assertEquals(entity.getUserRole(), entityFromDb.getUserRole());
		assertEquals(entity.getUserStatus(), entityFromDb.getUserStatus());
		assertEquals(entity.getSumGames(), entityFromDb.getSumGames());
		assertEquals(entity.getWonGames(), entityFromDb.getWonGames());
		assertNotNull(entityFromDb.getId());
		assertNotNull(entityFromDb.getCreated());
		assertNotNull(entityFromDb.getUpdated());
		assertTrue(entityFromDb.getCreated().equals(entityFromDb.getUpdated()));
	}

	@Test
	public void testCreateMultiple() {
		int initialSize = userAccountService.getAll().size();

		final IUserAccount entity1 = userAccountService.createEntity();
		entity1.setNickname(getRandomPrefix());
		entity1.setPassword(getRandomPrefix());
		entity1.setEmail(getRandomPrefix());
		entity1.setFoto(getRandomPrefix());
		entity1.setCountry(saveNewCountry());
		entity1.setUserRole(UserRole.MEMBER);
		entity1.setUserStatus(UserStatus.ACTIVE);
		entity1.setSumGames(getRandomObjectsCount());
		entity1.setWonGames(getRandomObjectsCount());

		try {
			final IUserAccount entity2 = userAccountService.createEntity();
			userAccountService.save(entity1, entity2);
			fail("PokerAction save should fail if name not specified");
		} catch (Exception e) {
			assertEquals(initialSize, userAccountService.getAll().size());
		}

	}

	@Test
	public void testUpdate() throws InterruptedException {
		final IUserAccount entity = saveNewUserAccount();

		String newNickname = entity.getNickname() + "_updated";
		String newPassword = entity.getPassword() + "_updated";
		String newEmail = entity.getEmail() + "_updated";
		String newFoto = entity.getFoto() + "_updated";
		UserRole newUserRole = entity.getUserRole();
		UserStatus newUserStatus = entity.getUserStatus();
		Integer newSumGames = entity.getSumGames() + 1001;
		Integer newWonGames = entity.getWonGames() + 1001;
		entity.setNickname(newNickname);
		entity.setPassword(newPassword);
		entity.setEmail(newEmail);
		entity.setFoto(newFoto);
		entity.setUserRole(newUserRole);
		entity.setUserStatus(newUserStatus);
		entity.setSumGames(newSumGames);
		entity.setWonGames(newWonGames);
		Thread.sleep(2000);
		userAccountService.save(entity);

		final IUserAccount entityFromDb = userAccountService.get(entity.getId());

		assertNotNull(entityFromDb);
		assertEquals(newNickname, entityFromDb.getNickname());
		assertEquals(newPassword, entityFromDb.getPassword());
		assertEquals(newEmail, entityFromDb.getEmail());
		assertEquals(newFoto, entityFromDb.getFoto());
		assertEquals(newUserRole, entityFromDb.getUserRole());
		assertEquals(newUserStatus, entityFromDb.getUserStatus());
		assertEquals(newSumGames, entityFromDb.getSumGames());
		assertEquals(newWonGames, entityFromDb.getWonGames());
		assertNotNull(entityFromDb.getId());
		assertNotNull(entityFromDb.getCreated());
		assertNotNull(entityFromDb.getUpdated());
		assertEquals(entity.getCreated(), entityFromDb.getCreated());
		assertTrue(entityFromDb.getUpdated().after(entity.getCreated()));
	}

	@Test
	public void testGetAll() {
		final int intialCount = userAccountService.getAll().size();

		final int randomObjectsCount = getRandomObjectsCount();
		for (int i = 0; i < randomObjectsCount; i++) {
			saveNewUserAccount();
		}

		final List<IUserAccount> allEntities = userAccountService.getAll();

		for (final IUserAccount entityFromDb : allEntities) {
			assertNotNull(entityFromDb.getNickname());
			assertNotNull(entityFromDb.getPassword());
			assertNotNull(entityFromDb.getEmail());
			assertNotNull(entityFromDb.getFoto());
			// assertNotNull(entityFromDb.getCountry().getId());
			assertNotNull(entityFromDb.getUserRole());
			assertNotNull(entityFromDb.getUserStatus());
			assertNotNull(entityFromDb.getSumGames());
			assertNotNull(entityFromDb.getWonGames());
			assertNotNull(entityFromDb.getId());
			assertNotNull(entityFromDb.getCreated());
			assertNotNull(entityFromDb.getUpdated());
		}

		assertEquals(randomObjectsCount + intialCount, allEntities.size());
	}

	@Test
	public void testDelete() {
		final IUserAccount entity = saveNewUserAccount();
		userAccountService.delete(entity.getId());
		assertNull(userAccountService.get(entity.getId()));
	}

	@Test
	public void testDeleteAll() {
		saveNewUserAccount();
		userAccountService.deleteAll();
		assertEquals(0, userAccountService.getAll().size());
	}

	@Test
	public void testFind() {
		for (int i = 0; i < 6; i++) {
			saveNewUserAccount();
		}

		UserAccountFilter filter = new UserAccountFilter();

		assertEquals(6, userAccountService.getCount(filter));
		assertEquals(6, userAccountService.find(filter).size());

		filter.setLimit(5);
		assertEquals(5, userAccountService.find(filter).size());

		filter.setOffset(5);
		assertEquals(1, userAccountService.find(filter).size());

		filter = new UserAccountFilter();
		filter.setSortColumn("id");
		filter.setSortOrder(true);
		List<IUserAccount> ascBrands = userAccountService.find(filter);
		verifyOrderById(ascBrands, true);

		filter.setSortOrder(false);
		List<IUserAccount> descBrands = userAccountService.find(filter);
		verifyOrderById(descBrands, false);

	}

}
