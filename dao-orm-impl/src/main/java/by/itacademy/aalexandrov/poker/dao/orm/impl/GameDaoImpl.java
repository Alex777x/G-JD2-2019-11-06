package by.itacademy.aalexandrov.poker.dao.orm.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;

import by.itacademy.aalexandrov.poker.dao.api.IGameDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.filter.GameFilter;
import by.itacademy.aalexandrov.poker.dao.orm.impl.entity.Game;
import by.itacademy.aalexandrov.poker.dao.orm.impl.entity.Game_;

@Repository
public class GameDaoImpl extends AbstractDaoImpl<IGame, Integer> implements IGameDao {

	protected GameDaoImpl() {
		super(Game.class);
	}

	@Override
	public IGame createEntity() {
		return new Game();
	}

	@Override
	public List<IGame> find(GameFilter filter) {
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();

		final CriteriaQuery<IGame> cq = cb.createQuery(IGame.class);

		final Root<Game> from = cq.from(Game.class);
		cq.select(from);

		final TypedQuery<IGame> q = em.createQuery(cq);
		setPaging(filter, q);

		return q.getResultList();
	}

	@Override
	public long getCount(GameFilter filter) {
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();
		final CriteriaQuery<Long> cq = cb.createQuery(Long.class); // define
																	// type of
		// result
		final Root<Game> from = cq.from(Game.class); // select from brand
		cq.select(cb.count(from)); // select what? select count(*)
		final TypedQuery<Long> q = em.createQuery(cq);
		return q.getSingleResult(); // execute query
	}

	@Override
	public void save(IGame... entities) {
		throw new RuntimeException("not implemented");

	}


	@Override
	public IGame getFullInfo(Integer id) {
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();

		final CriteriaQuery<IGame> cq = cb.createQuery(IGame.class);

		final Root<Game> from = cq.from(Game.class);
		cq.select(from);
		cq.distinct(true);
		cq.where(cb.equal(from.get(Game_.id), id));
		final TypedQuery<IGame> q = em.createQuery(cq);
		return getSingleResult(q);
	}

	@Override
	public List<IGame> findByActivePlayer() {
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();

		final CriteriaQuery<IGame> cq = cb.createQuery(IGame.class);

		final Root<Game> from = cq.from(Game.class);
		cq.select(from);

		final TypedQuery<IGame> q = em.createQuery(cq);

		return q.getResultList();
	}

}
