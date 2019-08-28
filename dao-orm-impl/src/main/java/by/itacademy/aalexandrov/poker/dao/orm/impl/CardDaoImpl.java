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

import by.itacademy.aalexandrov.poker.dao.api.ICardDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICard;
import by.itacademy.aalexandrov.poker.dao.api.filter.CardFilter;
import by.itacademy.aalexandrov.poker.dao.orm.impl.entity.Card;
import by.itacademy.aalexandrov.poker.dao.orm.impl.entity.Card_;

@Repository
public class CardDaoImpl extends AbstractDaoImpl<ICard, Integer> implements ICardDao {

	protected CardDaoImpl() {
		super(Card.class);
	}

	@Override
	public ICard createEntity() {
		return new Card();
	}

	@Override
	public List<ICard> find(CardFilter filter) {
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();

		final CriteriaQuery<ICard> cq = cb.createQuery(ICard.class);

		final Root<Card> from = cq.from(Card.class);// select from user_account
		cq.select(from); // select what? select *

		if (filter.getSortColumn() != null) {
			final SingularAttribute<? super Card, ?> sortProperty = toMetamodelFormat(filter.getSortColumn());
			final Path<?> expression = from.get(sortProperty); // build path to
			// sort
			// property
			cq.orderBy(new OrderImpl(expression, filter.getSortOrder())); // order
			// by
			// column_name
			// order
		}

		final TypedQuery<ICard> q = em.createQuery(cq);
		setPaging(filter, q);

		return q.getResultList();
	}

	@Override
	public long getCount(CardFilter filter) {
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();
		final CriteriaQuery<Long> cq = cb.createQuery(Long.class); // define
																	// type of
		// result
		final Root<Card> from = cq.from(Card.class); // select from brand
		cq.select(cb.count(from)); // select what? select count(*)
		final TypedQuery<Long> q = em.createQuery(cq);
		return q.getSingleResult(); // execute query
	}

	@Override
	public void save(ICard... entities) {
		throw new RuntimeException("not implemented");

	}

	private SingularAttribute<? super Card, ?> toMetamodelFormat(final String sortColumn) {
		switch (sortColumn) {
		case "created":
			return Card_.created;
		case "updated":
			return Card_.updated;
		case "id":
			return Card_.id;
		case "filename":
			return Card_.filename;
		case "rank":
			return Card_.rank;
		case "suit":
			return Card_.suit;
		default:
			throw new UnsupportedOperationException("sorting is not supported by column:" + sortColumn);
		}
	}

	@Override
	public List<ICard> getFullInfo() {
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();

		final CriteriaQuery<ICard> cq = cb.createQuery(ICard.class);
		final Root<Card> from = cq.from(Card.class);

		cq.select(from);

		cq.distinct(true);

		final TypedQuery<ICard> q = em.createQuery(cq);

		return q.getResultList();
	}

	@Override
	public ICard getFullInfo(Integer id) {
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();

		final CriteriaQuery<ICard> cq = cb.createQuery(ICard.class);
		final Root<Card> from = cq.from(Card.class);

		cq.select(from);
		cq.distinct(true);
		cq.where(cb.equal(from.get(Card_.id), id));

		final TypedQuery<ICard> q = em.createQuery(cq);

		return getSingleResult(q);
	}

}
