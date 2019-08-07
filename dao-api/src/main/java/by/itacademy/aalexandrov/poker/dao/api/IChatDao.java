package by.itacademy.aalexandrov.poker.dao.api;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IChat;
import by.itacademy.aalexandrov.poker.dao.api.filter.ChatFilter;

public interface IChatDao extends IDao<IChat, Integer> {

	List<IChat> find(ChatFilter filter);

	long getCount(ChatFilter filter);

	void save(IChat... entities);

	IChat getFullInfo(Integer id);

}
