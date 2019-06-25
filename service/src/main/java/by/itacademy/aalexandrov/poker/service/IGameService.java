package by.itacademy.aalexandrov.poker.service;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.filter.GameFilter;

public interface IGameService {

	long getCount(GameFilter filter);

	List<IGame> find(GameFilter filter);

	void save(IGame... entities);

	List<IGame> getAll();

	void deleteAll();

	void delete(final Integer id);

	IGame get(final Integer id);

	void save(final IGame entity);

	IGame createEntity();

}
