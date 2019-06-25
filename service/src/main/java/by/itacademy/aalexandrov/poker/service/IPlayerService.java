package by.itacademy.aalexandrov.poker.service;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.dao.api.filter.PlayerFilter;

public interface IPlayerService {

	long getCount(PlayerFilter filter);

	List<IPlayer> find(PlayerFilter filter);

	void save(IPlayer... entities);

	List<IPlayer> getAll();

	void deleteAll();

	void delete(final Integer id);

	IPlayer get(final Integer id);

	void save(final IPlayer entity);

	IPlayer createEntity();

}
