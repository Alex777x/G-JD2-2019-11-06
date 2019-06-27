package by.itacademy.aalexandrov.poker.service.impl;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import by.itacademy.aalexandrov.poker.dao.api.IPlayerCardDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayerCard;
import by.itacademy.aalexandrov.poker.dao.api.filter.PlayerCardFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.PlayerCardDaoImpl;
import by.itacademy.aalexandrov.poker.service.IPlayerCardService;

public class PlayerCardServiceImpl implements IPlayerCardService {

	private static final Logger LOGGER = LoggerFactory.getLogger(PlayerCardServiceImpl.class);

	private IPlayerCardDao dao = new PlayerCardDaoImpl();

	@Override
	public IPlayerCard createEntity() {
		return dao.createEntity();
	}

	@Override
	public void save(final IPlayerCard entity) {
		final Date modifedOn = new Date();
		entity.setUpdated(modifedOn);
		if (entity.getId() == null) {
			LOGGER.info("new PlayerCard created: {}", entity);
			entity.setCreated(modifedOn);
			dao.insert(entity);
		} else {
			LOGGER.info("new PlayerCard updated: {}", entity);
			dao.update(entity);
		}
	}

	@Override
	public void save(IPlayerCard... entities) {
		Date modified = new Date();
		for (IPlayerCard iPlayerCard : entities) {

			iPlayerCard.setUpdated(modified);
			iPlayerCard.setCreated(modified);

		}

		dao.save(entities);
	}

	@Override
	public IPlayerCard get(final Integer id) {
		final IPlayerCard entity = dao.get(id);
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
		LOGGER.info("delete all PlayerCards");
		dao.deleteAll();
	}

	@Override
	public List<IPlayerCard> getAll() {
		final List<IPlayerCard> all = dao.selectAll();
		LOGGER.debug("total count in DB: {}", all.size());
		return all;
	}

	@Override
	public List<IPlayerCard> find(PlayerCardFilter filter) {
		return dao.find(filter);
	}

	@Override
	public long getCount(PlayerCardFilter filter) {
		return dao.getCount(filter);
	}

}
