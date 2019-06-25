package by.itacademy.aalexandrov.poker.dao.api.entity.table;

public interface IPlayer extends IBaseEntity {

	void setPokerActionId(IPokerAction pokerActionId);

	IPokerAction getPokerActionId();

	void setStack(double stack);

	double getStack();

	void setDealer(boolean dealer);

	boolean isDealer();

	void setGameId(IGame gameId);

	IGame getGameId();

	void setUserAccountId(IUserAccount userAccountId);

	IUserAccount getUserAccountId();

}
