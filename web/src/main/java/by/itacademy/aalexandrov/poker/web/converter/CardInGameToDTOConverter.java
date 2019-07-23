package by.itacademy.aalexandrov.poker.web.converter;

import java.util.function.Function;

import org.springframework.stereotype.Component;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICard;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICardInGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.web.dto.CardInGameDTO;

@Component
public class CardInGameToDTOConverter implements Function<ICardInGame, CardInGameDTO> {

	@Override
	public CardInGameDTO apply(ICardInGame entity) {
		CardInGameDTO dto = new CardInGameDTO();
		dto.setId(entity.getId());
		
		ICard card = entity.getCard();
		if (card != null) {
			dto.setCard(card.getId());
		}
		
		IGame game = entity.getGame();
		if (game != null) {
			dto.setGame(game.getId());
		}
		
		IPlayer player = entity.getPlayer();
		if(player != null) {
			dto.setPlayer(player.getId());
		}
		
		dto.setCardStatus(entity.getCardStatus());
		dto.setCreated(entity.getCreated());
		dto.setUpdated(entity.getCreated());
		return dto;
	}

}
