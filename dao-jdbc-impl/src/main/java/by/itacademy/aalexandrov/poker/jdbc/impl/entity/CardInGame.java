package by.itacademy.aalexandrov.poker.jdbc.impl.entity;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.CardStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICard;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICardInGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;

public class CardInGame extends BaseEntity implements ICardInGame {

	private ICard card;
	private IGame game;
	private IPlayer player;
	private CardStatus cardStatus;

	@Override
	public ICard getCard() {
		return card;
	}

	@Override
	public void setCard(ICard card) {
		this.card = card;
	}

	@Override
	public IGame getGame() {
		return game;
	}

	@Override
	public void setGame(IGame game) {
		this.game = game;
	}

	@Override
	public IPlayer getPlayer() {
		return player;
	}

	@Override
	public void setPlayer(IPlayer player) {
		this.player = player;
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
		return "CardInGame [card=" + card + ", game=" + game + ", player=" + player + ", cardStatus=" + cardStatus
				+ "]";
	}

}
