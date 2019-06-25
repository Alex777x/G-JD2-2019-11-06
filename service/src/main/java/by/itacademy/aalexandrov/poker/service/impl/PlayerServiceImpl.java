package by.itacademy.aalexandrov.poker.service.impl;

import java.util.Date;
import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.IPlayerDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.dao.api.filter.PlayerFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.PlayerDaoImpl;
import by.itacademy.aalexandrov.poker.service.IPlayerService;

public class PlayerServiceImpl implements IPlayerService {
	
	private IPlayerDao dao = new PlayerDaoImpl();
	
	@Override
	public IPlayer createEntity() {
		return dao.createEntity();
	}

	@Override
	public void save(final IPlayer entity) {
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
	public IPlayer get(final Integer id) {
		final IPlayer entity = dao.get(id);
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
	public List<IPlayer> getAll() {
		final List<IPlayer> all = dao.selectAll();
		return all;
	}
	
	@Override
    public void save(IPlayer... entities) {
        Date modified = new Date();
        for (IPlayer iPokerAction : entities) {

        	iPokerAction.setUpdated(modified);
        	iPokerAction.setCreated(modified);

        }

        dao.save(entities);
    }

	@Override
	public List<IPlayer> find(PlayerFilter filter) {
		return dao.find(filter);
	}

	@Override
	public long getCount(PlayerFilter filter) {
		return dao.getCount(filter);
	}

}
