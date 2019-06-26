package by.itacademy.aalexandrov.poker.service.impl;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import by.itacademy.aalexandrov.poker.dao.api.ITiketDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITiket;
import by.itacademy.aalexandrov.poker.dao.api.filter.TiketFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.TiketDaoImpl;
import by.itacademy.aalexandrov.poker.service.ITiketService;

public class TiketServiceImpl implements ITiketService {

	private static final Logger LOGGER = LoggerFactory.getLogger(TiketServiceImpl.class);

	private ITiketDao dao = new TiketDaoImpl();

	@Override
	public ITiket createEntity() {
		return dao.createEntity();
	}

	@Override
	public void save(final ITiket entity) {
		final Date modifedOn = new Date();
		entity.setUpdated(modifedOn);
		if (entity.getId() == null) {
			LOGGER.info("new Tiket created: {}", entity);
			entity.setCreated(modifedOn);
			dao.insert(entity);
		} else {
			LOGGER.info("new Tiket updated: {}", entity);
			dao.update(entity);
		}
	}

	@Override
	public void save(ITiket... entities) {
		Date modified = new Date();
		for (ITiket iTiket : entities) {

			iTiket.setUpdated(modified);
			iTiket.setCreated(modified);

		}

		dao.save(entities);
	}

	@Override
	public ITiket get(final Integer id) {
		final ITiket entity = dao.get(id);
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
		LOGGER.info("delete all Tikets");
		dao.deleteAll();
	}

	@Override
	public List<ITiket> getAll() {
		final List<ITiket> all = dao.selectAll();
		LOGGER.debug("total count in DB: {}", all.size());
		return all;
	}

	@Override
	public List<ITiket> find(TiketFilter filter) {
		return dao.find(filter);
	}

	@Override
	public long getCount(TiketFilter filter) {
		return dao.getCount(filter);
	}
}
