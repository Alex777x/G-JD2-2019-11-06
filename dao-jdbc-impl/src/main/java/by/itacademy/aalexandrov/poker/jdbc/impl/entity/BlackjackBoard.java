package by.itacademy.aalexandrov.poker.jdbc.impl.entity;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IBlackjacBoard;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICard;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;

public class BlackjackBoard extends BaseEntity implements IBlackjacBoard {

	private IGame gameId;
	private ICard cardId;

	@Override
	public IGame getGameId() {
		return gameId;
	}

	@Override
	public void setGameId(IGame gameId) {
		this.gameId = gameId;
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
	public String toString() {
		return "BlackjackBoard [gameId=" + gameId + ", cardId=" + cardId + "]";
	}

}
