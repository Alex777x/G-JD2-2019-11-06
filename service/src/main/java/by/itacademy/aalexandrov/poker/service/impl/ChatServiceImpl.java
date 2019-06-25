package by.itacademy.aalexandrov.poker.service.impl;

import java.util.Date;
import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.IChatDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IChat;
import by.itacademy.aalexandrov.poker.dao.api.filter.ChatFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.ChatDaoImpl;
import by.itacademy.aalexandrov.poker.service.IChatService;

public class ChatServiceImpl implements IChatService {
	
	private IChatDao dao = new ChatDaoImpl();
	
	@Override
	public IChat createEntity() {
		return dao.createEntity();
	}

	@Override
	public void save(final IChat entity) {
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
	public IChat get(final Integer id) {
		final IChat entity = dao.get(id);
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
	public List<IChat> getAll() {
		final List<IChat> all = dao.selectAll();
		return all;
	}
	
	@Override
    public void save(IChat... entities) {
        Date modified = new Date();
        for (IChat iPokerAction : entities) {

        	iPokerAction.setUpdated(modified);
        	iPokerAction.setCreated(modified);

        }

        dao.save(entities);
    }

	@Override
	public List<IChat> find(ChatFilter filter) {
		return dao.find(filter);
	}

	@Override
	public long getCount(ChatFilter filter) {
		return dao.getCount(filter);
	}

}
