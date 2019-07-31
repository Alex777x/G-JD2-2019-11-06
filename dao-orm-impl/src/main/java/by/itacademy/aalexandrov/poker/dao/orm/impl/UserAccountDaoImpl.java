package by.itacademy.aalexandrov.poker.dao.orm.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import by.itacademy.aalexandrov.poker.dao.api.IUserAccountDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.dao.api.filter.UserAccountFilter;
import by.itacademy.aalexandrov.poker.dao.orm.impl.entity.UserAccount;

@Repository
public class UserAccountDaoImpl extends AbstractDaoImpl<IUserAccount, Integer> implements IUserAccountDao {

	protected UserAccountDaoImpl() {
		super(UserAccount.class);
	}

	@Override
	public IUserAccount createEntity() {
		return new UserAccount();
	}

	@Override
	public List<IUserAccount> find(UserAccountFilter filter) {
		throw new RuntimeException("not implemented");
	}

	@Override
	public long getCount(UserAccountFilter filter) {
		throw new RuntimeException("not implemented");
	}

	@Override
	public void save(IUserAccount... entities) {
		throw new RuntimeException("not implemented");

	}

	@Override
	public IUserAccount findNickname(String username) {
		throw new RuntimeException("not implemented");
	}

}
