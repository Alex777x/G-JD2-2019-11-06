package by.itacademy.aalexandrov.poker.service;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IBlackjacBoard;
import by.itacademy.aalexandrov.poker.dao.api.filter.BlackjacBoardFilter;

public interface IBlackjackBoardService {

	long getCount(BlackjacBoardFilter filter);

	List<IBlackjacBoard> find(BlackjacBoardFilter filter);

	void save(IBlackjacBoard... entities);

	List<IBlackjacBoard> getAll();

	void deleteAll();

	void delete(final Integer id);

	IBlackjacBoard get(final Integer id);

	void save(final IBlackjacBoard entity);

	IBlackjacBoard createEntity();

}
