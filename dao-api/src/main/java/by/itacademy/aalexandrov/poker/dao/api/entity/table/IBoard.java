package by.itacademy.aalexandrov.poker.dao.api.entity.table;

public interface IBoard extends IBaseEntity {

	void setRiverCardId(ICard riverCardId);

	ICard getRiverCardId();

	void setTurnCardId(ICard turnCardId);

	ICard getTurnCardId();

	void setFlopCard3Id(ICard flopCard3Id);

	ICard getFlopCard3Id();

	void setFlopCard2Id(ICard flopCard2Id);

	ICard getFlopCard2Id();

	void setFlopCard1Id(ICard flopCard1Id);

	ICard getFlopCard1Id();

}
