package by.itacademy.aalexandrov.poker.service.impl;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import by.itacademy.aalexandrov.poker.dao.api.IPokerActionDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPokerAction;
import by.itacademy.aalexandrov.poker.dao.api.filter.PokerActionFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.PokerActionDaoImpl;
import by.itacademy.aalexandrov.poker.service.IPokerActionService;

public class PokerActionServiceImpl implements IPokerActionService {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(PokerActionServiceImpl.class);

	private IPokerActionDao dao = new PokerActionDaoImpl();

	@Override
	public IPokerAction createEntity() {
		return dao.createEntity();
	}

	@Override
	public void save(final IPokerAction entity) {
		final Date modifedOn = new Date();
		entity.setUpdated(modifedOn);
		if (entity.getId() == null) {
			LOGGER.info("new PokerAction created: {}", entity);
			entity.setCreated(modifedOn);
			dao.insert(entity);
		} else {
			LOGGER.info("new PokerAction updated: {}", entity);
			dao.update(entity);
		}
	}

	@Override
	public void save(IPokerAction... entities) {
		Date modified = new Date();
		for (IPokerAction iPokerAction : entities) {

			iPokerAction.setUpdated(modified);
			iPokerAction.setCreated(modified);

		}

		dao.save(entities);
	}

	@Override
	public IPokerAction get(final Integer id) {
		final IPokerAction entity = dao.get(id);
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
		LOGGER.info("delete all PokerActions");
		dao.deleteAll();
	}

	@Override
	public List<IPokerAction> getAll() {
		final List<IPokerAction> all = dao.selectAll();
		LOGGER.debug("total count in DB: {}", all.size());
		return all;
	}

	@Override
	public List<IPokerAction> find(PokerActionFilter filter) {
		return dao.find(filter);
	}

	@Override
	public long getCount(PokerActionFilter filter) {
		return dao.getCount(filter);
	}

}
