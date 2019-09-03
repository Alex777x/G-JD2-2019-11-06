package by.itacademy.aalexandrov.poker.dao.api;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayerAction;
import by.itacademy.aalexandrov.poker.dao.api.filter.PlayerActionFilter;

public interface IPlayerActionDao extends IDao<IPlayerAction, Integer> {

	List<IPlayerAction> find(PlayerActionFilter filter);

	long getCount(PlayerActionFilter filter);

	void save(IPlayerAction... entities);

	IPlayerAction getFullInfo(Integer id);

	List<IPlayerAction> getFullInfo();

	IPlayerAction getActionByPlayer(Integer id);

}
