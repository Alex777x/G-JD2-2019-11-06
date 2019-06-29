package by.itacademy.aalexandrov.poker.jdbc.impl.entity;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerPosition;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;

public class Player extends BaseEntity implements IPlayer {

	private IGame gameId;
	private IUserAccount userAccountId;
	private PlayerPosition positionId;
	private boolean inGame;
	private PlayerStatus state;
	private double stack;

	@Override
	public IGame getGameId() {
		return gameId;
	}

	@Override
	public void setGameId(IGame gameId) {
		this.gameId = gameId;
	}

	@Override
	public IUserAccount getUserAccountId() {
		return userAccountId;
	}

	@Override
	public void setUserAccountId(IUserAccount userAccountId) {
		this.userAccountId = userAccountId;
	}

	@Override
	public PlayerPosition getPositionId() {
		return positionId;
	}

	@Override
	public void setPositionId(PlayerPosition positionId) {
		this.positionId = positionId;
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
		return "Player [gameId=" + gameId + ", userAccountId=" + userAccountId + ", positionId=" + positionId
				+ ", inGame=" + inGame + ", state=" + state + ", stack=" + stack + "]";
	}

}
