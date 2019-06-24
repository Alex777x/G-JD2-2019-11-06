package by.itacademy.aalexandrov.poker.service.impl;

import java.util.Date;
import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.ITranzactionDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITranzaction;
import by.itacademy.aalexandrov.poker.dao.api.filter.TranzactionFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.TranzactionDaoImpl;
import by.itacademy.aalexandrov.poker.service.ITranzactionService;

public class TranzactionServiceImpl implements ITranzactionService {
	
	private ITranzactionDao dao = new TranzactionDaoImpl();
	
	@Override
	public ITranzaction createEntity() {
		return dao.createEntity();
	}

	@Override
	public void save(final ITranzaction entity) {
		final Date modifedOn = new Date();
		entity.setUpdated(modifedOn);
		if (entity.getId() == null) {
			entity.setCreated(modifedOn);
			dao.insert(entity);
		} else {
			dao.update(entity);
		}
	}

	@Override
	public ITranzaction get(final Integer id) {
		final ITranzaction entity = dao.get(id);
		return entity;
	}

	@Override
	public void delete(final Integer id) {
		dao.delete(id);
	}

	@Override
	public void deleteAll() {
		dao.deleteAll();
	}

	@Override
	public List<ITranzaction> getAll() {
		final List<ITranzaction> all = dao.selectAll();
		return all;
	}
	
	@Override
    public void save(ITranzaction... entities) {
        Date modified = new Date();
        for (ITranzaction iTranzaction : entities) {

        	iTranzaction.setUpdated(modified);
        	iTranzaction.setCreated(modified);

        }

        dao.save(entities);
    }

	@Override
	public List<ITranzaction> find(TranzactionFilter filter) {
		return dao.find(filter);
	}

	@Override
	public long getCount(TranzactionFilter filter) {
		return dao.getCount(filter);
	}

}
