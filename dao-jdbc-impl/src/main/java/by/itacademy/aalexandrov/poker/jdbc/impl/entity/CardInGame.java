package by.itacademy.aalexandrov.poker.jdbc.impl.entity;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.CardStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICard;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICardInGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;

public class CardInGame extends BaseEntity implements ICardInGame {

	private ICard cardId;
	private IGame gameId;
	private IPlayer playerId;
	private CardStatus cardStatus;

	@Override
	public ICard getCardId() {
		return cardId;
	}

	@Override
	public void setCardId(ICard cardId) {
		this.cardId = cardId;
	}

	@Override
	public IGame getGameId() {
		return gameId;
	}

	@Override
	public void setGameId(IGame gameId) {
		this.gameId = gameId;
	}

	@Override
	public IPlayer getPlayerId() {
		return playerId;
	}

	@Override
	public void setPlayerId(IPlayer playerId) {
		this.playerId = playerId;
	}

	@Override
	public CardStatus getCardStatus() {
		return cardStatus;
	}

	@Override
	public void setCardStatus(CardStatus cardStatus) {
		this.cardStatus = cardStatus;
	}

	@Override
	public String toString() {
		return "CardInGame [cardId=" + cardId + ", gameId=" + gameId + ", playerId=" + playerId + ", cardStatus="
				+ cardStatus + "]";
	}

}
