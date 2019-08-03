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

import by.itacademy.aalexandrov.poker.dao.api.ICardInGameDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICardInGame;
import by.itacademy.aalexandrov.poker.dao.api.filter.CardInGameFilter;
import by.itacademy.aalexandrov.poker.dao.orm.impl.entity.CardInGame;
import by.itacademy.aalexandrov.poker.dao.orm.impl.entity.CardInGame_;

@Repository
public class CardInGameDaoImpl extends AbstractDaoImpl<ICardInGame, Integer> implements ICardInGameDao {

	protected CardInGameDaoImpl() {
		super(CardInGame.class);
	}

	@Override
	public ICardInGame createEntity() {
		return new CardInGame();
	}

	@Override
	public List<ICardInGame> find(CardInGameFilter filter) {
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();

		final CriteriaQuery<ICardInGame> cq = cb.createQuery(ICardInGame.class);

		final Root<CardInGame> from = cq.from(CardInGame.class);// select from user_account
		cq.select(from); // select what? select *

		if (filter.getSortColumn() != null) {
			final SingularAttribute<? super CardInGame, ?> sortProperty = toMetamodelFormat(filter.getSortColumn());
			final Path<?> expression = from.get(sortProperty); // build path to
			// sort
			// property
			cq.orderBy(new OrderImpl(expression, filter.getSortOrder())); // order
			// by
			// column_name
			// order
		}

		final TypedQuery<ICardInGame> q = em.createQuery(cq);
		setPaging(filter, q);

		return q.getResultList();
	}

	@Override
	public long getCount(CardInGameFilter filter) {
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();
		final CriteriaQuery<Long> cq = cb.createQuery(Long.class); // define
																	// type of
		// result
		final Root<CardInGame> from = cq.from(CardInGame.class); // select from brand
		cq.select(cb.count(from)); // select what? select count(*)
		final TypedQuery<Long> q = em.createQuery(cq);
		return q.getSingleResult(); // execute query
	}

	@Override
	public void save(ICardInGame... entities) {
		throw new RuntimeException("not implemented");

	}

	private SingularAttribute<? super CardInGame, ?> toMetamodelFormat(final String sortColumn) {
		switch (sortColumn) {
		case "created":
			return CardInGame_.created;
		case "updated":
			return CardInGame_.updated;
		case "id":
			return CardInGame_.id;
		case "game":
			return CardInGame_.game;
		case "card":
			return CardInGame_.card;
		case "cardStatus":
			return CardInGame_.cardStatus;
		case "player":
			return CardInGame_.player;
		default:
			throw new UnsupportedOperationException("sorting is not supported by column:" + sortColumn);
		}
	}

}
