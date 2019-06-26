package by.itacademy.aalexandrov.poker.service.impl;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import by.itacademy.aalexandrov.poker.dao.api.IBlackjackBoardDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IBlackjacBoard;
import by.itacademy.aalexandrov.poker.dao.api.filter.BlackjacBoardFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.BlackjackBoardDaoImpl;
import by.itacademy.aalexandrov.poker.service.IBlackjackBoardService;

public class BlackjackBoardServiceImpl implements IBlackjackBoardService {

	private static final Logger LOGGER = LoggerFactory.getLogger(BlackjackBoardServiceImpl.class);

	private IBlackjackBoardDao dao = new BlackjackBoardDaoImpl();

	@Override
	public IBlackjacBoard createEntity() {
		return dao.createEntity();
	}

	@Override
	public void save(final IBlackjacBoard entity) {
		final Date modifedOn = new Date();
		entity.setUpdated(modifedOn);
		if (entity.getId() == null) {
			LOGGER.info("new BlackjackBoard created: {}", entity);
			entity.setCreated(modifedOn);
			dao.insert(entity);
		} else {
			LOGGER.info("new BlackjackBoard updated: {}", entity);
			dao.update(entity);
		}
	}
	
	@Override
	public void save(IBlackjacBoard... entities) {
		Date modified = new Date();
		for (IBlackjacBoard iBlackjacBoard : entities) {

			iBlackjacBoard.setUpdated(modified);
			iBlackjacBoard.setCreated(modified);

		}

		dao.save(entities);
	}

	@Override
	public IBlackjacBoard get(final Integer id) {
		final IBlackjacBoard entity = dao.get(id);
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
		LOGGER.info("delete all BlackjacBoards");
		dao.deleteAll();
	}

	@Override
	public List<IBlackjacBoard> getAll() {
		final List<IBlackjacBoard> all = dao.selectAll();
		LOGGER.debug("total count in DB: {}", all.size());
		return all;
	}


	@Override
	public List<IBlackjacBoard> find(BlackjacBoardFilter filter) {
		return dao.find(filter);
	}

	@Override
	public long getCount(BlackjacBoardFilter filter) {
		return dao.getCount(filter);
	}

}
