package by.itacademy.aalexandrov.poker.dao.orm.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import by.itacademy.aalexandrov.poker.dao.api.IPlayerActionDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayerAction;
import by.itacademy.aalexandrov.poker.dao.api.filter.PlayerActionFilter;
import by.itacademy.aalexandrov.poker.dao.orm.impl.entity.PlayerAction;

@Repository
public class PlayerActionDaoImpl extends AbstractDaoImpl<IPlayerAction, Integer> implements IPlayerActionDao {

	protected PlayerActionDaoImpl() {
		super(PlayerAction.class);
	}

	@Override
	public IPlayerAction createEntity() {
		return new PlayerAction();
	}

	@Override
	public List<IPlayerAction> find(PlayerActionFilter filter) {
		throw new RuntimeException("not implemented");
	}

	@Override
	public long getCount(PlayerActionFilter filter) {
		throw new RuntimeException("not implemented");
	}

	@Override
	public void save(IPlayerAction... entities) {
		throw new RuntimeException("not implemented");
	}

}
