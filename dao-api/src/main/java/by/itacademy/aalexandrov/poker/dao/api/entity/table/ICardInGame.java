package by.itacademy.aalexandrov.poker.dao.api.entity.table;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.CardStatus;

public interface ICardInGame extends IBaseEntity {

	String toString();

	void setCardStatus(CardStatus cardStatus);

	CardStatus getCardStatus();

	void setPlayerId(IPlayer playerId);

	IPlayer getPlayerId();

	void setGameId(IGame gameId);

	IGame getGameId();

	void setCardId(ICard cardId);

	ICard getCardId();

}
