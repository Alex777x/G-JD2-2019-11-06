package by.itacademy.aalexandrov.poker.service;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPokerBoard;
import by.itacademy.aalexandrov.poker.dao.api.filter.PokerBoardFilter;

public interface IPokerBoardService {

	long getCount(PokerBoardFilter filter);

	List<IPokerBoard> find(PokerBoardFilter filter);

	void save(IPokerBoard... entities);

	List<IPokerBoard> getAll();

	void deleteAll();

	void delete(final Integer id);

	IPokerBoard get(final Integer id);

	void save(final IPokerBoard entity);

	IPokerBoard createEntity();

}
