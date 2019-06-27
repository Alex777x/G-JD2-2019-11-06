package by.itacademy.aalexandrov.poker.service.impl;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import by.itacademy.aalexandrov.poker.dao.api.IBoardDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IBoard;
import by.itacademy.aalexandrov.poker.dao.api.filter.BoardFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.BoardDaoImpl;
import by.itacademy.aalexandrov.poker.service.IBoardService;

public class BoardServiceImpl implements IBoardService {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(BoardServiceImpl.class);

	private IBoardDao dao = new BoardDaoImpl();

	@Override
	public IBoard createEntity() {
		return dao.createEntity();
	}

	@Override
	public void save(final IBoard entity) {
		final Date modifedOn = new Date();
		entity.setUpdated(modifedOn);
		if (entity.getId() == null) {
			LOGGER.info("new Board created: {}", entity);
			entity.setCreated(modifedOn);
			dao.insert(entity);
		} else {
			LOGGER.info("new Board updated: {}", entity);
			dao.update(entity);
		}
	}

	@Override
	public void save(IBoard... entities) {
		Date modified = new Date();
		for (IBoard iBoard : entities) {

			iBoard.setUpdated(modified);
			iBoard.setCreated(modified);

		}

		dao.save(entities);
	}

	@Override
	public IBoard get(final Integer id) {
		final IBoard entity = dao.get(id);
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
		LOGGER.info("delete all Boards");
		dao.deleteAll();
	}

	@Override
	public List<IBoard> getAll() {
		final List<IBoard> all = dao.selectAll();
		LOGGER.debug("total count in DB: {}", all.size());
		return all;
	}

	@Override
	public List<IBoard> find(BoardFilter filter) {
		return dao.find(filter);
	}

	@Override
	public long getCount(BoardFilter filter) {
		return dao.getCount(filter);
	}

}
