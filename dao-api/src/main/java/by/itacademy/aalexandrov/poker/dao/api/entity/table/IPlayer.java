package by.itacademy.aalexandrov.poker.dao.api.entity.table;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerPosition;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerStatus;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.PlayerCard;

public interface IPlayer extends IBaseEntity {

	void setStack(double stack);

	double getStack();

	void setState(PlayerStatus state);

	PlayerStatus getState();

	void setInGame(boolean inGame);

	boolean isInGame();

	void setPlayerActionId(PlayerAction playerActionId);

	PlayerAction getPlayerActionId();

	void setPlayerCardId(PlayerCard playerCardId);

	PlayerCard getPlayerCardId();

	void setPositionId(PlayerPosition positionId);

	PlayerPosition getPositionId();


}
