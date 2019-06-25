package by.itacademy.aalexandrov.poker.jdbc.impl.entity;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICard;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPokerBoard;

public class PokerBoard extends BaseEntity implements IPokerBoard {

	private ICard flopCard1Id;
	private ICard flopCard2Id;
	private ICard flopCard3Id;
	private ICard turnCardId;
	private ICard riverCardId;
	private IGame gameId;

	@Override
	public ICard getFlopCard1Id() {
		return flopCard1Id;
	}

	@Override
	public void setFlopCard1Id(ICard flopCard1Id) {
		this.flopCard1Id = flopCard1Id;
	}

	@Override
	public ICard getFlopCard2Id() {
		return flopCard2Id;
	}

	@Override
	public void setFlopCard2Id(ICard flopCard2Id) {
		this.flopCard2Id = flopCard2Id;
	}

	@Override
	public ICard getFlopCard3Id() {
		return flopCard3Id;
	}

	@Override
	public void setFlopCard3Id(ICard flopCard3Id) {
		this.flopCard3Id = flopCard3Id;
	}

	@Override
	public ICard getTurnCardId() {
		return turnCardId;
	}

	@Override
	public void setTurnCardId(ICard turnCardId) {
		this.turnCardId = turnCardId;
	}

	@Override
	public ICard getRiverCardId() {
		return riverCardId;
	}

	@Override
	public void setRiverCardId(ICard riverCardId) {
		this.riverCardId = riverCardId;
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
	public String toString() {
		return "PokerBoard [flopCard1Id=" + flopCard1Id + ", flopCard2Id=" + flopCard2Id + ", flopCard3Id="
				+ flopCard3Id + ", turnCardId=" + turnCardId + ", riverCardId=" + riverCardId + ", gameId=" + gameId
				+ "]";
	}

}
