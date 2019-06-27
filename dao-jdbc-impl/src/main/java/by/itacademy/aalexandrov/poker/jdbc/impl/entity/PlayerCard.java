package by.itacademy.aalexandrov.poker.jdbc.impl.entity;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICard;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayerCard;

public class PlayerCard extends BaseEntity implements IPlayerCard {

	private ICard card1Id;
	private ICard card2Id;
	private boolean cardState;

	@Override
	public ICard getCard1Id() {
		return card1Id;
	}

	@Override
	public void setCard1Id(ICard card1Id) {
		this.card1Id = card1Id;
	}

	@Override
	public ICard getCard2Id() {
		return card2Id;
	}

	@Override
	public void setCard2Id(ICard card2Id) {
		this.card2Id = card2Id;
	}

	@Override
	public boolean isCardState() {
		return cardState;
	}

	@Override
	public void setCardState(boolean cardState) {
		this.cardState = cardState;
	}

	@Override
	public String toString() {
		return "PlayerCard [card1Id=" + card1Id + ", card2Id=" + card2Id + ", cardState=" + cardState + "]";
	}

}
