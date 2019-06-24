package by.itacademy.aalexandrov.poker.service;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITranzaction;
import by.itacademy.aalexandrov.poker.dao.api.filter.TranzactionFilter;

public interface ITranzactionService {

	long getCount(TranzactionFilter filter);

	List<ITranzaction> find(TranzactionFilter filter);

	void save(ITranzaction... entities);

	List<ITranzaction> getAll();

	void deleteAll();

	void delete(final Integer id);

	ITranzaction get(final Integer id);

	void save(final ITranzaction entity);

	ITranzaction createEntity();

}
