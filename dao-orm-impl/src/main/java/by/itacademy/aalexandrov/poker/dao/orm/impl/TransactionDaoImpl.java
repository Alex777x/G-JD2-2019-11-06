package by.itacademy.aalexandrov.poker.dao.orm.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import by.itacademy.aalexandrov.poker.dao.api.ITransactionDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITransaction;
import by.itacademy.aalexandrov.poker.dao.api.filter.TransactionFilter;
import by.itacademy.aalexandrov.poker.dao.orm.impl.entity.Transaction;

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
		throw new RuntimeException("not implemented");
	}

	@Override
	public long getCount(TransactionFilter filter) {
		throw new RuntimeException("not implemented");
	}

	@Override
	public void save(ITransaction... entities) {
		throw new RuntimeException("not implemented");

	}

}
