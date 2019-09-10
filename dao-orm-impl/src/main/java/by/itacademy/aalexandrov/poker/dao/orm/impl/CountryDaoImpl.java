package by.itacademy.aalexandrov.poker.dao.orm.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Root;
import javax.persistence.metamodel.SingularAttribute;

import org.hibernate.jpa.criteria.OrderImpl;
import org.springframework.stereotype.Repository;

import by.itacademy.aalexandrov.poker.dao.api.ICountryDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICountry;
import by.itacademy.aalexandrov.poker.dao.api.filter.CountryFilter;
import by.itacademy.aalexandrov.poker.dao.orm.impl.entity.Country;
import by.itacademy.aalexandrov.poker.dao.orm.impl.entity.Country_;

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
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();

		final CriteriaQuery<ICountry> cq = cb.createQuery(ICountry.class);

		final Root<Country> from = cq.from(Country.class);// select from user_account
		cq.select(from); // select what? select *

		if (filter.getSortColumn() != null) {
			final SingularAttribute<? super Country, ?> sortProperty = toMetamodelFormat(filter.getSortColumn());
			final Path<?> expression = from.get(sortProperty); // build path to
			// sort
			// property
			cq.orderBy(new OrderImpl(expression, filter.getSortOrder())); // order
			// by
			// column_name
			// order
		}

		final TypedQuery<ICountry> q = em.createQuery(cq);
		setPaging(filter, q);

		return q.getResultList();
	}

	@Override
	public long getCount(CountryFilter filter) {
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();
		final CriteriaQuery<Long> cq = cb.createQuery(Long.class); // define
																	// type of
		// result
		final Root<Country> from = cq.from(Country.class); // select from brand
		cq.select(cb.count(from)); // select what? select count(*)
		final TypedQuery<Long> q = em.createQuery(cq);
		return q.getSingleResult(); // execute query
	}

	@Override
	public void save(ICountry... entities) {
		throw new RuntimeException("not implemented");

	}

	private SingularAttribute<? super Country, ?> toMetamodelFormat(final String sortColumn) {
		switch (sortColumn) {
		case "created":
			return Country_.created;
		case "updated":
			return Country_.updated;
		case "id":
			return Country_.id;
		case "country":
			return Country_.country;
		default:
			throw new UnsupportedOperationException("sorting is not supported by column:" + sortColumn);
		}
	}

	@Override
	public List<ICountry> getFullInfo() {
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();

		final CriteriaQuery<ICountry> cq = cb.createQuery(ICountry.class);
		final Root<Country> from = cq.from(Country.class);

		cq.select(from); // define what need to be selected

		cq.distinct(true);

		final TypedQuery<ICountry> q = em.createQuery(cq);

		return q.getResultList();
	}

}
