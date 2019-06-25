package by.itacademy.aalexandrov.poker.dao.api.entity.table;

public interface IBlackjackPlayerCard extends IBaseEntity {

	void setStack(double stack);

	double getStack();

	void setBlackjackActionId(IBlackjackAction blackjackActionId);

	IBlackjackAction getBlackjackActionId();

	void setCardId(ICard cardId);

	ICard getCardId();

	void setPlayerId(IPlayer playerId);

	IPlayer getPlayerId();

}
