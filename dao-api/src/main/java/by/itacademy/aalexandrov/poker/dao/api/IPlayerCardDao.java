package by.itacademy.aalexandrov.poker.dao.api;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayerCard;
import by.itacademy.aalexandrov.poker.dao.api.filter.PlayerCardFilter;

public interface IPlayerCardDao extends IDao<IPlayerCard, Integer> {

	List<IPlayerCard> find(PlayerCardFilter filter);

	long getCount(PlayerCardFilter filter);

	void save(IPlayerCard... entities);

}
