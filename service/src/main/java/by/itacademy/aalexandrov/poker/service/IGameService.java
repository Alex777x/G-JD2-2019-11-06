package by.itacademy.aalexandrov.poker.service;

import java.util.List;

import javax.transaction.Transactional;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.filter.GameFilter;

public interface IGameService {

	@Transactional
	long getCount(GameFilter filter);

	@Transactional
	List<IGame> find(GameFilter filter);

	@Transactional
	void save(final IGame entity);

	@Transactional
	void save(IGame... entities);

	@Transactional
	List<IGame> getAll();

	@Transactional
	void deleteAll();

	@Transactional
	void delete(final Integer id);

	@Transactional
	IGame get(final Integer id);

	@Transactional
	IGame createEntity();

	@Transactional
	IGame getFullInfo(Integer id);

}
