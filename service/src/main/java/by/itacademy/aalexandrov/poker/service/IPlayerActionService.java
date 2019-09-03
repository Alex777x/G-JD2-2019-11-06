package by.itacademy.aalexandrov.poker.service;

import java.util.List;

import javax.transaction.Transactional;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayerAction;
import by.itacademy.aalexandrov.poker.dao.api.filter.PlayerActionFilter;

public interface IPlayerActionService {

	@Transactional
	long getCount(PlayerActionFilter filter);

	List<IPlayerAction> find(PlayerActionFilter filter);

	@Transactional
	void save(final IPlayerAction entity);

	@Transactional
	void save(IPlayerAction... entities);

	List<IPlayerAction> getAll();

	@Transactional
	void deleteAll();

	@Transactional
	void delete(final Integer id);

	IPlayerAction get(final Integer id);

	@Transactional
	IPlayerAction createEntity();

	@Transactional
	IPlayerAction getFullInfo(Integer id);

	@Transactional
	List<IPlayerAction> getFullInfo();

	@Transactional
	IPlayerAction getActionByPlayer(Integer id);

}
