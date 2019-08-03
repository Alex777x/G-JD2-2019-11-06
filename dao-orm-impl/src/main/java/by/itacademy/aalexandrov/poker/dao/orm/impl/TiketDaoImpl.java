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

import by.itacademy.aalexandrov.poker.dao.api.ITiketDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITiket;
import by.itacademy.aalexandrov.poker.dao.api.filter.TiketFilter;
import by.itacademy.aalexandrov.poker.dao.orm.impl.entity.Tiket;
import by.itacademy.aalexandrov.poker.dao.orm.impl.entity.Tiket_;

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
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();

		final CriteriaQuery<ITiket> cq = cb.createQuery(ITiket.class);

		final Root<Tiket> from = cq.from(Tiket.class);// select from user_account
		cq.select(from); // select what? select *

		if (filter.getSortColumn() != null) {
			final SingularAttribute<? super Tiket, ?> sortProperty = toMetamodelFormat(filter.getSortColumn());
			final Path<?> expression = from.get(sortProperty); // build path to
			// sort
			// property
			cq.orderBy(new OrderImpl(expression, filter.getSortOrder())); // order
			// by
			// column_name
			// order
		}

		final TypedQuery<ITiket> q = em.createQuery(cq);
		setPaging(filter, q);

		return q.getResultList();
	}

	@Override
	public long getCount(TiketFilter filter) {
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();
		final CriteriaQuery<Long> cq = cb.createQuery(Long.class); // define
																	// type of
		// result
		final Root<Tiket> from = cq.from(Tiket.class); // select from brand
		cq.select(cb.count(from)); // select what? select count(*)
		final TypedQuery<Long> q = em.createQuery(cq);
		return q.getSingleResult(); // execute query
	}

	@Override
	public void save(ITiket... entities) {
		throw new RuntimeException("not implemented");

	}

	private SingularAttribute<? super Tiket, ?> toMetamodelFormat(final String sortColumn) {
		switch (sortColumn) {
		case "created":
			return Tiket_.created;
		case "updated":
			return Tiket_.updated;
		case "id":
			return Tiket_.id;
		case "userAccount":
			return Tiket_.userAccount;
		case "tiketTitle":
			return Tiket_.tiketTitle;
		case "tiketText":
			return Tiket_.tiketText;
		case "status":
			return Tiket_.status;
		default:
			throw new UnsupportedOperationException("sorting is not supported by column:" + sortColumn);
		}
	}

}
