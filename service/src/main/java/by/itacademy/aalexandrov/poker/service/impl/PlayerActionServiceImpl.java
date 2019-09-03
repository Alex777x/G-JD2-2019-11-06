package by.itacademy.aalexandrov.poker.service.impl;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import by.itacademy.aalexandrov.poker.dao.api.IPlayerActionDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayerAction;
import by.itacademy.aalexandrov.poker.dao.api.filter.PlayerActionFilter;
import by.itacademy.aalexandrov.poker.service.IPlayerActionService;

@Service
public class PlayerActionServiceImpl implements IPlayerActionService {

	private static final Logger LOGGER = LoggerFactory.getLogger(PlayerActionServiceImpl.class);

	private IPlayerActionDao dao;

	@Autowired
	public PlayerActionServiceImpl(IPlayerActionDao dao) {
		super();
		this.dao = dao;
	}

	@Override
	public IPlayerAction createEntity() {
		IPlayerAction createEntity = dao.createEntity();
		createEntity.setAllIn(0);
		createEntity.setBet(0);
		createEntity.setCall(0);
		createEntity.setCheck(false);
		createEntity.setFold(false);
		createEntity.setRaise(0);

		return createEntity;
	}

	@Override
	public void save(final IPlayerAction entity) {
		final Date modifedOn = new Date();
		entity.setUpdated(modifedOn);
		if (entity.getId() == null) {
			LOGGER.info("new PlayerAction created: {}", entity);
			entity.setCreated(modifedOn);
			dao.insert(entity);
		} else {
			LOGGER.info("new PlayerAction updated: {}", entity);
			dao.update(entity);
		}
	}

	@Override
	public void save(IPlayerAction... entities) {
		Date modified = new Date();
		for (IPlayerAction iAction : entities) {

			iAction.setUpdated(modified);
			iAction.setCreated(modified);

		}

		dao.save(entities);
	}

	@Override
	public IPlayerAction get(final Integer id) {
		final IPlayerAction entity = dao.get(id);
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
		LOGGER.info("delete all PlayerActions");
		dao.deleteAll();
	}

	@Override
	public List<IPlayerAction> getAll() {
		final List<IPlayerAction> all = dao.selectAll();
		LOGGER.debug("total count in DB: {}", all.size());
		return all;
	}

	@Override
	public List<IPlayerAction> find(PlayerActionFilter filter) {
		return dao.find(filter);
	}

	@Override
	public long getCount(PlayerActionFilter filter) {
		return dao.getCount(filter);
	}

	@Override
	public IPlayerAction getFullInfo(Integer id) {
		return dao.getFullInfo(id);
	}

	@Override
	public List<IPlayerAction> getFullInfo() {
		return dao.getFullInfo();
	}

	@Override
	public IPlayerAction getActionByPlayer(Integer id) {
		return dao.getActionByPlayer(id);
	}

}
