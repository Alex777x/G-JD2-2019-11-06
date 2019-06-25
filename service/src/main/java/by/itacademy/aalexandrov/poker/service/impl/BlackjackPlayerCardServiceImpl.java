package by.itacademy.aalexandrov.poker.service.impl;

import java.util.Date;
import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.IBlackjackPlayerCardDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IBlackjackPlayerCard;
import by.itacademy.aalexandrov.poker.dao.api.filter.BlackjackPlayerCardFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.BlackjackPlayerCardDaoImpl;
import by.itacademy.aalexandrov.poker.service.IBlackjackPlayerCardService;

public class BlackjackPlayerCardServiceImpl implements IBlackjackPlayerCardService {
	
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
			entity.setCreated(modifedOn);
			dao.insert(entity);
		} else {
			dao.update(entity);
		}
	}

	@Override
	public IBlackjackPlayerCard get(final Integer id) {
		final IBlackjackPlayerCard entity = dao.get(id);
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
	public List<IBlackjackPlayerCard> getAll() {
		final List<IBlackjackPlayerCard> all = dao.selectAll();
		return all;
	}
	
	@Override
    public void save(IBlackjackPlayerCard... entities) {
        Date modified = new Date();
        for (IBlackjackPlayerCard iPokerAction : entities) {

        	iPokerAction.setUpdated(modified);
        	iPokerAction.setCreated(modified);

        }

        dao.save(entities);
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
