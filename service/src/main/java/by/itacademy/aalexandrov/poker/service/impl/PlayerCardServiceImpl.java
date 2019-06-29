package by.itacademy.aalexandrov.poker.service.impl;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import by.itacademy.aalexandrov.poker.dao.api.ICardInGameDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICardInGame;
import by.itacademy.aalexandrov.poker.dao.api.filter.CardInGameFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.CardInGameDaoImpl;
import by.itacademy.aalexandrov.poker.service.ICardInGameService;

public class PlayerCardServiceImpl implements ICardInGameService {

	private static final Logger LOGGER = LoggerFactory.getLogger(PlayerCardServiceImpl.class);

	private ICardInGameDao dao = new CardInGameDaoImpl();

	@Override
	public ICardInGame createEntity() {
		return dao.createEntity();
	}

	@Override
	public void save(final ICardInGame entity) {
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
	public void save(ICardInGame... entities) {
		Date modified = new Date();
		for (ICardInGame iPlayerCard : entities) {

			iPlayerCard.setUpdated(modified);
			iPlayerCard.setCreated(modified);

		}

		dao.save(entities);
	}

	@Override
	public ICardInGame get(final Integer id) {
		final ICardInGame entity = dao.get(id);
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
	public List<ICardInGame> getAll() {
		final List<ICardInGame> all = dao.selectAll();
		LOGGER.debug("total count in DB: {}", all.size());
		return all;
	}

	@Override
	public List<ICardInGame> find(CardInGameFilter filter) {
		return dao.find(filter);
	}

	@Override
	public long getCount(CardInGameFilter filter) {
		return dao.getCount(filter);
	}

}
