package by.itacademy.aalexandrov.poker.service.impl;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import by.itacademy.aalexandrov.poker.dao.api.IGameDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.filter.GameFilter;
import by.itacademy.aalexandrov.poker.service.IGameService;

@Service
public class GameServiceImpl implements IGameService {

	private static final Logger LOGGER = LoggerFactory.getLogger(GameServiceImpl.class);

	private IGameDao dao;

	@Autowired
	public GameServiceImpl(IGameDao dao) {
		super();
		this.dao = dao;
	}

	@Override
	public IGame createEntity() {
		return dao.createEntity();
	}

	@Override
	public void save(final IGame entity) {
		final Date modifedOn = new Date();
		entity.setUpdated(modifedOn);
		if (entity.getId() == null) {
			LOGGER.info("new Game created: {}", entity);
			entity.setCreated(modifedOn);
			dao.insert(entity);
		} else {
			LOGGER.info("new Game updated: {}", entity);
			dao.update(entity);
		}
	}

	@Override
	public void save(IGame... entities) {
		Date modified = new Date();
		for (IGame iGame : entities) {

			iGame.setUpdated(modified);
			iGame.setCreated(modified);

		}

		dao.save(entities);
	}

	@Override
	public IGame get(final Integer id) {
		final IGame entity = dao.get(id);
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
		LOGGER.info("delete all Games");
		dao.deleteAll();
	}

	@Override
	public List<IGame> getAll() {
		final List<IGame> all = dao.selectAll();
		LOGGER.debug("total count in DB: {}", all.size());
		return all;
	}

	@Override
	public List<IGame> find(GameFilter filter) {
		return dao.find(filter);
	}

	@Override
	public long getCount(GameFilter filter) {
		return dao.getCount(filter);
	}

	@Override
	public IGame getFullInfo(Integer id) {
		return dao.getFullInfo(id);
	}

}
