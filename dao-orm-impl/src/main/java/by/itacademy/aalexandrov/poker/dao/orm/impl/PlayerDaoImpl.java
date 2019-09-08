package by.itacademy.aalexandrov.poker.dao.orm.impl;

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
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerStatus;
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
	public void save(IPlayer entity) {
		throw new RuntimeException("not implemented");

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
	public boolean findPlayer(Integer loggedUserId) {
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();
		final CriteriaQuery<Long> cq = cb.createQuery(Long.class);

		final Root<Player> from = cq.from(Player.class);
		cq.select(cb.count(from));

		cq.where(cb.equal(from.get(Player_.userAccount), loggedUserId),
				cb.and(cb.equal(from.get(Player_.inGame), true)));

		final TypedQuery<Long> q = em.createQuery(cq);
		Long result = q.getSingleResult();
		if (result == 0) {
			return false;
		} else {
			return true;
		}

	}

	@Override
	public List<IPlayer> getPlayersByGame(Integer id) {
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();

		final CriteriaQuery<IPlayer> cq = cb.createQuery(IPlayer.class);
		final Root<Player> from = cq.from(Player.class);

		cq.select(from);

		from.fetch(Player_.game, JoinType.LEFT);
		from.fetch(Player_.userAccount, JoinType.LEFT);
		cq.where(cb.equal(from.get(Player_.game), id), cb.and(cb.equal(from.get(Player_.inGame), true)));
		cq.orderBy(new OrderImpl(from.get(Player_.position), true));
		cq.distinct(true);

		final TypedQuery<IPlayer> q = em.createQuery(cq);

		return q.getResultList();
	}

	@Override
	public IPlayer getPlayerByUser(Integer id) {
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();

		final CriteriaQuery<IPlayer> cq = cb.createQuery(IPlayer.class);
		final Root<Player> from = cq.from(Player.class);

		cq.select(from);

		from.fetch(Player_.game, JoinType.LEFT);
		from.fetch(Player_.userAccount, JoinType.LEFT);

		cq.distinct(true);

		cq.where(cb.equal(from.get(Player_.userAccount), id), cb.and(cb.equal(from.get(Player_.inGame), true)));

		final TypedQuery<IPlayer> q = em.createQuery(cq);

		return getSingleResult(q);
	}

	@Override
	public IPlayer getPlayerByUserAccunt(Integer loggedUserId) {
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();

		final CriteriaQuery<IPlayer> cq = cb.createQuery(IPlayer.class);
		final Root<Player> from = cq.from(Player.class);

		cq.select(from);

		from.fetch(Player_.game, JoinType.LEFT);
		from.fetch(Player_.userAccount, JoinType.LEFT);

		cq.distinct(true);

		cq.where(cb.equal(from.get(Player_.userAccount), loggedUserId),
				cb.and(cb.equal(from.get(Player_.inGame), true)));

		final TypedQuery<IPlayer> q = em.createQuery(cq);

		return getSingleResult(q);
	}

	@Override
	public IPlayer getPlayerSmallBlind(Integer gameid, PlayerStatus smallblind) {
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();

		final CriteriaQuery<IPlayer> cq = cb.createQuery(IPlayer.class);
		final Root<Player> from = cq.from(Player.class);

		cq.select(from); // define what need to be selected

		from.fetch(Player_.game, JoinType.LEFT);
		from.fetch(Player_.userAccount, JoinType.LEFT);

		cq.distinct(true);

		cq.where(cb.equal(from.get(Player_.game), gameid), cb.and(cb.equal(from.get(Player_.state), smallblind)));

		final TypedQuery<IPlayer> q = em.createQuery(cq);

		return getSingleResult(q);
	}

}
