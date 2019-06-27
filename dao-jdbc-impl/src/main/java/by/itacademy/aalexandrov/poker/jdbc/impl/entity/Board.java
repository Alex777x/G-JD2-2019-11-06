package by.itacademy.aalexandrov.poker.jdbc.impl.entity;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICard;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IBoard;

public class Board extends BaseEntity implements IBoard {

	private ICard flopCard1Id;
	private ICard flopCard2Id;
	private ICard flopCard3Id;
	private ICard turnCardId;
	private ICard riverCardId;

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
	public String toString() {
		return "Board [flopCard1Id=" + flopCard1Id + ", flopCard2Id=" + flopCard2Id + ", flopCard3Id=" + flopCard3Id
				+ ", turnCardId=" + turnCardId + ", riverCardId=" + riverCardId + "]";
	}

}
