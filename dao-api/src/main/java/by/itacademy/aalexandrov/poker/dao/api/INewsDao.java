package by.itacademy.aalexandrov.poker.dao.api;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.INews;
import by.itacademy.aalexandrov.poker.dao.api.filter.NewsFilter;

public interface INewsDao extends IDao<INews, Integer> {

	List<INews> find(NewsFilter filter);

	long getCount(NewsFilter filter);

	void save(INews... entities);

}
