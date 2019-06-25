package by.itacademy.aalexandrov.poker.dao.api;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IBlackjackAction;
import by.itacademy.aalexandrov.poker.dao.api.filter.BlackjackActionFilter;

public interface IBlackjackActionDao extends IDao<IBlackjackAction, Integer> {
	
	List<IBlackjackAction> find(BlackjackActionFilter filter);

	long getCount(BlackjackActionFilter filter);

	void save(IBlackjackAction... entities);

}
