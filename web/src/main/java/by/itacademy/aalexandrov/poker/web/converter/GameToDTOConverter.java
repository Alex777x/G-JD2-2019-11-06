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
		dto.setPosition1(entity.isPosition1());
		dto.setPosition2(entity.isPosition2());
		dto.setPosition3(entity.isPosition3());
		dto.setPosition4(entity.isPosition4());
		dto.setPosition5(entity.isPosition5());
		dto.setPosition6(entity.isPosition6());
		dto.setPosition7(entity.isPosition7());
		dto.setPosition8(entity.isPosition8());
		dto.setPosition9(entity.isPosition9());
		dto.setPosition10(entity.isPosition10());
		dto.setNumberOfPlayers(entity.getNumberOfPlayers());
		return dto;
	}

}
