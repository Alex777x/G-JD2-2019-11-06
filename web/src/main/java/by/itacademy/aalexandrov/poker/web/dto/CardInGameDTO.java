package by.itacademy.aalexandrov.poker.web.dto;

import java.util.Date;

import javax.validation.constraints.NotNull;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.CardStatus;

public class CardInGameDTO {

	private Integer id;
	@NotNull
	private Integer card;
	@NotNull
	private Integer game;
	@NotNull
	private Integer player;
	@NotNull
	private CardStatus cardStatus;
	private Date created;
	private Date updated;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getCard() {
		return card;
	}

	public void setCard(Integer card) {
		this.card = card;
	}

	public Integer getGame() {
		return game;
	}

	public void setGame(Integer game) {
		this.game = game;
	}

	public Integer getPlayer() {
		return player;
	}

	public void setPlayer(Integer player) {
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
