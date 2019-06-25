package by.itacademy.aalexandrov.poker.jdbc.impl.entity;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IBlackjackAction;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IBlackjackPlayerCard;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICard;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;

public class BlackjackPlayerCard extends BaseEntity implements IBlackjackPlayerCard {

	private IPlayer playerId;
	private ICard cardId;
	private IBlackjackAction blackjackActionId;
	private double stack;

	@Override
	public IPlayer getPlayerId() {
		return playerId;
	}

	@Override
	public void setPlayerId(IPlayer playerId) {
		this.playerId = playerId;
	}

	@Override
	public ICard getCardId() {
		return cardId;
	}

	@Override
	public void setCardId(ICard cardId) {
		this.cardId = cardId;
	}

	@Override
	public IBlackjackAction getBlackjackActionId() {
		return blackjackActionId;
	}

	@Override
	public void setBlackjackActionId(IBlackjackAction blackjackActionId) {
		this.blackjackActionId = blackjackActionId;
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
		return "BlackjackPlayerCard [playerId=" + playerId + ", cardId=" + cardId + ", blackjackActionId="
				+ blackjackActionId + ", stack=" + stack + "]";
	}

}
