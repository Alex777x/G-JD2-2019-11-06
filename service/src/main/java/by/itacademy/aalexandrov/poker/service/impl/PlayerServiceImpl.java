package by.itacademy.aalexandrov.poker.service.impl;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import by.itacademy.aalexandrov.poker.dao.api.IPlayerDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.dao.api.filter.PlayerFilter;
import by.itacademy.aalexandrov.poker.service.IPlayerService;

@Service
public class PlayerServiceImpl implements IPlayerService {

	private static final Logger LOGGER = LoggerFactory.getLogger(PlayerServiceImpl.class);

	private IPlayerDao dao;

	@Autowired
	public PlayerServiceImpl(IPlayerDao dao) {
		super();
		this.dao = dao;
	}

	@Override
	public IPlayer createEntity() {
		return dao.createEntity();
	}

	@Override
	public void save(final IPlayer entity) {
		final Date modifedOn = new Date();
		entity.setUpdated(modifedOn);
		if (entity.getId() == null) {
			LOGGER.info("new Player created: {}", entity);
			entity.setCreated(modifedOn);
			dao.insert(entity);
		} else {
			LOGGER.info("new Player updated: {}", entity);
			dao.update(entity);
		}
	}

	@Override
	public void save(IPlayer... entities) {
		Date modified = new Date();
		for (IPlayer iPlayer : entities) {

			iPlayer.setUpdated(modified);
			iPlayer.setCreated(modified);

		}

		dao.save(entities);
	}

	@Override
	public IPlayer get(final Integer id) {
		final IPlayer entity = dao.get(id);
		LOGGER.debug("entityById: {}", entity);
		return entity;
	}

	@Override
	public void delete(final Integer id) {
		LOGGER.info("delete entity: {}", id);
		dao.delete(id);
	}

	@Override
	public void deleteAll() {
		LOGGER.info("delete all Players");
		dao.deleteAll();
	}

	@Override
	public List<IPlayer> getAll() {
		final List<IPlayer> all = dao.selectAll();
		LOGGER.debug("total count in DB: {}", all.size());
		return all;
	}

	@Override
	public List<IPlayer> find(PlayerFilter filter) {
		return dao.find(filter);
	}

	@Override
	public long getCount(PlayerFilter filter) {
		return dao.getCount(filter);
	}

	@Override
	public IPlayer getFullInfo(Integer id) {
		return dao.getFullInfo(id);
	}

	@Override
	public List<IPlayer> getFullInfo() {
		return dao.getFullInfo();
	}

	@Override
	public long getPlayersCount(Integer id) {
		return dao.getPlayersCount(id);
	}

	@Override
	public void updateState(Integer loggedUserId) {
		dao.updateState(loggedUserId);

	}

}
