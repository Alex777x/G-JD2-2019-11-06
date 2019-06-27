package by.itacademy.aalexandrov.poker.jdbc.impl.entity;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerPosition;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayerAction;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayerCard;

public class Player extends BaseEntity implements IPlayer {

	private PlayerPosition positionId;
	private IPlayerCard playerCardId;
	private IPlayerAction playerActionId;
	private boolean inGame;
	private PlayerStatus state;
	private double stack;

	@Override
	public PlayerPosition getPositionId() {
		return positionId;
	}

	@Override
	public void setPositionId(PlayerPosition positionId) {
		this.positionId = positionId;
	}

	@Override
	public IPlayerCard getPlayerCardId() {
		return playerCardId;
	}

	@Override
	public void setPlayerCardId(IPlayerCard playerCardId) {
		this.playerCardId = playerCardId;
	}

	@Override
	public IPlayerAction getPlayerActionId() {
		return playerActionId;
	}

	@Override
	public void setPlayerActionId(IPlayerAction playerActionId) {
		this.playerActionId = playerActionId;
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
		return "Player [positionId=" + positionId + ", playerCardId=" + playerCardId + ", playerActionId="
				+ playerActionId + ", inGame=" + inGame + ", state=" + state + ", stack=" + stack + "]";
	}

}
