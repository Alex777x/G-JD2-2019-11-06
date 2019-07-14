package by.itacademy.aalexandrov.poker.web.converter;

import java.util.function.Function;

import org.springframework.stereotype.Component;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITransaction;
import by.itacademy.aalexandrov.poker.web.dto.TransactionDTO;

@Component
public class TransactionToDTOConverter implements Function<ITransaction, TransactionDTO> {

	@Override
	public TransactionDTO apply(ITransaction entity) {
		TransactionDTO dto = new TransactionDTO();
		dto.setId(entity.getId());
		dto.setAmount(entity.getAmount());
		dto.setComment(entity.getComment());
		dto.setCreated(entity.getCreated());
		dto.setUpdated(entity.getUpdated());
		return dto;
	}

}
