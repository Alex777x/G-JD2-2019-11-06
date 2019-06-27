package by.itacademy.aalexandrov.poker.dao.api.entity.table;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.GameStatus;

public interface IGame extends IBaseEntity {

	void setBank(double bank);

	double getBank();

	void setState(GameStatus state);

	GameStatus getState();

	void setBoardId(IBoard boardId);

	IBoard getBoardId();

	void setPlayerId(IPlayer playerId);

	IPlayer getPlayerId();

	void setChatId(IChat chatId);

	IChat getChatId();

}
