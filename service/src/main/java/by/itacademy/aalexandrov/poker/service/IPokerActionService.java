package by.itacademy.aalexandrov.poker.service;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPokerAction;
import by.itacademy.aalexandrov.poker.dao.api.filter.PokerActionFilter;

public interface IPokerActionService {

	long getCount(PokerActionFilter filter);

	List<IPokerAction> find(PokerActionFilter filter);

	void save(IPokerAction... entities);

	List<IPokerAction> getAll();

	void deleteAll();

	void delete(final Integer id);

	IPokerAction get(final Integer id);

	void save(final IPokerAction entity);

	IPokerAction createEntity();

}
