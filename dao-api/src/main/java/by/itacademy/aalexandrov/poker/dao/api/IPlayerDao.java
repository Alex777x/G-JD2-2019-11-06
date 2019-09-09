package by.itacademy.aalexandrov.poker.dao.api;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.dao.api.filter.PlayerFilter;

public interface IPlayerDao extends IDao<IPlayer, Integer> {

	List<IPlayer> find(PlayerFilter filter);

	long getCount(PlayerFilter filter);

	void save(IPlayer entity);

	void save(IPlayer... entities);

	IPlayer getFullInfo(Integer id);

	List<IPlayer> getFullInfo();

	long getPlayersCount(Integer id);

	IPlayer getPlayerByUser(Integer loggedUserId);

	boolean findPlayer(Integer loggedUserId);

	List<IPlayer> getPlayersByGame(Integer id);

	IPlayer getPlayerByUserAccunt(Integer loggedUserId);

	List<IPlayer> getPlayerSmallBlind(Integer gameid, PlayerStatus smallblind);

	List<IPlayer> getPlayersByGameWithStateUsual(Integer gameid, PlayerStatus usual);

}
