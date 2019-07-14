package by.itacademy.aalexandrov.poker.web.converter;

import java.util.function.Function;

import org.springframework.stereotype.Component;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICardInGame;
import by.itacademy.aalexandrov.poker.web.dto.CardInGameDTO;

@Component
public class CardInGameToDTOConverter implements Function<ICardInGame, CardInGameDTO> {

	@Override
	public CardInGameDTO apply(ICardInGame entity) {
		CardInGameDTO dto = new CardInGameDTO();
		dto.setId(entity.getId());
		dto.setCard(entity.getCard());
		dto.setGame(entity.getGame());
		dto.setPlayer(entity.getPlayer());
		dto.setCardStatus(entity.getCardStatus());
		dto.setCreated(entity.getCreated());
		dto.setUpdated(entity.getCreated());
		return dto;
	}

}
