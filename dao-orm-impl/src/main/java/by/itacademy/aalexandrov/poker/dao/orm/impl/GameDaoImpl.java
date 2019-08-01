package by.itacademy.aalexandrov.poker.dao.orm.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import by.itacademy.aalexandrov.poker.dao.api.IGameDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.filter.GameFilter;
import by.itacademy.aalexandrov.poker.dao.orm.impl.entity.Game;

@Repository
public class GameDaoImpl extends AbstractDaoImpl<IGame, Integer> implements IGameDao {

	protected GameDaoImpl() {
		super(Game.class);
	}

	@Override
	public IGame createEntity() {
		return new Game();
	}

	@Override
	public List<IGame> find(GameFilter filter) {
		throw new RuntimeException("not implemented");
	}

	@Override
	public long getCount(GameFilter filter) {
		throw new RuntimeException("not implemented");
	}

	@Override
	public void save(IGame... entities) {
		throw new RuntimeException("not implemented");
	}

}
