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

	void setPositionId(PlayerPosition positionId);

	PlayerPosition getPositionId();

	void setUserAccountId(IUserAccount userAccountId);

	IUserAccount getUserAccountId();

	void setGameId(IGame gameId);

	IGame getGameId();

}
