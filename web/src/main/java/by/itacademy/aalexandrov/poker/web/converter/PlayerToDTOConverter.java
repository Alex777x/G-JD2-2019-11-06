package by.itacademy.aalexandrov.poker.web.converter;

import java.util.function.Function;

import org.springframework.stereotype.Component;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.web.dto.PlayerDTO;

@Component
public class PlayerToDTOConverter implements Function<IPlayer, PlayerDTO> {

	@Override
	public PlayerDTO apply(IPlayer entity) {
		PlayerDTO dto = new PlayerDTO();
		dto.setId(entity.getId());

		IGame game = entity.getGame();
		if (game != null) {
			dto.setGameId(game.getId());
		}

		IUserAccount userAccount = entity.getUserAccount();
		if (userAccount != null) {
			dto.setUserAccountId(userAccount.getId());
		}

		dto.setPosition(entity.getPosition());
		dto.setInGame(entity.isInGame());
		dto.setState(entity.getState());
		dto.setStack(entity.getStack());
		dto.setCreated(entity.getCreated());
		dto.setUpdated(entity.getUpdated());
		dto.setCard1(entity.getCard1());
		dto.setCard2(entity.getCard2());
		return dto;
	}

}
