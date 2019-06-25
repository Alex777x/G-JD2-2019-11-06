package by.itacademy.aalexandrov.poker.service.impl;

import java.util.Date;
import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.IGameDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.filter.GameFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.GameDaoImpl;
import by.itacademy.aalexandrov.poker.service.IGameService;

public class GameServiceImpl implements IGameService {
	
	private IGameDao dao = new GameDaoImpl();
	
	@Override
	public IGame createEntity() {
		return dao.createEntity();
	}

	@Override
	public void save(final IGame entity) {
		final Date modifedOn = new Date();
		entity.setUpdated(modifedOn);
		if (entity.getId() == null) {
			entity.setCreated(modifedOn);
			dao.insert(entity);
		} else {
			dao.update(entity);
		}
	}

	@Override
	public IGame get(final Integer id) {
		final IGame entity = dao.get(id);
		return entity;
	}

	@Override
	public void delete(final Integer id) {
		dao.delete(id);
	}

	@Override
	public void deleteAll() {
		dao.deleteAll();
	}

	@Override
	public List<IGame> getAll() {
		final List<IGame> all = dao.selectAll();
		return all;
	}
	
	@Override
    public void save(IGame... entities) {
        Date modified = new Date();
        for (IGame iPokerAction : entities) {

        	iPokerAction.setUpdated(modified);
        	iPokerAction.setCreated(modified);

        }

        dao.save(entities);
    }

	@Override
	public List<IGame> find(GameFilter filter) {
		return dao.find(filter);
	}

	@Override
	public long getCount(GameFilter filter) {
		return dao.getCount(filter);
	}

}
