package by.itacademy.aalexandrov.poker.service;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITiket;
import by.itacademy.aalexandrov.poker.dao.api.filter.TiketFilter;

public interface ITiketService {

	ITiket get(Integer id);

	List<ITiket> getAll();

	void save(ITiket entity);

	void delete(Integer id);

	void deleteAll();

	ITiket createEntity();

	List<ITiket> find(TiketFilter filter);

	long getCount(TiketFilter filter);

}
