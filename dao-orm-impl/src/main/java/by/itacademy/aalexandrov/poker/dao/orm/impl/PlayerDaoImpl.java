package by.itacademy.aalexandrov.poker.dao.orm.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import by.itacademy.aalexandrov.poker.dao.api.IPlayerDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.dao.api.filter.PlayerFilter;
import by.itacademy.aalexandrov.poker.dao.orm.impl.entity.Player;

@Repository
public class PlayerDaoImpl extends AbstractDaoImpl<IPlayer, Integer> implements IPlayerDao {

	protected PlayerDaoImpl() {
		super(Player.class);
	}

	@Override
	public IPlayer createEntity() {
		return new Player();
	}

	@Override
	public List<IPlayer> find(PlayerFilter filter) {
		throw new RuntimeException("not implemented");
	}

	@Override
	public long getCount(PlayerFilter filter) {
		throw new RuntimeException("not implemented");
	}

	@Override
	public void save(IPlayer... entities) {
		throw new RuntimeException("not implemented");

	}

}
