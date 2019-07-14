package by.itacademy.aalexandrov.poker.web.converter;

import java.util.function.Function;

import org.springframework.stereotype.Component;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.web.dto.PlayerDTO;

@Component
public class PlayerToDTOConverter implements Function<IPlayer, PlayerDTO> {

	@Override
	public PlayerDTO apply(IPlayer entity) {
		PlayerDTO dto = new PlayerDTO();
		dto.setId(entity.getId());
		dto.setGame(entity.getGame());
		dto.setUserAccount(entity.getUserAccount());
		dto.setPosition(entity.getPosition());
		dto.setInGame(entity.isInGame());
		dto.setState(entity.getState());
		dto.setStack(entity.getStack());
		dto.setCreated(entity.getCreated());
		dto.setUpdated(entity.getUpdated());
		return dto;
	}

}
