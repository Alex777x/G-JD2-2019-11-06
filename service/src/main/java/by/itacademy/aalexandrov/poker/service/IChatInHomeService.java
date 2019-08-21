package by.itacademy.aalexandrov.poker.service;

import java.util.List;

import javax.transaction.Transactional;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IChatInHome;
import by.itacademy.aalexandrov.poker.dao.api.filter.ChatInHomeFilter;

public interface IChatInHomeService {

	@Transactional
	List<IChatInHome> getFullInfo();

	@Transactional
	IChatInHome getFullInfo(Integer id);

	@Transactional
	long getCount(ChatInHomeFilter filter);

	@Transactional
	List<IChatInHome> find(ChatInHomeFilter filter);

	@Transactional
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

	@Transactional
	IChatInHome getNewestMessage();

	@Transactional
	List<IChatInHome> getLastMessages(Integer id);

}
