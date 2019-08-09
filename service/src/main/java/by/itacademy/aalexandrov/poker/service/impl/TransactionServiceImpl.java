package by.itacademy.aalexandrov.poker.service.impl;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import by.itacademy.aalexandrov.poker.dao.api.ITransactionDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITransaction;
import by.itacademy.aalexandrov.poker.dao.api.filter.TransactionFilter;
import by.itacademy.aalexandrov.poker.service.ITransactionService;

@Service
public class TransactionServiceImpl implements ITransactionService {

	private static final Logger LOGGER = LoggerFactory.getLogger(TransactionServiceImpl.class);

	private ITransactionDao dao;

	@Autowired
	public TransactionServiceImpl(ITransactionDao dao) {
		super();
		this.dao = dao;
	}

	@Override
	public ITransaction createEntity() {
		return dao.createEntity();
	}

	@Override
	public void save(final ITransaction entity) {
		final Date modifedOn = new Date();
		entity.setUpdated(modifedOn);
		if (entity.getId() == null) {
			LOGGER.info("new Transaction created: {}", entity);
			entity.setCreated(modifedOn);
			dao.insert(entity);
		} else {
			LOGGER.info("new Transaction updated: {}", entity);
			dao.update(entity);
		}
	}

	@Override
	public void save(ITransaction... entities) {
		Date modified = new Date();
		for (ITransaction iTransaction : entities) {

			iTransaction.setUpdated(modified);
			iTransaction.setCreated(modified);

		}

		dao.save(entities);
	}

	@Override
	public ITransaction get(final Integer id) {
		final ITransaction entity = dao.get(id);
		LOGGER.debug("entityById: {}", entity);
		return entity;
	}

	@Override
	public void delete(final Integer id) {
		LOGGER.info("delete entity: {}", id);
		dao.delete(id);
	}

	@Override
	public void deleteAll() {
		LOGGER.info("delete all Transactions");
		dao.deleteAll();
	}

	@Override
	public List<ITransaction> getAll() {
		final List<ITransaction> all = dao.selectAll();
		LOGGER.debug("total count in DB: {}", all.size());
		return all;
	}

	@Override
	public List<ITransaction> find(TransactionFilter filter) {
		return dao.find(filter);
	}

	@Override
	public long getCount(TransactionFilter filter) {
		return dao.getCount(filter);
	}

	@Override
	public long getSum(Integer id) {
		return dao.getSum(id);
	}

	@Override
	public ITransaction getFullInfo(Integer id) {
		return dao.getFullInfo(id);
	}

	@Override
	public List<ITransaction> getFullInfo() {
		return dao.getFullInfo();
	}

	@Override
	public double getBalance(Integer id) {
		return dao.getBalance(id);
	}

}
