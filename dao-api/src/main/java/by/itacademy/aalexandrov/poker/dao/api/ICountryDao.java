package by.itacademy.aalexandrov.poker.dao.api;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICountry;
import by.itacademy.aalexandrov.poker.dao.api.filter.CountryFilter;

public interface ICountryDao extends IDao<ICountry, Integer> {
	
	List<ICountry> find(CountryFilter filter);

	long getCount(CountryFilter filter);

	void save(ICountry... entities);

}
