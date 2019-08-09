package by.itacademy.aalexandrov.poker.dao.api;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITransaction;
import by.itacademy.aalexandrov.poker.dao.api.filter.TransactionFilter;

public interface ITransactionDao extends IDao<ITransaction, Integer> {

	List<ITransaction> find(TransactionFilter filter);

	long getCount(TransactionFilter filter);

	void save(ITransaction... entities);

	long getSum(Integer id);

	ITransaction getFullInfo(Integer id);

	List<ITransaction> getFullInfo();

	double getBalance(Integer id);

}
