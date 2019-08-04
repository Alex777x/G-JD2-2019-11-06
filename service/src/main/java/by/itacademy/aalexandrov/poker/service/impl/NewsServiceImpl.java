package by.itacademy.aalexandrov.poker.service.impl;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import by.itacademy.aalexandrov.poker.dao.api.INewsDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.INews;
import by.itacademy.aalexandrov.poker.dao.api.filter.NewsFilter;
import by.itacademy.aalexandrov.poker.service.INewsService;

@Service
public class NewsServiceImpl implements INewsService {

	private static final Logger LOGGER = LoggerFactory.getLogger(NewsServiceImpl.class);

	private INewsDao dao;

	@Autowired
	public NewsServiceImpl(INewsDao dao) {
		super();
		this.dao = dao;
	}

	@Override
	public INews createEntity() {
		return dao.createEntity();
	}

	@Override
	public void save(final INews entity) {
		final Date modifedOn = new Date();
		entity.setUpdated(modifedOn);
		if (entity.getId() == null) {
			LOGGER.info("new News created: {}", entity);
			entity.setCreated(modifedOn);
			dao.insert(entity);
		} else {
			LOGGER.info("new News updated: {}", entity);
			dao.update(entity);
		}
	}

	@Override
	public void save(INews... entities) {
		Date modified = new Date();
		for (INews iNews : entities) {

			iNews.setUpdated(modified);
			iNews.setCreated(modified);

		}

		dao.save(entities);
	}

	@Override
	public INews get(final Integer id) {
		final INews entity = dao.get(id);
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
	public List<INews> getAll() {
		final List<INews> all = dao.selectAll();
		LOGGER.debug("total count in DB: {}", all.size());
		return all;
	}

	@Override
	public List<INews> find(NewsFilter filter) {
		return dao.find(filter);
	}

	@Override
	public long getCount(NewsFilter filter) {
		return dao.getCount(filter);
	}

}
