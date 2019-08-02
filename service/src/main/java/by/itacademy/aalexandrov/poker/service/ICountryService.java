package by.itacademy.aalexandrov.poker.service;

import java.util.List;

import javax.transaction.Transactional;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICountry;
import by.itacademy.aalexandrov.poker.dao.api.filter.CountryFilter;

public interface ICountryService {

	ICountry get(Integer id);

	List<ICountry> getAll();

	@Transactional
	void save(ICountry entity);

	@Transactional
	void save(ICountry... entities);

	@Transactional
	void delete(Integer id);

	@Transactional
	void deleteAll();

	@Transactional
	ICountry createEntity();

	List<ICountry> find(CountryFilter filter);

	@Transactional
	long getCount(CountryFilter filter);

}
