package by.itacademy.aalexandrov.poker.dao.api.entity.table;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.CardStatus;

public interface ICardInGame extends IBaseEntity {

	String toString();

	void setCardStatus(CardStatus cardStatus);

	CardStatus getCardStatus();

	void setPlayer(IPlayer player);

	IPlayer getPlayer();

	void setGame(IGame game);

	IGame getGame();

	void setCard(ICard card);

	ICard getCard();

}
