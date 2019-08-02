package by.itacademy.aalexandrov.poker.service;

import java.util.List;

import javax.transaction.Transactional;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.dao.api.filter.UserAccountFilter;

public interface IUserAccountService {

	@Transactional
	long getCount(UserAccountFilter filter);

	List<IUserAccount> find(UserAccountFilter filter);

	@Transactional
	void save(final IUserAccount entity);

	@Transactional
	void save(IUserAccount... entities);

	List<IUserAccount> getAll();

	@Transactional
	void deleteAll();

	@Transactional
	void delete(final Integer id);

	IUserAccount get(final Integer id);

	@Transactional
	IUserAccount createEntity();

	@Transactional
	IUserAccount findNickname(String username);

}
