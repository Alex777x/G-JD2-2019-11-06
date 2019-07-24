package by.itacademy.aalexandrov.poker.web.converter;

import java.util.function.Function;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.service.IGameService;
import by.itacademy.aalexandrov.poker.service.IPlayerService;
import by.itacademy.aalexandrov.poker.service.IUserAccountService;
import by.itacademy.aalexandrov.poker.web.dto.PlayerDTO;

@Component
public class PlayerFromDTOConverter implements Function<PlayerDTO, IPlayer> {

	@Autowired
	private IPlayerService playerService;

	@Autowired
	private IGameService gameService;

	@Autowired
	private IUserAccountService userAccountService;

	@Override
	public IPlayer apply(PlayerDTO dto) {
		IPlayer entity = playerService.createEntity();
		entity.setId(dto.getId());

		IGame game = gameService.createEntity();
		game.setId(dto.getGameId());
		entity.setGame(game);

		IUserAccount userAccount = userAccountService.createEntity();
		userAccount.setId(dto.getUserAccountId());
		entity.setUserAccount(userAccount);

		entity.setPosition(dto.getPosition());
		entity.setInGame(dto.isInGame());
		entity.setState(dto.getState());
		entity.setStack(dto.getStack());

		return entity;

	}

}
