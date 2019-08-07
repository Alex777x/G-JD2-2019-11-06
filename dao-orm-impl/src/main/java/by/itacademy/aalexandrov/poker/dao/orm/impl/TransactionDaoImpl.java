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

import by.itacademy.aalexandrov.poker.dao.api.ITransactionDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITransaction;
import by.itacademy.aalexandrov.poker.dao.api.filter.TransactionFilter;
import by.itacademy.aalexandrov.poker.dao.orm.impl.entity.Transaction;
import by.itacademy.aalexandrov.poker.dao.orm.impl.entity.Transaction_;

@Repository
public class TransactionDaoImpl extends AbstractDaoImpl<ITransaction, Integer> implements ITransactionDao {

	protected TransactionDaoImpl() {
		super(Transaction.class);
	}

	@Override
	public ITransaction createEntity() {
		return new Transaction();
	}

	@Override
	public List<ITransaction> find(TransactionFilter filter) {
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();

		final CriteriaQuery<ITransaction> cq = cb.createQuery(ITransaction.class);

		final Root<Transaction> from = cq.from(Transaction.class);// select from user_account
		cq.select(from); // select what? select *

		if (filter.getSortColumn() != null) {
			final SingularAttribute<? super Transaction, ?> sortProperty = toMetamodelFormat(filter.getSortColumn());
			final Path<?> expression = from.get(sortProperty); // build path to
			// sort
			// property
			cq.orderBy(new OrderImpl(expression, filter.getSortOrder())); // order
			// by
			// column_name
			// order
		}

		final TypedQuery<ITransaction> q = em.createQuery(cq);
		setPaging(filter, q);

		return q.getResultList();
	}

	@Override
	public long getCount(TransactionFilter filter) {
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();
		final CriteriaQuery<Long> cq = cb.createQuery(Long.class); // define
																	// type of
		// result
		final Root<Transaction> from = cq.from(Transaction.class); // select from brand
		cq.select(cb.count(from)); // select what? select count(*)
		final TypedQuery<Long> q = em.createQuery(cq);
		return q.getSingleResult(); // execute query
	}

	@Override
	public void save(ITransaction... entities) {
		throw new RuntimeException("not implemented");

	}

	private SingularAttribute<? super Transaction, ?> toMetamodelFormat(final String sortColumn) {
		switch (sortColumn) {
		case "created":
			return Transaction_.created;
		case "updated":
			return Transaction_.updated;
		case "id":
			return Transaction_.id;
		case "amount":
			return Transaction_.amount;
		case "userAccount":
			return Transaction_.userAccount;
		case "comment":
			return Transaction_.comment;
		default:
			throw new UnsupportedOperationException("sorting is not supported by column:" + sortColumn);
		}
	}

	@Override
	public long getSum(Integer id) {
		final EntityManager em = getEntityManager();
		// final CriteriaBuilder cb = em.getCriteriaBuilder();
		// final CriteriaQuery<Long> cq = cb.createQuery(Long.class);

		// final Root<Transaction> from = cq.from(Transaction.class);
		// cq.select(cb.sum(from));
		final Long q = (Long) em.createQuery(String.format("SELECT sum(amount) from Transaction where id = %s", id))
				.getSingleResult();
		return q;
	}

	@Override
	public ITransaction getFullInfo(Integer id) {
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();

		final CriteriaQuery<ITransaction> cq = cb.createQuery(ITransaction.class);
		final Root<Transaction> from = cq.from(Transaction.class);

		cq.select(from); // define what need to be selected

		from.fetch(Transaction_.userAccount, JoinType.LEFT);

		cq.distinct(true);

		cq.where(cb.equal(from.get(Transaction_.id), id));

		final TypedQuery<ITransaction> q = em.createQuery(cq);

		return getSingleResult(q);
	}

	@Override
	public List<ITransaction> getFullInfo() {
		final EntityManager em = getEntityManager();
		final CriteriaBuilder cb = em.getCriteriaBuilder();

		final CriteriaQuery<ITransaction> cq = cb.createQuery(ITransaction.class);
		final Root<Transaction> from = cq.from(Transaction.class);

		cq.select(from); // define what need to be selected

		from.fetch(Transaction_.userAccount, JoinType.LEFT);

		cq.distinct(true);

		final TypedQuery<ITransaction> q = em.createQuery(cq);

		return q.getResultList();
	}

}
