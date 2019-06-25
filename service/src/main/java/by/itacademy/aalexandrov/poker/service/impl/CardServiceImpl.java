package by.itacademy.aalexandrov.poker.service.impl;

import java.util.Date;
import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.ICardDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICard;
import by.itacademy.aalexandrov.poker.dao.api.filter.CardFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.CardDaoImpl;
import by.itacademy.aalexandrov.poker.service.ICardService;

public class CardServiceImpl implements ICardService {
	
	private ICardDao dao = new CardDaoImpl();
	
	@Override
	public ICard createEntity() {
		return dao.createEntity();
	}

	@Override
	public void save(final ICard entity) {
		final Date modifedOn = new Date();
		entity.setUpdated(modifedOn);
		if (entity.getId() == null) {
			entity.setCreated(modifedOn);
			dao.insert(entity);
		} else {
			dao.update(entity);
		}
	}

	@Override
	public ICard get(final Integer id) {
		final ICard entity = dao.get(id);
		return entity;
	}

	@Override
	public void delete(final Integer id) {
		dao.delete(id);
	}

	@Override
	public void deleteAll() {
		dao.deleteAll();
	}

	@Override
	public List<ICard> getAll() {
		final List<ICard> all = dao.selectAll();
		return all;
	}
	
	@Override
    public void save(ICard... entities) {
        Date modified = new Date();
        for (ICard iPokerAction : entities) {

        	iPokerAction.setUpdated(modified);
        	iPokerAction.setCreated(modified);

        }

        dao.save(entities);
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
