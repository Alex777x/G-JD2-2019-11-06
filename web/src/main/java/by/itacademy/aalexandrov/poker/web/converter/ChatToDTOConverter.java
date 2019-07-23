package by.itacademy.aalexandrov.poker.web.converter;

import java.util.function.Function;

import org.springframework.stereotype.Component;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IChat;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.web.dto.ChatDTO;

@Component
public class ChatToDTOConverter implements Function<IChat, ChatDTO> {

	@Override
	public ChatDTO apply(IChat entity) {
		ChatDTO dto = new ChatDTO();
		dto.setId(entity.getId());
		
		IGame game = entity.getGame();
		if (game != null) {
			dto.setGame(game.getId());
		}
		
		IUserAccount userAccount = entity.getUserAccount();
		if (userAccount != null) {
			dto.setUserAccount(userAccount.getId());
		}
		
		dto.setMessage(entity.getMessage());
		dto.setCreated(entity.getCreated());
		dto.setUpdated(entity.getUpdated());
		return dto;
	}

}
