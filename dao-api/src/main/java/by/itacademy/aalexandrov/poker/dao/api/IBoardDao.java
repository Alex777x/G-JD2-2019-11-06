package by.itacademy.aalexandrov.poker.dao.api;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IBoard;
import by.itacademy.aalexandrov.poker.dao.api.filter.BoardFilter;

public interface IBoardDao extends IDao<IBoard, Integer> {
	
	List<IBoard> find(BoardFilter filter);

	long getCount(BoardFilter filter);

	void save(IBoard... entities);

}
