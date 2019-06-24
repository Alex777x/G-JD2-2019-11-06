package by.itacademy.aalexandrov.poker.dao.api;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPokerAction;
import by.itacademy.aalexandrov.poker.dao.api.filter.PokerActionFilter;

public interface IPokerActionDao extends IDao<IPokerAction, Integer> {

	List<IPokerAction> find(PokerActionFilter filter);

	long getCount(PokerActionFilter filter);

	void save(IPokerAction... entities);
	
}
