package by.itacademy.aalexandrov.poker.dao.api;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IStatistic;
import by.itacademy.aalexandrov.poker.dao.api.filter.StatisticFilter;

public interface IStatisticDao extends IDao<IStatistic, Integer> {

	List<IStatistic> find(StatisticFilter filter);

	long getCount(StatisticFilter filter);

	void save(IStatistic... entities);

}
