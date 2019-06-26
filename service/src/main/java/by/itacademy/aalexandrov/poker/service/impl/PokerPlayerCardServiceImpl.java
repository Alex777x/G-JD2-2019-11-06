package by.itacademy.aalexandrov.poker.service.impl;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import by.itacademy.aalexandrov.poker.dao.api.IPokerPlayerCardDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPokerPlayerCard;
import by.itacademy.aalexandrov.poker.dao.api.filter.PokerPlayerCardFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.PokerPlayerCardDaoImpl;
import by.itacademy.aalexandrov.poker.service.IPokerPlayerCardService;

public class PokerPlayerCardServiceImpl implements IPokerPlayerCardService {

	private static final Logger LOGGER = LoggerFactory.getLogger(PokerPlayerCardServiceImpl.class);

	private IPokerPlayerCardDao dao = new PokerPlayerCardDaoImpl();

	@Override
	public IPokerPlayerCard createEntity() {
		return dao.createEntity();
	}

	@Override
	public void save(final IPokerPlayerCard entity) {
		final Date modifedOn = new Date();
		entity.setUpdated(modifedOn);
		if (entity.getId() == null) {
			LOGGER.info("new PokerPlayerCard created: {}", entity);
			entity.setCreated(modifedOn);
			dao.insert(entity);
		} else {
			LOGGER.info("new PokerPlayerCard updated: {}", entity);
			dao.update(entity);
		}
	}

	@Override
	public void save(IPokerPlayerCard... entities) {
		Date modified = new Date();
		for (IPokerPlayerCard iPokerPlayerCard : entities) {

			iPokerPlayerCard.setUpdated(modified);
			iPokerPlayerCard.setCreated(modified);

		}

		dao.save(entities);
	}

	@Override
	public IPokerPlayerCard get(final Integer id) {
		final IPokerPlayerCard entity = dao.get(id);
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
		LOGGER.info("delete all PokerPlayerCards");
		dao.deleteAll();
	}

	@Override
	public List<IPokerPlayerCard> getAll() {
		final List<IPokerPlayerCard> all = dao.selectAll();
		LOGGER.debug("total count in DB: {}", all.size());
		return all;
	}

	@Override
	public List<IPokerPlayerCard> find(PokerPlayerCardFilter filter) {
		return dao.find(filter);
	}

	@Override
	public long getCount(PokerPlayerCardFilter filter) {
		return dao.getCount(filter);
	}

}
