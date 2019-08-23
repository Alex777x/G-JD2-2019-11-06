package by.itacademy.aalexandrov.poker.web.converter;

import java.util.function.Function;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.service.IGameService;
import by.itacademy.aalexandrov.poker.web.dto.GameDTO;

@Component
public class GameFromDTOConverter implements Function<GameDTO, IGame> {

	@Autowired
	private IGameService gameService;

	@Override
	public IGame apply(GameDTO dto) {
		IGame entity = gameService.createEntity();
		entity.setId(dto.getId());
		entity.setState(dto.getState());
		entity.setBank(dto.getBank());
		entity.setPosition1(dto.isPosition1());
		entity.setPosition2(dto.isPosition2());
		entity.setPosition3(dto.isPosition3());
		entity.setPosition4(dto.isPosition4());
		entity.setPosition5(dto.isPosition5());
		entity.setPosition6(dto.isPosition6());
		entity.setPosition7(dto.isPosition7());
		entity.setPosition8(dto.isPosition8());
		entity.setPosition9(dto.isPosition9());
		entity.setPosition10(dto.isPosition10());
		entity.setNumberOfPlayers(dto.getNumberOfPlayers());
		return entity;
	}

}
