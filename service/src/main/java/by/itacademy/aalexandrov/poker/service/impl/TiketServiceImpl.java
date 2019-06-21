package by.itacademy.aalexandrov.poker.service.impl;

import java.util.Date;
import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.ITiketDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITiket;
import by.itacademy.aalexandrov.poker.dao.api.filter.TiketFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.TiketDaoImpl;
import by.itacademy.aalexandrov.poker.service.ITiketService;

public class TiketServiceImpl implements ITiketService {

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
			entity.setCreated(modifedOn);
			dao.insert(entity);
		} else {
			dao.update(entity);
		}
	}

	@Override
	public ITiket get(final Integer id) {
		final ITiket entity = dao.get(id);
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
	public List<ITiket> getAll() {
		final List<ITiket> all = dao.selectAll();
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
