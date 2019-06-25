package by.itacademy.aalexandrov.poker.dao.api;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IBlackjacBoard;
import by.itacademy.aalexandrov.poker.dao.api.filter.BlackjacBoardFilter;

public interface IBlackjackBoardDao extends IDao<IBlackjacBoard, Integer> {
	
	List<IBlackjacBoard> find(BlackjacBoardFilter filter);

	long getCount(BlackjacBoardFilter filter);

	void save(IBlackjacBoard... entities);

}
