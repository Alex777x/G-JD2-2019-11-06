package by.itacademy.aalexandrov.poker.web.dto;

import java.util.Date;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.CardStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICard;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;

public class CardInGameDTO {

	private Integer id;
	private ICard card;
	private IGame game;
	private IPlayer player;
	private CardStatus cardStatus;
	private Date created;
	private Date updated;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public ICard getCard() {
		return card;
	}

	public void setCard(ICard card) {
		this.card = card;
	}

	public IGame getGame() {
		return game;
	}

	public void setGame(IGame game) {
		this.game = game;
	}

	public IPlayer getPlayer() {
		return player;
	}

	public void setPlayer(IPlayer player) {
		this.player = player;
	}

	public CardStatus getCardStatus() {
		return cardStatus;
	}

	public void setCardStatus(CardStatus cardStatus) {
		this.cardStatus = cardStatus;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public Date getUpdated() {
		return updated;
	}

	public void setUpdated(Date updated) {
		this.updated = updated;
	}

}
