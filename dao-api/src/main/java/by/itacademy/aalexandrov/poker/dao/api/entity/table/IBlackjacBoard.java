package by.itacademy.aalexandrov.poker.dao.api.entity.table;

public interface IBlackjacBoard extends IBaseEntity {

	void setCardId(ICard cardId);

	ICard getCardId();

	void setGameId(IGame gameId);

	IGame getGameId();

}
