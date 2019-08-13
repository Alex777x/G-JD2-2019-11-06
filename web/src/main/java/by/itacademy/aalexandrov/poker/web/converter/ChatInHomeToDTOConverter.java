package by.itacademy.aalexandrov.poker.web.converter;

import java.util.function.Function;

import org.springframework.stereotype.Component;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IChatInHome;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.web.dto.ChatInHomeDTO;

@Component
public class ChatInHomeToDTOConverter implements Function<IChatInHome, ChatInHomeDTO> {

	@Override
	public ChatInHomeDTO apply(IChatInHome entity) {
		ChatInHomeDTO dto = new ChatInHomeDTO();
		dto.setId(entity.getId());

		IUserAccount userAccount = entity.getUserAccount();
		if (userAccount != null) {
			dto.setUserAccount(userAccount.getId());
			dto.setUserAccountName(userAccount.getNickname());
		}

		dto.setMessage(entity.getMessage());
		dto.setCreated(entity.getCreated());
		dto.setUpdated(entity.getUpdated());
		return dto;
	}

}
