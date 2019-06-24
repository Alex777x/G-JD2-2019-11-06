package by.itacademy.aalexandrov.poker.dao.api;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITranzaction;
import by.itacademy.aalexandrov.poker.dao.api.filter.TranzactionFilter;

public interface ITranzactionDao extends IDao<ITranzaction, Integer> {

	List<ITranzaction> find(TranzactionFilter filter);

	long getCount(TranzactionFilter filter);

	void save(ITranzaction... entities);

}
