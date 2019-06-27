package by.itacademy.aalexandrov.poker.jdbc.impl.entity;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerPosition;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayerAction;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayerCard;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;

public class Player extends BaseEntity implements IPlayer {

	private IUserAccount userAccountId;
	private PlayerPosition positionId;
	private IPlayerCard playerCardId;
	private IPlayerAction playerActionId;
	private boolean inGame;
	private PlayerStatus state;
	private double stack;

	@Override
	public IUserAccount getUserAccountId() {
		return userAccountId;
	}

	@Override
	public void setUserAccountId(IUserAccount userAccountId) {
		this.userAccountId = userAccountId;
	}

	public PlayerPosition getPositionId() {
		return positionId;
	}

	public void setPositionId(PlayerPosition positionId) {
		this.positionId = positionId;
	}

	public IPlayerCard getPlayerCardId() {
		return playerCardId;
	}

	public void setPlayerCardId(IPlayerCard playerCardId) {
		this.playerCardId = playerCardId;
	}

	public IPlayerAction getPlayerActionId() {
		return playerActionId;
	}

	public void setPlayerActionId(IPlayerAction playerActionId) {
		this.playerActionId = playerActionId;
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

	@Override
	public String toString() {
		return "Player [userAccountId=" + userAccountId + ", positionId=" + positionId + ", playerCardId="
				+ playerCardId + ", playerActionId=" + playerActionId + ", inGame=" + inGame + ", state=" + state
				+ ", stack=" + stack + "]";
	}

}
