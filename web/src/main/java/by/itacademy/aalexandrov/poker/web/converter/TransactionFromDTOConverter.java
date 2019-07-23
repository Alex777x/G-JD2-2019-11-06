package by.itacademy.aalexandrov.poker.web.converter;

import java.util.function.Function;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITransaction;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.service.ITransactionService;
import by.itacademy.aalexandrov.poker.service.IUserAccountService;
import by.itacademy.aalexandrov.poker.web.dto.TransactionDTO;

@Component
public class TransactionFromDTOConverter implements Function<TransactionDTO, ITransaction> {

	@Autowired
	private ITransactionService transactionService;

	@Autowired
	private IUserAccountService userAccountService;

	@Override
	public ITransaction apply(TransactionDTO dto) {
		ITransaction entity = transactionService.createEntity();
		entity.setId(dto.getId());

		IUserAccount userAccount = userAccountService.createEntity();
		userAccount.setId(dto.getUserAccountId());
		entity.setUserAccount(userAccount);

		entity.setAmount(dto.getAmount());
		entity.setComment(dto.getComment());
		return entity;
	}

}
