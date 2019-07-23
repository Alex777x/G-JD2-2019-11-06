package by.itacademy.aalexandrov.poker.service;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.dao.api.filter.UserAccountFilter;

public interface IUserAccountService {

	long getCount(UserAccountFilter filter);

	List<IUserAccount> find(UserAccountFilter filter);
	
	void save(final IUserAccount entity);

	void save(IUserAccount... entities);

	List<IUserAccount> getAll();

	void deleteAll();

	void delete(final Integer id);

	IUserAccount get(final Integer id);

	IUserAccount createEntity();

	IUserAccount findNickname(String username);


}
