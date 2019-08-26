package by.itacademy.aalexandrov.poker.dao.api.entity.table;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.GameStatus;

public interface IGame extends IBaseEntity {

	@Override
	String toString();

	void setBank(double bank);

	double getBank();

	void setState(GameStatus state);

	GameStatus getState();

	void setNumberOfPlayers(int numberOfPlayers);

	int getNumberOfPlayers();

}
