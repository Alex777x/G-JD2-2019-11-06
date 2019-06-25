package by.itacademy.aalexandrov.poker.service.impl;

import static org.junit.Assert.assertNull;
import static org.junit.Assert.fail;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.Test;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.UserRole;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.UserStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICountry;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITranzaction;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.Country;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.Tranzaction;


public class UserAccountServiceTest extends AbstractTest {
	
	@Test
	public void testCreate() {
		final IUserAccount entity = saveNewUserAccount();

		final IUserAccount entityFromDb = userAccountService.get(entity.getId());

		assertNotNull(entityFromDb);
		assertEquals(entity.getNickname(), entityFromDb.getNickname());
		assertEquals(entity.getPassword(), entityFromDb.getPassword());
		assertEquals(entity.getEmail(), entityFromDb.getEmail());
		assertEquals(entity.getFoto(), entityFromDb.getFoto());
		assertEquals(entity.getCountry(), entityFromDb.getCountry());
		assertEquals(entity.getUserRole(), entityFromDb.getUserRole());
		assertEquals(entity.getUserStatus(), entityFromDb.getUserStatus());
		assertEquals(entity.getTranzaction(), entityFromDb.getTranzaction());
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
		//entity1.setCountry(new Country());
		entity1.setUserRole(UserRole.member);
		entity1.setUserStatus(UserStatus.active);
		//entity1.setTranzaction(new Tranzaction());

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

		String newNickname = entity.getNickname();
		String newPassword = entity.getPassword();
		String newEmail = entity.getEmail();
		String newFoto = entity.getFoto();
		ICountry newCountry = entity.getCountry();
		UserRole newUserRole = entity.getUserRole();
		UserStatus newUserStatus = entity.getUserStatus();
		ITranzaction newTranzaction = entity.getTranzaction();
		entity.setNickname(newNickname);
		entity.setPassword(newPassword);
		entity.setEmail(newEmail);
		entity.setFoto(newFoto);
		entity.setCountry(newCountry);
		entity.setUserRole(newUserRole);
		entity.setUserStatus(newUserStatus);
		entity.setTranzaction(newTranzaction);
		Thread.sleep(2000);
		userAccountService.save(entity);

		final IUserAccount entityFromDb = userAccountService.get(entity.getId());

		assertNotNull(entityFromDb);
		assertEquals(newNickname, entityFromDb.getNickname());
		assertEquals(newPassword, entityFromDb.getPassword());
		assertEquals(newEmail, entityFromDb.getEmail());
		assertEquals(newFoto, entityFromDb.getFoto());
		assertEquals(newCountry, entityFromDb.getCountry());
		assertEquals(newUserRole, entityFromDb.getUserRole());
		assertEquals(newUserStatus, entityFromDb.getUserStatus());
		assertEquals(newTranzaction, entityFromDb.getTranzaction());
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
			assertNotNull(entityFromDb.getCountry());
			assertNotNull(entityFromDb.getUserRole());
			assertNotNull(entityFromDb.getUserStatus());
			assertNotNull(entityFromDb.getTranzaction());
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

}
