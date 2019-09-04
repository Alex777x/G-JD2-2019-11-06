package by.itacademy.aalexandrov.poker.service;

import java.util.List;

import javax.transaction.Transactional;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IChatInHome;
import by.itacademy.aalexandrov.poker.dao.api.filter.ChatInHomeFilter;

public interface IChatInHomeService {

	List<IChatInHome> getFullInfo();

	IChatInHome getFullInfo(Integer id);

	long getCount(ChatInHomeFilter filter);

	List<IChatInHome> find(ChatInHomeFilter filter);

	List<IChatInHome> getAll();

	@Transactional
	void deleteAll();

	@Transactional
	void delete(final Integer id);

	IChatInHome get(final Integer id);

	@Transactional
	void save(IChatInHome... entities);

	@Transactional
	void save(final IChatInHome entity);

	@Transactional
	IChatInHome createEntity();

	IChatInHome getNewestMessage();

	List<IChatInHome> getLastMessages(Integer id);

}
