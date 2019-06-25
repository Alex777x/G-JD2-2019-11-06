package by.itacademy.aalexandrov.poker.service.impl;

import java.util.Date;
import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.IPokerPlayerCardDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPokerPlayerCard;
import by.itacademy.aalexandrov.poker.dao.api.filter.PokerPlayerCardFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.PokerPlayerCardDaoImpl;
import by.itacademy.aalexandrov.poker.service.IPokerPlayerCardService;

public class PokerPlayerCardServiceImpl implements IPokerPlayerCardService {
	
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
			entity.setCreated(modifedOn);
			dao.insert(entity);
		} else {
			dao.update(entity);
		}
	}

	@Override
	public IPokerPlayerCard get(final Integer id) {
		final IPokerPlayerCard entity = dao.get(id);
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
	public List<IPokerPlayerCard> getAll() {
		final List<IPokerPlayerCard> all = dao.selectAll();
		return all;
	}
	
	@Override
    public void save(IPokerPlayerCard... entities) {
        Date modified = new Date();
        for (IPokerPlayerCard iPokerAction : entities) {

        	iPokerAction.setUpdated(modified);
        	iPokerAction.setCreated(modified);

        }

        dao.save(entities);
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
