package by.itacademy.aalexandrov.poker.service;

import java.util.List;

import javax.transaction.Transactional;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITransaction;
import by.itacademy.aalexandrov.poker.dao.api.filter.TransactionFilter;

public interface ITransactionService {

	@Transactional
	long getCount(TransactionFilter filter);

	List<ITransaction> find(TransactionFilter filter);

	@Transactional
	void save(final ITransaction entity);

	@Transactional
	void save(ITransaction... entities);

	List<ITransaction> getAll();

	@Transactional
	void deleteAll();

	@Transactional
	void delete(final Integer id);

	ITransaction get(final Integer id);

	@Transactional
	ITransaction createEntity();

	@Transactional
	ITransaction getFullInfo(Integer id);

	@Transactional
	List<ITransaction> getFullInfo();

	@Transactional
	double getBalance(Integer id);

	Double getSumm(Integer id);

}
