package by.itacademy.aalexandrov.poker.service;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IBlackjackAction;
import by.itacademy.aalexandrov.poker.dao.api.filter.BlackjackActionFilter;

public interface IBlackjackActionService {

	long getCount(BlackjackActionFilter filter);

	List<IBlackjackAction> find(BlackjackActionFilter filter);

	void save(IBlackjackAction... entities);

	void save(final IBlackjackAction entity);

	List<IBlackjackAction> getAll();

	void deleteAll();

	void delete(final Integer id);

	IBlackjackAction get(final Integer id);

	IBlackjackAction createEntity();

}
