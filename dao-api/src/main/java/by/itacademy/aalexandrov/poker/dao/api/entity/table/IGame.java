package by.itacademy.aalexandrov.poker.dao.api.entity.table;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.GameStatus;

public interface IGame extends IBaseEntity {

	void setChatId(IChat chatId);

	IChat getChatId();

	void setBank(double bank);

	double getBank();

	void setPokerBoardId(IPokerBoard pokerBoardId);

	IPokerBoard getPokerBoardId();

	void setNexStepPerformerId(IUserAccount nexStepPerformerId);

	IUserAccount getNexStepPerformerId();

	void setWinnerId(IUserAccount winnerId);

	IUserAccount getWinnerId();

	void setGameStatus(GameStatus gameStatus);

	GameStatus getGameStatus();

}
