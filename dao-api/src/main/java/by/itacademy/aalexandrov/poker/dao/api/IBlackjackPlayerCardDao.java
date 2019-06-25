package by.itacademy.aalexandrov.poker.dao.api;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IBlackjackPlayerCard;
import by.itacademy.aalexandrov.poker.dao.api.filter.BlackjackPlayerCardFilter;

public interface IBlackjackPlayerCardDao extends IDao<IBlackjackPlayerCard, Integer> {
	
	List<IBlackjackPlayerCard> find(BlackjackPlayerCardFilter filter);

	long getCount(BlackjackPlayerCardFilter filter);

	void save(IBlackjackPlayerCard... entities);

}
