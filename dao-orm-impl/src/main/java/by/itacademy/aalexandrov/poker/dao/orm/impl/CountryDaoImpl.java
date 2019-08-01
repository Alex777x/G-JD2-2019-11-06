package by.itacademy.aalexandrov.poker.dao.orm.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import by.itacademy.aalexandrov.poker.dao.api.ICountryDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICountry;
import by.itacademy.aalexandrov.poker.dao.api.filter.CountryFilter;
import by.itacademy.aalexandrov.poker.dao.orm.impl.entity.Country;

@Repository
public class CountryDaoImpl extends AbstractDaoImpl<ICountry, Integer> implements ICountryDao {

	protected CountryDaoImpl() {
		super(Country.class);
	}

	@Override
	public ICountry createEntity() {
		return new Country();
	}

	@Override
	public List<ICountry> find(CountryFilter filter) {
		throw new RuntimeException("not implemented");
	}

	@Override
	public long getCount(CountryFilter filter) {
		throw new RuntimeException("not implemented");
	}

	@Override
	public void save(ICountry... entities) {
		throw new RuntimeException("not implemented");
	}

}
