package by.itacademy.aalexandrov.poker.web.converter;

import java.util.function.Function;

import org.springframework.stereotype.Component;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.web.dto.GameDTO;

@Component
public class GameToDTOConverter implements Function<IGame, GameDTO> {

	@Override
	public GameDTO apply(IGame entity) {
		GameDTO dto = new GameDTO();
		dto.setId(entity.getId());
		dto.setState(entity.getState());
		dto.setBank(entity.getBank());
		dto.setCreated(entity.getCreated());
		dto.setUpdated(entity.getUpdated());
		dto.setNumberOfPlayers(entity.getNumberOfPlayers());
		return dto;
	}

}
