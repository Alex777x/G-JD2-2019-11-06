package by.itacademy.aalexandrov.poker.service.impl;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import by.itacademy.aalexandrov.poker.dao.api.ICountryDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICountry;
import by.itacademy.aalexandrov.poker.dao.api.filter.CountryFilter;
import by.itacademy.aalexandrov.poker.service.ICountryService;

@Service
public class CountryServiceImpl implements ICountryService {

	private static final Logger LOGGER = LoggerFactory.getLogger(CountryServiceImpl.class);

	private ICountryDao dao;

	@Autowired
	public CountryServiceImpl(ICountryDao dao) {
		super();
		this.dao = dao;
	}

	@Override
	public ICountry createEntity() {
		return dao.createEntity();
	}

	@Override
	public void save(final ICountry entity) {
		final Date modifedOn = new Date();
		entity.setUpdated(modifedOn);
		if (entity.getId() == null) {
			LOGGER.info("new Country created: {}", entity);
			entity.setCreated(modifedOn);
			dao.insert(entity);
		} else {
			LOGGER.info("new Country updated: {}", entity);
			dao.update(entity);
		}
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
	public ICountry get(final Integer id) {
		final ICountry entity = dao.get(id);
		LOGGER.debug("entityById: {}", entity);
		return entity;
	}

	@Override
	public void delete(final Integer id) {
		LOGGER.info("delete entity: {}", id);
		dao.delete(id);
	}

	@Override
	public void deleteAll() {
		LOGGER.info("delete all Countries");
		dao.deleteAll();
	}

	@Override
	public List<ICountry> getAll() {
		final List<ICountry> all = dao.selectAll();
		LOGGER.debug("total count in DB: {}", all.size());
		return all;
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
