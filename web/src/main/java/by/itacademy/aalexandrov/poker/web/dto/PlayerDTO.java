package by.itacademy.aalexandrov.poker.web.dto;

import java.util.Date;

import javax.validation.constraints.NotNull;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.CardsCombination;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerPosition;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerStatus;

public class PlayerDTO {

	private Integer id;
	@NotNull
	private Integer gameId;
	@NotNull
	private Integer userAccountId;
	private PlayerPosition position;
	@NotNull
	private boolean inGame;
	private PlayerStatus state;
	private double stack;
	private Date created;
	private Date updated;
	private String nick;
	private String card1;
	private String card2;
	private boolean active;
	private Integer curentBet;
	private CardsCombination curentHand;

	public CardsCombination getCurentHand() {
		return curentHand;
	}

	public void setCurentHand(CardsCombination curentHand) {
		this.curentHand = curentHand;
	}

	public Integer getCurentBet() {
		return curentBet;
	}

	public void setCurentBet(Integer curentBet) {
		this.curentBet = curentBet;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public String getCard1() {
		return card1;
	}

	public void setCard1(String card1) {
		this.card1 = card1;
	}

	public String getCard2() {
		return card2;
	}

	public void setCard2(String card2) {
		this.card2 = card2;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getGameId() {
		return gameId;
	}

	public void setGameId(Integer gameId) {
		this.gameId = gameId;
	}

	public Integer getUserAccountId() {
		return userAccountId;
	}

	public void setUserAccountId(Integer userAccountId) {
		this.userAccountId = userAccountId;
	}

	public PlayerPosition getPosition() {
		return position;
	}

	public void setPosition(PlayerPosition position) {
		this.position = position;
	}

	public boolean isInGame() {
		return inGame;
	}

	public void setInGame(boolean inGame) {
		this.inGame = inGame;
	}

	public PlayerStatus getState() {
		return state;
	}

	public void setState(PlayerStatus state) {
		this.state = state;
	}

	public double getStack() {
		return stack;
	}

	public void setStack(double stack) {
		this.stack = stack;
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
