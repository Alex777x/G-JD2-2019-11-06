package by.itacademy.aalexandrov.poker.service.impl;

import java.util.Date;
import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.ICountryDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICountry;
import by.itacademy.aalexandrov.poker.dao.api.filter.CountryFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.CountryDaoImpl;
import by.itacademy.aalexandrov.poker.service.ICountryService;

public class CountryServiceImpl implements ICountryService {

	private ICountryDao dao = new CountryDaoImpl();

	@Override
	public ICountry createEntity() {
		return dao.createEntity();
	}

	@Override
	public void save(final ICountry entity) {
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
	public ICountry get(final Integer id) {
		final ICountry entity = dao.get(id);
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
	public List<ICountry> getAll() {
		final List<ICountry> all = dao.selectAll();
		return all;
	}

	@Override
	public void save(ICountry... entities) {
		Date modified = new Date();
		for (ICountry iCountry : entities) {

			iCountry.setUpdated(modified);
			iCountry.setCreated(modified);

		}

		dao.save(entities);
	}

	@Override
	public List<ICountry> find(CountryFilter filter) {
		return dao.find(filter);
	}

	@Override
	public long getCount(CountryFilter filter) {
		return dao.getCount(filter);
	}

}
