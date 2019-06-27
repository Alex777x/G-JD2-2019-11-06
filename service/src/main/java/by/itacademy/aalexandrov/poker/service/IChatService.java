package by.itacademy.aalexandrov.poker.service;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IChat;
import by.itacademy.aalexandrov.poker.dao.api.filter.ChatFilter;

public interface IChatService {

	long getCount(ChatFilter filter);

	List<IChat> find(ChatFilter filter);
	
	void save(final IChat entity);

	void save(IChat... entities);

	List<IChat> getAll();

	void deleteAll();

	void delete(final Integer id);

	IChat get(final Integer id);

	IChat createEntity();

}
