package by.itacademy.aalexandrov.poker.web.converter;

import java.util.function.Function;

import org.springframework.stereotype.Component;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayerAction;
import by.itacademy.aalexandrov.poker.web.dto.PlayerActionDTO;

@Component
public class PlayerActionToDTOConverter implements Function<IPlayerAction, PlayerActionDTO> {

	@Override
	public PlayerActionDTO apply(IPlayerAction entity) {
		PlayerActionDTO dto = new PlayerActionDTO();
		dto.setId(entity.getId());
		dto.setPlayer(entity.getPlayer());
		dto.setBet(entity.getBet());
		dto.setCall(entity.getCall());
		dto.setRaise(entity.getRaise());
		dto.setFold(entity.isFold());
		dto.setCheck(entity.isCheck());
		dto.setAllIn(entity.getAllIn());
		dto.setCreated(entity.getCreated());
		dto.setUpdated(entity.getUpdated());
		return dto;
	}

}
