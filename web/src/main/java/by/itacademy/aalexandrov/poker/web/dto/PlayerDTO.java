package by.itacademy.aalexandrov.poker.web.dto;

import java.util.Date;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerPosition;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;

public class PlayerDTO {

	private Integer id;
	private IGame game;
	private IUserAccount userAccount;
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

	public IGame getGame() {
		return game;
	}

	public void setGame(IGame game) {
		this.game = game;
	}

	public IUserAccount getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(IUserAccount userAccount) {
		this.userAccount = userAccount;
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
