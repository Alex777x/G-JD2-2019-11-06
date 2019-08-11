package by.itacademy.aalexandrov.poker.dao.api;

import java.util.List;
import java.util.Map;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.dao.api.filter.UserAccountFilter;

public interface IUserAccountDao extends IDao<IUserAccount, Integer> {

	List<IUserAccount> find(UserAccountFilter filter);

	long getCount(UserAccountFilter filter);

	void save(IUserAccount... entities);

	IUserAccount findNickname(String username);

	IUserAccount getFullInfo(Integer id);

	List<IUserAccount> getFullInfo();

	Map<String, Integer> getCoefficient();

}
