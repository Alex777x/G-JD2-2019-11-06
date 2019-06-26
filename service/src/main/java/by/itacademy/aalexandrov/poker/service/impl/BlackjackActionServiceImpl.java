package by.itacademy.aalexandrov.poker.service.impl;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import by.itacademy.aalexandrov.poker.dao.api.IBlackjackActionDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IBlackjackAction;
import by.itacademy.aalexandrov.poker.dao.api.filter.BlackjackActionFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.BlackjackActionDaoImpl;
import by.itacademy.aalexandrov.poker.service.IBlackjackActionService;

public class BlackjackActionServiceImpl implements IBlackjackActionService {

	private IBlackjackActionDao dao = new BlackjackActionDaoImpl();

	private static final Logger LOGGER = LoggerFactory.getLogger(IBlackjackActionDao.class);

	@Override
	public IBlackjackAction createEntity() {
		return dao.createEntity();
	}

	@Override
	public void save(final IBlackjackAction entity) {
		final Date modifedOn = new Date();
		entity.setUpdated(modifedOn);
		if (entity.getId() == null) {
			LOGGER.info("new BlackjackAction created: {}", entity);
			entity.setCreated(modifedOn);
			dao.insert(entity);
		} else {
			LOGGER.debug("BlackjackAction updated: {}", entity);
			dao.update(entity);
		}
	}

	@Override
	public void save(IBlackjackAction... entities) {
		Date modified = new Date();
		for (IBlackjackAction iBlackjackAction : entities) {

			iBlackjackAction.setUpdated(modified);
			iBlackjackAction.setCreated(modified);

		}

		dao.save(entities);
	}

	@Override
	public IBlackjackAction get(final Integer id) {
		final IBlackjackAction entity = dao.get(id);
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
		LOGGER.info("delete all BlackjackActions");
		dao.deleteAll();
	}

	@Override
	public List<IBlackjackAction> getAll() {
		final List<IBlackjackAction> all = dao.selectAll();
		LOGGER.debug("total count in DB: {}", all.size());
		return all;
	}

	@Override
	public List<IBlackjackAction> find(BlackjackActionFilter filter) {
		return dao.find(filter);
	}

	@Override
	public long getCount(BlackjackActionFilter filter) {
		return dao.getCount(filter);
	}

}
