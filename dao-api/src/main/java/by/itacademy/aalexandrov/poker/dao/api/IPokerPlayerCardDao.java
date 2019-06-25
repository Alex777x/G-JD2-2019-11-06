package by.itacademy.aalexandrov.poker.dao.api;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPokerPlayerCard;
import by.itacademy.aalexandrov.poker.dao.api.filter.PokerPlayerCardFilter;

public interface IPokerPlayerCardDao extends IDao<IPokerPlayerCard, Integer> {

	List<IPokerPlayerCard> find(PokerPlayerCardFilter filter);

	long getCount(PokerPlayerCardFilter filter);

	void save(IPokerPlayerCard... entities);

}
