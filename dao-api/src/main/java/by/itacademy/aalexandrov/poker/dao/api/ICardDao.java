package by.itacademy.aalexandrov.poker.dao.api;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICard;
import by.itacademy.aalexandrov.poker.dao.api.filter.CardFilter;

public interface ICardDao extends IDao<ICard, Integer> {
	
	List<ICard> find(CardFilter filter);

	long getCount(CardFilter filter);

	void save(ICard... entities);

}
