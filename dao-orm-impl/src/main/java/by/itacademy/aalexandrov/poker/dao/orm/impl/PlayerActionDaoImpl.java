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

import by.itacademy.aalexandrov.poker.dao.api.IPlayerActionDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayerAction;
import by.itacademy.aalexandrov.poker.dao.api.filter.PlayerActionFilter;
import by.itacademy.aalexandrov.poker.dao.orm.impl.entity.PlayerAction;
import by.itacademy.aalexandrov.poker.dao.orm.impl.entity.PlayerAction_;

@Repository
public class PlayerActionDaoImpl extends AbstractDaoImpl<IPlayerAction, Integer> implements IPlayerActionDao {

	protected PlayerActionDaoImpl() {
		super(PlayerAction.class);
	}

	@Override
	public IPlayerAction createEntity() {
		return new PlayerAction();
	}

	@Override
	public List<IPlayerAction> find(PlayerActionFilter filter) {
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();

		final CriteriaQuery<IPlayerAction> cq = cb.createQuery(IPlayerAction.class);

		final Root<PlayerAction> from = cq.from(PlayerAction.class);// select from user_account
		cq.select(from); // select what? select *

		if (filter.getSortColumn() != null) {
			final SingularAttribute<? super PlayerAction, ?> sortProperty = toMetamodelFormat(filter.getSortColumn());
			final Path<?> expression = from.get(sortProperty); // build path to
			// sort
			// property
			cq.orderBy(new OrderImpl(expression, filter.getSortOrder())); // order
			// by
			// column_name
			// order
		}

		final TypedQuery<IPlayerAction> q = em.createQuery(cq);
		setPaging(filter, q);

		return q.getResultList();
	}

	@Override
	public long getCount(PlayerActionFilter filter) {
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();
		final CriteriaQuery<Long> cq = cb.createQuery(Long.class); // define
																	// type of
		// result
		final Root<PlayerAction> from = cq.from(PlayerAction.class); // select from brand
		cq.select(cb.count(from)); // select what? select count(*)
		final TypedQuery<Long> q = em.createQuery(cq);
		return q.getSingleResult(); // execute query
	}

	@Override
	public void save(IPlayerAction... entities) {
		throw new RuntimeException("not implemented");

	}

	private SingularAttribute<? super PlayerAction, ?> toMetamodelFormat(final String sortColumn) {
		switch (sortColumn) {
		case "created":
			return PlayerAction_.created;
		case "updated":
			return PlayerAction_.updated;
		case "id":
			return PlayerAction_.id;
		case "bet":
			return PlayerAction_.bet;
		case "call":
			return PlayerAction_.call;
		case "fold":
			return PlayerAction_.fold;
		case "raise":
			return PlayerAction_.raise;
		case "check":
			return PlayerAction_.check;
		case "player":
			return PlayerAction_.player;
		case "allIn":
			return PlayerAction_.allIn;
		default:
			throw new UnsupportedOperationException("sorting is not supported by column:" + sortColumn);
		}
	}

}
