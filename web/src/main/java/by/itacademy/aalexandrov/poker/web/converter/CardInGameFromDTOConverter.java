package by.itacademy.aalexandrov.poker.web.converter;

import java.util.function.Function;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICard;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICardInGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.service.ICardInGameService;
import by.itacademy.aalexandrov.poker.service.ICardService;
import by.itacademy.aalexandrov.poker.service.IGameService;
import by.itacademy.aalexandrov.poker.service.IPlayerService;
import by.itacademy.aalexandrov.poker.web.dto.CardInGameDTO;

@Component
public class CardInGameFromDTOConverter implements Function<CardInGameDTO, ICardInGame> {

	@Autowired
	private ICardInGameService cardInGameService;

	@Autowired
	private ICardService cardService;

	@Autowired
	private IGameService gameService;

	@Autowired
	private IPlayerService playerService;

	@Override
	public ICardInGame apply(CardInGameDTO dto) {
		ICardInGame entity = cardInGameService.createEntity();

		ICard card = cardService.createEntity();
		card.setId(dto.getCard());
		entity.setCard(card);

		IGame game = gameService.createEntity();
		game.setId(dto.getGame());
		entity.setGame(game);

		IPlayer player = playerService.createEntity();
		player.setId(dto.getPlayer());
		entity.setPlayer(player);

		entity.setCardStatus(dto.getCardStatus());
		return entity;
	}

}
