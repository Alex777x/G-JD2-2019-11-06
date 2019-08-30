package by.itacademy.aalexandrov.poker.dao.api.entity.table;

import java.util.Date;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.GameStatus;

public interface IGame extends IBaseEntity {

	@Override
	String toString();

	void setBank(double bank);

	double getBank();

	void setState(GameStatus state);

	GameStatus getState();

	void setActivePlayerId(int activePlayerId);

	int getActivePlayerId();

	void setTimestampEndStep(Date timestampEndStep);

	Date getTimestampEndStep();

}
