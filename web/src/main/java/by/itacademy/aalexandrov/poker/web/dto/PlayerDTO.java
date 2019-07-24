package by.itacademy.aalexandrov.poker.web.dto;

import java.util.Date;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerPosition;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerStatus;

public class PlayerDTO {

	private Integer id;
	private Integer gameId;
	private Integer userAccountId;
	private PlayerPosition position;
	private boolean inGame;
	private PlayerStatus state;
	private double stack;
	private Date created;
	private Date updated;

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
