package by.itacademy.aalexandrov.poker.service.impl;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import by.itacademy.aalexandrov.poker.dao.api.IBlackjackPlayerCardDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IBlackjackPlayerCard;
import by.itacademy.aalexandrov.poker.dao.api.filter.BlackjackPlayerCardFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.BlackjackPlayerCardDaoImpl;
import by.itacademy.aalexandrov.poker.service.IBlackjackPlayerCardService;

public class BlackjackPlayerCardServiceImpl implements IBlackjackPlayerCardService {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(BlackjackPlayerCardServiceImpl.class);
	
	private IBlackjackPlayerCardDao dao = new BlackjackPlayerCardDaoImpl();
	
	@Override
	public IBlackjackPlayerCard createEntity() {
		return dao.createEntity();
	}

	@Override
	public void save(final IBlackjackPlayerCard entity) {
		final Date modifedOn = new Date();
		entity.setUpdated(modifedOn);
		if (entity.getId() == null) {
			LOGGER.info("new BlackjackPlayerCard created: {}", entity);
			entity.setCreated(modifedOn);
			dao.insert(entity);
		} else {
			LOGGER.info("new BlackjackPlayerCard updated: {}", entity);
			dao.update(entity);
		}
	}
	
	@Override
    public void save(IBlackjackPlayerCard... entities) {
        Date modified = new Date();
        for (IBlackjackPlayerCard iBlackjackPlayerCard : entities) {

        	iBlackjackPlayerCard.setUpdated(modified);
        	iBlackjackPlayerCard.setCreated(modified);

        }

        dao.save(entities);
    }

	@Override
	public IBlackjackPlayerCard get(final Integer id) {
		final IBlackjackPlayerCard entity = dao.get(id);
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
		LOGGER.info("delete all BlackjackPlayerCards");
		dao.deleteAll();
	}

	@Override
	public List<IBlackjackPlayerCard> getAll() {
		final List<IBlackjackPlayerCard> all = dao.selectAll();
		LOGGER.debug("total count in DB: {}", all.size());
		return all;
	}
	

	@Override
	public List<IBlackjackPlayerCard> find(BlackjackPlayerCardFilter filter) {
		return dao.find(filter);
	}

	@Override
	public long getCount(BlackjackPlayerCardFilter filter) {
		return dao.getCount(filter);
	}

}
