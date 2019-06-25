package by.itacademy.aalexandrov.poker.jdbc.impl.entity;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPokerAction;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;

public class Player extends BaseEntity implements IPlayer {

	private IUserAccount userAccountId;
	private IGame gameId;
	private boolean dealer;
	private double stack;
	private IPokerAction pokerActionId;

	@Override
	public IUserAccount getUserAccountId() {
		return userAccountId;
	}

	@Override
	public void setUserAccountId(IUserAccount userAccountId) {
		this.userAccountId = userAccountId;
	}

	@Override
	public IGame getGameId() {
		return gameId;
	}

	@Override
	public void setGameId(IGame gameId) {
		this.gameId = gameId;
	}

	@Override
	public boolean isDealer() {
		return dealer;
	}

	@Override
	public void setDealer(boolean dealer) {
		this.dealer = dealer;
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
	public IPokerAction getPokerActionId() {
		return pokerActionId;
	}

	@Override
	public void setPokerActionId(IPokerAction pokerActionId) {
		this.pokerActionId = pokerActionId;
	}

	@Override
	public String toString() {
		return "Player [userAccountId=" + userAccountId + ", gameId=" + gameId + ", dealer=" + dealer + ", stack="
				+ stack + ", pokerActionId=" + pokerActionId + "]";
	}

}
