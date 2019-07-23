package by.itacademy.aalexandrov.poker.web.converter;

import java.util.function.Function;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IChat;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.service.IChatService;
import by.itacademy.aalexandrov.poker.service.IGameService;
import by.itacademy.aalexandrov.poker.service.IUserAccountService;
import by.itacademy.aalexandrov.poker.web.dto.ChatDTO;

@Component
public class ChatFromDTOConverter implements Function<ChatDTO, IChat> {

	@Autowired
	private IChatService chatService;

	@Autowired
	private IGameService gameService;

	@Autowired
	private IUserAccountService userAccountService;

	@Override
	public IChat apply(ChatDTO dto) {
		IChat entity = chatService.createEntity();

		IGame game = gameService.createEntity();
		game.setId(dto.getGame());
		entity.setGame(game);

		IUserAccount userAccount = userAccountService.createEntity();
		userAccount.setId(dto.getUserAccount());
		entity.setUserAccount(userAccount);

		entity.setMessage(dto.getMessage());
		return entity;
	}

}
