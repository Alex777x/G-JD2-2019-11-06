package by.itacademy.aalexandrov.poker.service;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IStatistic;
import by.itacademy.aalexandrov.poker.dao.api.filter.StatisticFilter;

public interface IStatisticService {

	long getCount(StatisticFilter filter);

	List<IStatistic> find(StatisticFilter filter);

	void save(final IStatistic entity);

	List<IStatistic> getAll();

	void deleteAll();

	void delete(final Integer id);

	IStatistic get(final Integer id);

	void save(IStatistic... entities);

	IStatistic createEntity();

}
