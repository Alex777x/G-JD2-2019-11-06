package by.itacademy.aalexandrov.poker.service;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayerAction;
import by.itacademy.aalexandrov.poker.dao.api.filter.PlayerActionFilter;

public interface IPlayerActionService {

	long getCount(PlayerActionFilter filter);

	List<IPlayerAction> find(PlayerActionFilter filter);

	void save(final IPlayerAction entity);

	void save(IPlayerAction... entities);

	List<IPlayerAction> getAll();

	void deleteAll();

	void delete(final Integer id);

	IPlayerAction get(final Integer id);

	IPlayerAction createEntity();

}
