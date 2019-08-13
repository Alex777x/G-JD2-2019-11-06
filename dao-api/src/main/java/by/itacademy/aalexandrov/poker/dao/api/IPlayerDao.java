package by.itacademy.aalexandrov.poker.dao.api;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.dao.api.filter.PlayerFilter;

public interface IPlayerDao extends IDao<IPlayer, Integer> {

	List<IPlayer> find(PlayerFilter filter);

	long getCount(PlayerFilter filter);

	void save(IPlayer... entities);

	IPlayer getFullInfo(Integer id);

	List<IPlayer> getFullInfo();

	List<IPlayer> findByGame();

	long getPlayersCount(Integer id);

}
