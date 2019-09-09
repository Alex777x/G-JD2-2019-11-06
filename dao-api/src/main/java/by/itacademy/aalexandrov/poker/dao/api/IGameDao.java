package by.itacademy.aalexandrov.poker.dao.api;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.filter.GameFilter;

public interface IGameDao extends IDao<IGame, Integer> {

	List<IGame> find(GameFilter filter);

	long getCount(GameFilter filter);

	void save(IGame... entities);

	IGame getFullInfo(Integer id);

	List<IGame> findByActivePlayer();

	List<IGame> getFullInfo();

}
