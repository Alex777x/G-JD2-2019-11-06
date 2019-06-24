package by.itacademy.aalexandrov.poker.service.impl;

import java.util.Date;
import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.IStatisticDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IStatistic;
import by.itacademy.aalexandrov.poker.dao.api.filter.StatisticFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.StatisticDaoImpl;
import by.itacademy.aalexandrov.poker.service.IStatisticService;

public class StatisticServiceImpl implements IStatisticService {

	private IStatisticDao dao = new StatisticDaoImpl();

	@Override
	public IStatistic createEntity() {
		return dao.createEntity();
	}

	@Override
	public void save(final IStatistic entity) {
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
	public IStatistic get(final Integer id) {
		final IStatistic entity = dao.get(id);
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
	public List<IStatistic> getAll() {
		final List<IStatistic> all = dao.selectAll();
		return all;
	}

	@Override
	public void save(IStatistic... entities) {
		Date modified = new Date();
		for (IStatistic iStatistic : entities) {

			iStatistic.setUpdated(modified);
			iStatistic.setCreated(modified);

		}

		dao.save(entities);
	}

	@Override
	public List<IStatistic> find(StatisticFilter filter) {
		return dao.find(filter);
	}

	@Override
	public long getCount(StatisticFilter filter) {
		return dao.getCount(filter);
	}
}
