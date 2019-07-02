package by.itacademy.aalexandrov.poker.service.impl;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import by.itacademy.aalexandrov.poker.dao.api.ICardDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICard;
import by.itacademy.aalexandrov.poker.dao.api.filter.CardFilter;
import by.itacademy.aalexandrov.poker.service.ICardService;

@Service
public class CardServiceImpl implements ICardService {

	private static final Logger LOGGER = LoggerFactory.getLogger(CardServiceImpl.class);

	private ICardDao dao;

	@Autowired
	public CardServiceImpl(ICardDao dao) {
		super();
		this.dao = dao;
	}

	@Override
	public ICard createEntity() {
		return dao.createEntity();
	}

	@Override
	public void save(final ICard entity) {
		final Date modifedOn = new Date();
		entity.setUpdated(modifedOn);
		if (entity.getId() == null) {
			LOGGER.info("new Card created: {}", entity);
			entity.setCreated(modifedOn);
			dao.insert(entity);
		} else {
			LOGGER.info("new Card updated: {}", entity);
			dao.update(entity);
		}
	}

	@Override
	public void save(ICard... entities) {
		Date modified = new Date();
		for (ICard iCard : entities) {

			iCard.setUpdated(modified);
			iCard.setCreated(modified);

		}

		dao.save(entities);
	}

	@Override
	public ICard get(final Integer id) {
		final ICard entity = dao.get(id);
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
		LOGGER.info("delete all Cards");
		dao.deleteAll();
	}

	@Override
	public List<ICard> getAll() {
		final List<ICard> all = dao.selectAll();
		LOGGER.debug("total count in DB: {}", all.size());
		return all;
	}

	@Override
	public List<ICard> find(CardFilter filter) {
		return dao.find(filter);
	}

	@Override
	public long getCount(CardFilter filter) {
		return dao.getCount(filter);
	}

}
