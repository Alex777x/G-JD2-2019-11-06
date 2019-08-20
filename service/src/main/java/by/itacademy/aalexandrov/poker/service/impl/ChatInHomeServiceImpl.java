package by.itacademy.aalexandrov.poker.service.impl;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import by.itacademy.aalexandrov.poker.dao.api.IChatInHomeDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IChatInHome;
import by.itacademy.aalexandrov.poker.dao.api.filter.ChatInHomeFilter;
import by.itacademy.aalexandrov.poker.service.IChatInHomeService;

@Service
public class ChatInHomeServiceImpl implements IChatInHomeService {

	private static final Logger LOGGER = LoggerFactory.getLogger(ChatInHomeServiceImpl.class);

	private IChatInHomeDao dao;

	@Autowired
	public ChatInHomeServiceImpl(IChatInHomeDao dao) {
		super();
		this.dao = dao;
	}

	@Override
	public IChatInHome createEntity() {
		return dao.createEntity();
	}

	@Override
	public void save(final IChatInHome entity) {
		final Date modifedOn = new Date();
		entity.setUpdated(modifedOn);
		if (entity.getId() == null) {
			LOGGER.info("new IChatInHome created: {}", entity);
			entity.setCreated(modifedOn);
			dao.insert(entity);
		} else {
			LOGGER.info("new IChatInHome updated: {}", entity);
			dao.update(entity);
		}
	}

	@Override
	public void save(IChatInHome... entities) {
		Date modified = new Date();
		for (IChatInHome IChatInHome : entities) {

			IChatInHome.setUpdated(modified);
			IChatInHome.setCreated(modified);

		}

		dao.save(entities);
	}

	@Override
	public IChatInHome get(final Integer id) {
		final IChatInHome entity = dao.get(id);
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
	public List<IChatInHome> getAll() {
		final List<IChatInHome> all = dao.selectAll();
		LOGGER.debug("total count in DB: {}", all.size());
		return all;
	}

	@Override
	public List<IChatInHome> find(ChatInHomeFilter filter) {
		return dao.find(filter);
	}

	@Override
	public long getCount(ChatInHomeFilter filter) {
		return dao.getCount(filter);
	}

	@Override
	public IChatInHome getFullInfo(Integer id) {
		return dao.getFullInfo(id);
	}

	@Override
	public List<IChatInHome> getFullInfo() {
		return dao.getFullInfo();
	}

	@Override
	public IChatInHome getNewestMessage() {
		return dao.getNewestMessage();
	}

}
