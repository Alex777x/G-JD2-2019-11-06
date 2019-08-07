package by.itacademy.aalexandrov.poker.dao.api;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITiket;
import by.itacademy.aalexandrov.poker.dao.api.filter.TiketFilter;

public interface ITiketDao extends IDao<ITiket, Integer> {

	List<ITiket> find(TiketFilter filter);

	long getCount(TiketFilter filter);

	void save(ITiket... entities);

	ITiket getFullInfo(Integer id);

}
