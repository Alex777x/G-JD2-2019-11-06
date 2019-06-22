package by.itacademy.aalexandrov.poker.service;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICountry;
import by.itacademy.aalexandrov.poker.dao.api.filter.CountryFilter;

public interface ICountryService {
	
	ICountry get(Integer id);

	List<ICountry> getAll();
	
	void save(ICountry entity);

	void save(ICountry... entities);

	void delete(Integer id);

	void deleteAll();

	ICountry createEntity();

	List<ICountry> find(CountryFilter filter);

	long getCount(CountryFilter filter);

}
