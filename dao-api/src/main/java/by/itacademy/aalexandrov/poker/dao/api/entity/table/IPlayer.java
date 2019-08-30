package by.itacademy.aalexandrov.poker.dao.api.entity.table;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerPosition;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerStatus;

public interface IPlayer extends IBaseEntity {

	void setStack(double stack);

	double getStack();

	void setState(PlayerStatus state);

	PlayerStatus getState();

	void setInGame(boolean inGame);

	boolean isInGame();

	void setPosition(PlayerPosition position);

	PlayerPosition getPosition();

	void setUserAccount(IUserAccount userAccount);

	IUserAccount getUserAccount();

	void setGame(IGame game);

	IGame getGame();

	void setCard2(String card2);

	String getCard2();

	void setCard1(String card1);

	String getCard1();

}
