package by.itacademy.aalexandrov.poker.service;

import java.util.List;

import javax.transaction.Transactional;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.dao.api.filter.PlayerFilter;

public interface IPlayerService {

	@Transactional
	long getCount(PlayerFilter filter);

	List<IPlayer> find(PlayerFilter filter);

	@Transactional
	void save(final IPlayer entity);

	@Transactional
	void save(IPlayer... entities);

	List<IPlayer> getAll();

	@Transactional
	void deleteAll();

	@Transactional
	void delete(final Integer id);

	IPlayer get(final Integer id);

	@Transactional
	IPlayer createEntity();

}
