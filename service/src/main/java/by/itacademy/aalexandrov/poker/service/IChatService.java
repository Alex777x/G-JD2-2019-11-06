package by.itacademy.aalexandrov.poker.service;

import java.util.List;

import javax.transaction.Transactional;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IChat;
import by.itacademy.aalexandrov.poker.dao.api.filter.ChatFilter;

public interface IChatService {

	long getCount(ChatFilter filter);

	List<IChat> find(ChatFilter filter);

	@Transactional
	void save(final IChat entity);

	@Transactional
	void save(IChat... entities);

	List<IChat> getAll();

	@Transactional
	void deleteAll();

	@Transactional
	void delete(final Integer id);

	IChat get(final Integer id);

	@Transactional
	IChat createEntity();

	IChat getFullInfo(Integer id);

}
