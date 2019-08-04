package by.itacademy.aalexandrov.poker.service;

import java.util.List;

import javax.transaction.Transactional;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.INews;
import by.itacademy.aalexandrov.poker.dao.api.filter.NewsFilter;

public interface INewsService {

	@Transactional
	long getCount(NewsFilter filter);

	List<INews> find(NewsFilter filter);

	List<INews> getAll();

	@Transactional
	void deleteAll();

	@Transactional
	void delete(Integer id);

	INews get(Integer id);

	@Transactional
	void save(INews... entities);

	@Transactional
	void save(INews entity);

	@Transactional
	INews createEntity();

}
