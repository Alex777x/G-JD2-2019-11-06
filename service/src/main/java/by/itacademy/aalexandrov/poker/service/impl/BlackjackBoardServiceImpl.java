package by.itacademy.aalexandrov.poker.service.impl;

import java.util.Date;
import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.IBlackjackBoardDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IBlackjacBoard;
import by.itacademy.aalexandrov.poker.dao.api.filter.BlackjacBoardFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.BlackjackBoardDaoImpl;
import by.itacademy.aalexandrov.poker.service.IBlackjackBoardService;

public class BlackjackBoardServiceImpl implements IBlackjackBoardService {
	
	private IBlackjackBoardDao dao = new BlackjackBoardDaoImpl();
	
	
	@Override
	public IBlackjacBoard createEntity() {
		return dao.createEntity();
	}

	@Override
	public void save(final IBlackjacBoard entity) {
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
	public IBlackjacBoard get(final Integer id) {
		final IBlackjacBoard entity = dao.get(id);
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
	public List<IBlackjacBoard> getAll() {
		final List<IBlackjacBoard> all = dao.selectAll();
		return all;
	}
	
	@Override
    public void save(IBlackjacBoard... entities) {
        Date modified = new Date();
        for (IBlackjacBoard iPokerAction : entities) {

        	iPokerAction.setUpdated(modified);
        	iPokerAction.setCreated(modified);

        }

        dao.save(entities);
    }

	@Override
	public List<IBlackjacBoard> find(BlackjacBoardFilter filter) {
		return dao.find(filter);
	}

	@Override
	public long getCount(BlackjacBoardFilter filter) {
		return dao.getCount(filter);
	}

}
