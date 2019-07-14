package by.itacademy.aalexandrov.poker.web.converter;

import java.util.function.Function;

import org.springframework.stereotype.Component;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IChat;
import by.itacademy.aalexandrov.poker.web.dto.ChatDTO;

@Component
public class ChatToDTOConverter implements Function<IChat, ChatDTO> {

	@Override
	public ChatDTO apply(IChat entity) {
		ChatDTO dto = new ChatDTO();
		dto.setId(entity.getId());
		dto.setGame(entity.getGame());
		dto.setUserAccount(entity.getUserAccount());
		dto.setMessage(entity.getMessage());
		dto.setCreated(entity.getCreated());
		dto.setUpdated(entity.getUpdated());
		return dto;
	}

}
