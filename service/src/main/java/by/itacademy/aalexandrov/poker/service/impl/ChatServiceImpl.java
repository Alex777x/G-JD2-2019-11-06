package by.itacademy.aalexandrov.poker.service.impl;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import by.itacademy.aalexandrov.poker.dao.api.IChatDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IChat;
import by.itacademy.aalexandrov.poker.dao.api.filter.ChatFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.ChatDaoImpl;
import by.itacademy.aalexandrov.poker.service.IChatService;

public class ChatServiceImpl implements IChatService {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(ChatServiceImpl.class);
	
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
			LOGGER.info("new Chat created: {}", entity);
			entity.setCreated(modifedOn);
			dao.insert(entity);
		} else {
			LOGGER.info("new Chat updated: {}", entity);
			dao.update(entity);
		}
	}
	
	@Override
    public void save(IChat... entities) {
        Date modified = new Date();
        for (IChat iChat : entities) {

        	iChat.setUpdated(modified);
        	iChat.setCreated(modified);

        }

        dao.save(entities);
    }

	@Override
	public IChat get(final Integer id) {
		final IChat entity = dao.get(id);
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
		LOGGER.info("delete all Chats");
		dao.deleteAll();
	}

	@Override
	public List<IChat> getAll() {
		final List<IChat> all = dao.selectAll();
		LOGGER.debug("total count in DB: {}", all.size());
		return all;
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
