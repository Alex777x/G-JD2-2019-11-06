package by.itacademy.aalexandrov.poker.service.impl;

import java.util.Date;
import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.IPokerBoardDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPokerBoard;
import by.itacademy.aalexandrov.poker.dao.api.filter.PokerBoardFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.PokerBoardDaoImpl;
import by.itacademy.aalexandrov.poker.service.IPokerBoardService;

public class PokerBoardServiceImpl implements IPokerBoardService {
	
	private IPokerBoardDao dao = new PokerBoardDaoImpl();
	
	@Override
	public IPokerBoard createEntity() {
		return dao.createEntity();
	}

	@Override
	public void save(final IPokerBoard entity) {
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
	public IPokerBoard get(final Integer id) {
		final IPokerBoard entity = dao.get(id);
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
	public List<IPokerBoard> getAll() {
		final List<IPokerBoard> all = dao.selectAll();
		return all;
	}
	
	@Override
    public void save(IPokerBoard... entities) {
        Date modified = new Date();
        for (IPokerBoard iPokerAction : entities) {

        	iPokerAction.setUpdated(modified);
        	iPokerAction.setCreated(modified);

        }

        dao.save(entities);
    }

	@Override
	public List<IPokerBoard> find(PokerBoardFilter filter) {
		return dao.find(filter);
	}

	@Override
	public long getCount(PokerBoardFilter filter) {
		return dao.getCount(filter);
	}

}
