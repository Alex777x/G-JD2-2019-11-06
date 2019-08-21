package by.itacademy.aalexandrov.poker.dao.orm.impl;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Root;
import javax.persistence.metamodel.SingularAttribute;

import org.hibernate.jpa.criteria.OrderImpl;
import org.springframework.stereotype.Repository;

import by.itacademy.aalexandrov.poker.dao.api.IPlayerDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.dao.api.filter.PlayerFilter;
import by.itacademy.aalexandrov.poker.dao.orm.impl.entity.Player;
import by.itacademy.aalexandrov.poker.dao.orm.impl.entity.Player_;

@Repository
public class PlayerDaoImpl extends AbstractDaoImpl<IPlayer, Integer> implements IPlayerDao {

	protected PlayerDaoImpl() {
		super(Player.class);
	}

	@Override
	public IPlayer createEntity() {
		return new Player();
	}

	@Override
	public List<IPlayer> find(PlayerFilter filter) {
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();

		final CriteriaQuery<IPlayer> cq = cb.createQuery(IPlayer.class);

		final Root<Player> from = cq.from(Player.class);// select from user_account
		cq.select(from); // select what? select *

		if (filter.getSortColumn() != null) {
			final SingularAttribute<? super Player, ?> sortProperty = toMetamodelFormat(filter.getSortColumn());
			final Path<?> expression = from.get(sortProperty); // build path to
			// sort
			// property
			cq.orderBy(new OrderImpl(expression, filter.getSortOrder())); // order
			// by
			// column_name
			// order
		}

		final TypedQuery<IPlayer> q = em.createQuery(cq);
		setPaging(filter, q);

		return q.getResultList();
	}

	@Override
	public long getCount(PlayerFilter filter) {
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();
		final CriteriaQuery<Long> cq = cb.createQuery(Long.class); // define
																	// type of
		// result
		final Root<Player> from = cq.from(Player.class); // select from brand
		cq.select(cb.count(from)); // select what? select count(*)
		final TypedQuery<Long> q = em.createQuery(cq);
		return q.getSingleResult(); // execute query
	}

	@Override
	public void save(IPlayer... entities) {
		throw new RuntimeException("not implemented");

	}

	private SingularAttribute<? super Player, ?> toMetamodelFormat(final String sortColumn) {
		switch (sortColumn) {
		case "created":
			return Player_.created;
		case "updated":
			return Player_.updated;
		case "id":
			return Player_.id;
		case "game":
			return Player_.game;
		case "stack":
			return Player_.stack;
		case "userAccount":
			return Player_.userAccount;
		case "position":
			return Player_.position;
		case "inGame":
			return Player_.inGame;
		case "state":
			return Player_.state;
		default:
			throw new UnsupportedOperationException("sorting is not supported by column:" + sortColumn);
		}
	}

	@Override
	public IPlayer getFullInfo(Integer id) {
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();

		final CriteriaQuery<IPlayer> cq = cb.createQuery(IPlayer.class);
		final Root<Player> from = cq.from(Player.class);

		cq.select(from); // define what need to be selected

		from.fetch(Player_.game, JoinType.LEFT);
		from.fetch(Player_.userAccount, JoinType.LEFT);

		cq.distinct(true);

		cq.where(cb.equal(from.get(Player_.id), id));

		final TypedQuery<IPlayer> q = em.createQuery(cq);

		return getSingleResult(q);
	}

	@Override
	public long getPlayersCount(Integer id) {
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();
		final CriteriaQuery<Long> cq = cb.createQuery(Long.class);

		final Root<Player> from = cq.from(Player.class);
		cq.select(cb.count(from));

		cq.where(cb.equal(from.get(Player_.game), id), cb.and(cb.equal(from.get(Player_.inGame), true)));

		final TypedQuery<Long> q = em.createQuery(cq);
		return q.getSingleResult();
	}

	@Override
	public List<IPlayer> getFullInfo() {
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();

		final CriteriaQuery<IPlayer> cq = cb.createQuery(IPlayer.class);
		final Root<Player> from = cq.from(Player.class);

		cq.select(from); // define what need to be selected

		from.fetch(Player_.game, JoinType.LEFT);
		from.fetch(Player_.userAccount, JoinType.LEFT);

		cq.distinct(true);

		final TypedQuery<IPlayer> q = em.createQuery(cq);

		return q.getResultList();
	}

	@Override
	public void updateState(Integer loggedUserId) {
		IPlayer entity = getFullInfo(loggedUserId);
		entity.setUpdated(new Date());
		super.update(entity);
		recursionFucn(loggedUserId);
		// entity.setInGame(false);
		// super.update(entity);

	}

	public void recursionFucn(Integer loggedUserId) {
		IPlayer entity = getFullInfo(loggedUserId);
		Date lastUpdated = entity.getUpdated();
		long milli = lastUpdated.getTime();
		Date curentTime = new Date();
		long curentMilli = curentTime.getTime();
		long diff = curentMilli - milli;
		if (diff > 15000) {
			EntityManager em = getEntityManager();

			// Query query = em.createQuery("UPDATE Player SET in_game = false WHERE
			// user_account_id = :user_account_id");
			// query.setParameter("user_account_id", loggedUserId);

			em.createQuery(String.format("UPDATE Player SET in_game = false WHERE user_account_id = :user_account_id"))
					.setParameter("user_account_id", loggedUserId).executeUpdate();

			// entity.setInGame(false);
			// super.update(entity);
			return;
		} else {
			try {
				Thread.sleep(5000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			recursionFucn(loggedUserId);
		}

	}

}
