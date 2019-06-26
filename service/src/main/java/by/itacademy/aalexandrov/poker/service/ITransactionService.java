package by.itacademy.aalexandrov.poker.service;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITransaction;
import by.itacademy.aalexandrov.poker.dao.api.filter.TransactionFilter;

public interface ITransactionService {

	long getCount(TransactionFilter filter);

	List<ITransaction> find(TransactionFilter filter);

	void save(ITransaction... entities);

	List<ITransaction> getAll();

	void deleteAll();

	void delete(final Integer id);

	ITransaction get(final Integer id);

	void save(final ITransaction entity);

	ITransaction createEntity();

}
