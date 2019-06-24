package by.itacademy.aalexandrov.poker.service.impl;

import java.util.Date;
import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.IPokerActionDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPokerAction;
import by.itacademy.aalexandrov.poker.dao.api.filter.PokerActionFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.PokerActionDaoImpl;
import by.itacademy.aalexandrov.poker.service.IPokerActionService;

public class PokerActionServiceImpl implements IPokerActionService {
	
	private IPokerActionDao dao = new PokerActionDaoImpl();
	
	@Override
	public IPokerAction createEntity() {
		return dao.createEntity();
	}

	@Override
	public void save(final IPokerAction entity) {
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
	public IPokerAction get(final Integer id) {
		final IPokerAction entity = dao.get(id);
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
	public List<IPokerAction> getAll() {
		final List<IPokerAction> all = dao.selectAll();
		return all;
	}
	
	@Override
    public void save(IPokerAction... entities) {
        Date modified = new Date();
        for (IPokerAction iPokerAction : entities) {

        	iPokerAction.setUpdated(modified);
        	iPokerAction.setCreated(modified);

        }

        dao.save(entities);
    }

	@Override
	public List<IPokerAction> find(PokerActionFilter filter) {
		return dao.find(filter);
	}

	@Override
	public long getCount(PokerActionFilter filter) {
		return dao.getCount(filter);
	}

}
