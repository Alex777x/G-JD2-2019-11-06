package by.itacademy.aalexandrov.poker.web.converter;

import java.util.function.Function;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayerAction;
import by.itacademy.aalexandrov.poker.service.IPlayerActionService;
import by.itacademy.aalexandrov.poker.service.IPlayerService;
import by.itacademy.aalexandrov.poker.web.dto.PlayerActionDTO;

@Component
public class PlayerActionFromDTOConverter implements Function<PlayerActionDTO, IPlayerAction> {

	@Autowired
	private IPlayerActionService playerActionService;

	@Autowired
	private IPlayerService playerService;

	@Override
	public IPlayerAction apply(PlayerActionDTO dto) {
		IPlayerAction entity = playerActionService.createEntity();
		entity.setId(dto.getId());

		IPlayer player = playerService.createEntity();
		player.setId(dto.getPlayer());
		entity.setPlayer(player);

		entity.setBet(dto.getBet());
		entity.setCall(dto.getCall());
		entity.setRaise(dto.getRaise());
		entity.setFold(dto.isFold());
		entity.setCheck(dto.isCheck());
		entity.setAllIn(dto.getAllIn());
		return entity;
	}

}
