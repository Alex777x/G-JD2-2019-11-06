package by.itacademy.aalexandrov.poker.dao.orm.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import by.itacademy.aalexandrov.poker.dao.api.ITiketDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITiket;
import by.itacademy.aalexandrov.poker.dao.api.filter.TiketFilter;
import by.itacademy.aalexandrov.poker.dao.orm.impl.entity.Tiket;

@Repository
public class TiketDaoImpl extends AbstractDaoImpl<ITiket, Integer> implements ITiketDao {

	protected TiketDaoImpl() {
		super(Tiket.class);
	}

	@Override
	public ITiket createEntity() {
		return new Tiket();
	}

	@Override
	public List<ITiket> find(TiketFilter filter) {
		throw new RuntimeException("not implemented");
	}

	@Override
	public long getCount(TiketFilter filter) {
		throw new RuntimeException("not implemented");
	}

	@Override
	public void save(ITiket... entities) {
		throw new RuntimeException("not implemented");

	}

}
