package by.itacademy.aalexandrov.poker.service;

import java.util.List;

import javax.transaction.Transactional;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITiket;
import by.itacademy.aalexandrov.poker.dao.api.filter.TiketFilter;

public interface ITiketService {

	ITiket get(Integer id);

	List<ITiket> getAll();

	@Transactional
	void save(ITiket entity);

	@Transactional
	void save(ITiket... entities);

	@Transactional
	void delete(Integer id);

	@Transactional
	void deleteAll();

	@Transactional
	ITiket createEntity();

	List<ITiket> find(TiketFilter filter);

	@Transactional
	long getCount(TiketFilter filter);

	@Transactional
	ITiket getFullInfo(Integer id);

}
