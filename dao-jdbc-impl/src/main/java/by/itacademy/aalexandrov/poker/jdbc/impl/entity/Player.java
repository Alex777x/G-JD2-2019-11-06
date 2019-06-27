package by.itacademy.aalexandrov.poker.jdbc.impl.entity;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerPosition;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;

public class Player extends BaseEntity implements IPlayer {

	private PlayerPosition positionId;
	private PlayerCard playerCardId;
	private PlayerAction playerActionId;
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
	public PlayerCard getPlayerCardId() {
		return playerCardId;
	}

	@Override
	public void setPlayerCardId(PlayerCard playerCardId) {
		this.playerCardId = playerCardId;
	}

	@Override
	public PlayerAction getPlayerActionId() {
		return playerActionId;
	}

	@Override
	public void setPlayerActionId(PlayerAction playerActionId) {
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
