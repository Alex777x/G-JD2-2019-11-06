package by.itacademy.aalexandrov.poker.dao.api;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPokerBoard;
import by.itacademy.aalexandrov.poker.dao.api.filter.PokerBoardFilter;

public interface IPokerBoardDao extends IDao<IPokerBoard, Integer> {
	
	List<IPokerBoard> find(PokerBoardFilter filter);

	long getCount(PokerBoardFilter filter);

	void save(IPokerBoard... entities);

}
