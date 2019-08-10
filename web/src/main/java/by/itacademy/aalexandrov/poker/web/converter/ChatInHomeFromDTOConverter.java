package by.itacademy.aalexandrov.poker.web.converter;

import java.util.function.Function;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IChatInHome;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.service.IChatInHomeService;
import by.itacademy.aalexandrov.poker.service.IUserAccountService;
import by.itacademy.aalexandrov.poker.web.dto.ChatInHomeDTO;

@Component
public class ChatInHomeFromDTOConverter implements Function<ChatInHomeDTO, IChatInHome> {

	@Autowired
	private IChatInHomeService chatInHomeService;

	@Autowired
	private IUserAccountService userAccountService;

	@Override
	public IChatInHome apply(ChatInHomeDTO dto) {
		IChatInHome entity = chatInHomeService.createEntity();

		IUserAccount userAccount = userAccountService.createEntity();
		userAccount.setId(dto.getUserAccount());
		entity.setUserAccount(userAccount);

		entity.setMessage(dto.getMessage());

		return entity;
	}

}
