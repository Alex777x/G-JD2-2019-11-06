package by.itacademy.aalexandrov.poker.jdbc.impl.entity;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerPosition;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;

public class Player extends BaseEntity implements IPlayer {

	private IGame game;
	private IUserAccount userAccount;
	private PlayerPosition position;
	private boolean inGame;
	private PlayerStatus state;
	private double stack;

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
