package by.itacademy.aalexandrov.poker.service.impl;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import by.itacademy.aalexandrov.poker.dao.api.IPokerBoardDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPokerBoard;
import by.itacademy.aalexandrov.poker.dao.api.filter.PokerBoardFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.PokerBoardDaoImpl;
import by.itacademy.aalexandrov.poker.service.IPokerBoardService;

public class PokerBoardServiceImpl implements IPokerBoardService {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(PokerBoardServiceImpl.class);

	private IPokerBoardDao dao = new PokerBoardDaoImpl();

	@Override
	public IPokerBoard createEntity() {
		return dao.createEntity();
	}

	@Override
	public void save(final IPokerBoard entity) {
		final Date modifedOn = new Date();
		entity.setUpdated(modifedOn);
		if (entity.getId() == null) {
			LOGGER.info("new PokerBoard created: {}", entity);
			entity.setCreated(modifedOn);
			dao.insert(entity);
		} else {
			LOGGER.info("new PokerBoard updated: {}", entity);
			dao.update(entity);
		}
	}

	@Override
	public void save(IPokerBoard... entities) {
		Date modified = new Date();
		for (IPokerBoard iPokerBoard : entities) {

			iPokerBoard.setUpdated(modified);
			iPokerBoard.setCreated(modified);

		}

		dao.save(entities);
	}

	@Override
	public IPokerBoard get(final Integer id) {
		final IPokerBoard entity = dao.get(id);
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
		LOGGER.info("delete all PokerBoards");
		dao.deleteAll();
	}

	@Override
	public List<IPokerBoard> getAll() {
		final List<IPokerBoard> all = dao.selectAll();
		LOGGER.debug("total count in DB: {}", all.size());
		return all;
	}

	@Override
	public List<IPokerBoard> find(PokerBoardFilter filter) {
		return dao.find(filter);
	}

	@Override
	public long getCount(PokerBoardFilter filter) {
		return dao.getCount(filter);
	}

}
