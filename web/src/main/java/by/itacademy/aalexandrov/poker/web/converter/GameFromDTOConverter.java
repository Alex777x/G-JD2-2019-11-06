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
		entity.setNumberOfPlayers(dto.getNumberOfPlayers());
		return entity;
	}

}
