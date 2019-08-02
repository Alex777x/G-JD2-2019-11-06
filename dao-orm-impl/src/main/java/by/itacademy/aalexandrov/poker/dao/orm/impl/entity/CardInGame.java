package by.itacademy.aalexandrov.poker.dao.orm.impl.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Transient;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.CardStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICard;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICardInGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;

@Entity
public class CardInGame extends BaseEntity implements ICardInGame {

	@Transient
	private ICard card;

	@Transient
	private IGame game;

	@Transient
	private IPlayer player;

	@Column(name = "card_state")
	@Enumerated(EnumType.STRING)
	private CardStatus cardStatus;

	@Transient
	private String upperCaseName;

	public String getUpperCaseName() {
		return upperCaseName;
	}

	public void setUpperCaseName(String upperCaseName) {
		this.upperCaseName = upperCaseName;
	}

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
