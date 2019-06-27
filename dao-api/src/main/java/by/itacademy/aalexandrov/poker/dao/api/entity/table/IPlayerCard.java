package by.itacademy.aalexandrov.poker.dao.api.entity.table;

public interface IPlayerCard extends IBaseEntity {

	void setCardState(boolean cardState);

	boolean isCardState();

	void setCard2Id(ICard card2Id);

	ICard getCard2Id();

	void setCard1Id(ICard card1Id);

	ICard getCard1Id();

}
