package by.itacademy.aalexandrov.poker.service;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IBoard;
import by.itacademy.aalexandrov.poker.dao.api.filter.BoardFilter;

public interface IBoardService {

	long getCount(BoardFilter filter);

	List<IBoard> find(BoardFilter filter);

	void save(final IBoard entity);

	void save(IBoard... entities);

	List<IBoard> getAll();

	void deleteAll();

	void delete(final Integer id);

	IBoard get(final Integer id);

	IBoard createEntity();

}
