package by.itacademy.aalexandrov.poker.service.impl;

import java.util.Date;
import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.IBlackjackActionDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IBlackjackAction;
import by.itacademy.aalexandrov.poker.dao.api.filter.BlackjackActionFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.BlackjackActionDaoImpl;
import by.itacademy.aalexandrov.poker.service.IBlackjackActionService;

public class BlackjackActionServiceImpl implements IBlackjackActionService {

	private IBlackjackActionDao dao = new BlackjackActionDaoImpl();

	@Override
	public IBlackjackAction createEntity() {
		return dao.createEntity();
	}

	@Override
	public void save(final IBlackjackAction entity) {
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
	public IBlackjackAction get(final Integer id) {
		final IBlackjackAction entity = dao.get(id);
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
	public List<IBlackjackAction> getAll() {
		final List<IBlackjackAction> all = dao.selectAll();
		return all;
	}

	@Override
	public void save(IBlackjackAction... entities) {
		Date modified = new Date();
		for (IBlackjackAction iPokerAction : entities) {

			iPokerAction.setUpdated(modified);
			iPokerAction.setCreated(modified);

		}

		dao.save(entities);
	}

	@Override
	public List<IBlackjackAction> find(BlackjackActionFilter filter) {
		return dao.find(filter);
	}

	@Override
	public long getCount(BlackjackActionFilter filter) {
		return dao.getCount(filter);
	}

}
