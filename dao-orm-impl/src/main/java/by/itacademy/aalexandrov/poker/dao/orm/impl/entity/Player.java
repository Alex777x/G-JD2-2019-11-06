package by.itacademy.aalexandrov.poker.dao.orm.impl.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Transient;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerPosition;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;

@Entity
public class Player extends BaseEntity implements IPlayer {

	@Transient
	private IGame game;

	@Transient
	private IUserAccount userAccount;

	@Column
	private PlayerPosition position;

	@Column(name = "in_game")
	private boolean inGame;

	@Column
	@Enumerated(EnumType.STRING)
	private PlayerStatus state;

	@Column
	private double stack;

	@Transient
	private String upperCaseName;

	public String getUpperCaseName() {
		return upperCaseName;
	}

	public void setUpperCaseName(String upperCaseName) {
		this.upperCaseName = upperCaseName;
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
	public IUserAccount getUserAccount() {
		return userAccount;
	}

	@Override
	public void setUserAccount(IUserAccount userAccount) {
		this.userAccount = userAccount;
	}

	@Override
	public PlayerPosition getPosition() {
		return position;
	}

	@Override
	public void setPosition(PlayerPosition position) {
		this.position = position;
	}

	@Override
	public boolean isInGame() {
		return inGame;
	}

	@Override
	public void setInGame(boolean inGame) {
		this.inGame = inGame;
	}

	@Override
	public PlayerStatus getState() {
		return state;
	}

	@Override
	public void setState(PlayerStatus state) {
		this.state = state;
	}

	@Override
	public double getStack() {
		return stack;
	}

	@Override
	public void setStack(double stack) {
		this.stack = stack;
	}

	@Override
	public String toString() {
		return "Player [game=" + game + ", userAccount=" + userAccount + ", position=" + position + ", inGame=" + inGame
				+ ", state=" + state + ", stack=" + stack + "]";
	}

}
