package by.itacademy.aalexandrov.poker.dao.orm.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Root;
import org.hibernate.jpa.criteria.OrderImpl;
import org.springframework.stereotype.Repository;

import by.itacademy.aalexandrov.poker.dao.api.IChatInHomeDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IChatInHome;
import by.itacademy.aalexandrov.poker.dao.api.filter.ChatInHomeFilter;
import by.itacademy.aalexandrov.poker.dao.orm.impl.entity.ChatInHome;
import by.itacademy.aalexandrov.poker.dao.orm.impl.entity.ChatInHome_;

@Repository
public class ChatInHomeDaoImpl extends AbstractDaoImpl<IChatInHome, Integer> implements IChatInHomeDao {

	protected ChatInHomeDaoImpl() {
		super(ChatInHome.class);
	}

	@Override
	public IChatInHome createEntity() {
		return new ChatInHome();
	}

	@Override
	public List<IChatInHome> find(ChatInHomeFilter filter) {
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();

		final CriteriaQuery<IChatInHome> cq = cb.createQuery(IChatInHome.class);

		final Root<ChatInHome> from = cq.from(ChatInHome.class);
		cq.select(from);

		from.fetch(ChatInHome_.userAccount, JoinType.LEFT);
		cq.distinct(true);

		final TypedQuery<IChatInHome> q = em.createQuery(cq);
		setPaging(filter, q);

		return q.getResultList();
	}

	@Override
	public long getCount(ChatInHomeFilter filter) {
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();
		final CriteriaQuery<Long> cq = cb.createQuery(Long.class); // define
																	// type of
		// result
		final Root<ChatInHome> from = cq.from(ChatInHome.class); // select from brand
		cq.select(cb.count(from)); // select what? select count(*)
		final TypedQuery<Long> q = em.createQuery(cq);
		return q.getSingleResult(); // execute query
	}

	@Override
	public void save(IChatInHome... entities) {
		throw new RuntimeException("not implemented");

	}


	@Override
	public IChatInHome getFullInfo(Integer id) {
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();

		final CriteriaQuery<IChatInHome> cq = cb.createQuery(IChatInHome.class);
		final Root<ChatInHome> from = cq.from(ChatInHome.class);

		cq.select(from); // define what need to be selected

		from.fetch(ChatInHome_.userAccount, JoinType.LEFT);

		cq.distinct(true);

		cq.where(cb.equal(from.get(ChatInHome_.id), id));

		final TypedQuery<IChatInHome> q = em.createQuery(cq);

		return getSingleResult(q);
	}

	@Override
	public List<IChatInHome> getFullInfo() {
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();

		final CriteriaQuery<IChatInHome> cq = cb.createQuery(IChatInHome.class);
		final Root<ChatInHome> from = cq.from(ChatInHome.class);

		cq.select(from);

		from.fetch(ChatInHome_.userAccount, JoinType.LEFT);
		cq.distinct(true);
		cq.orderBy(new OrderImpl(from.get(ChatInHome_.created), true));
		final TypedQuery<IChatInHome> q = em.createQuery(cq);

		return q.getResultList();

	}

	@Override
	public IChatInHome getNewestMessage() {
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();
		final CriteriaQuery<IChatInHome> cq = cb.createQuery(IChatInHome.class);
		final Root<ChatInHome> from = cq.from(ChatInHome.class);
		cq.select(from);
		from.fetch(ChatInHome_.userAccount, JoinType.LEFT);
		cq.orderBy(new OrderImpl(from.get(ChatInHome_.created), false));
		final TypedQuery<IChatInHome> q = em.createQuery(cq);
		q.setMaxResults(1);
		List<IChatInHome> resultList = q.getResultList();
		return resultList.isEmpty() ? null : resultList.get(0);
	}

	@Override
	public List<IChatInHome> getLastMessages(Integer id) {
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();

		final CriteriaQuery<IChatInHome> cq = cb.createQuery(IChatInHome.class);
		final Root<ChatInHome> from = cq.from(ChatInHome.class);

		cq.select(from);

		from.fetch(ChatInHome_.userAccount, JoinType.LEFT);

		cq.where(cb.greaterThan(from.get(ChatInHome_.id), id));
		cq.orderBy(new OrderImpl(from.get(ChatInHome_.created), true));

		final TypedQuery<IChatInHome> q = em.createQuery(cq);

		return q.getResultList();
	}

}
