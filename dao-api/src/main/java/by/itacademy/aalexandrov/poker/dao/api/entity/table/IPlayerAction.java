package by.itacademy.aalexandrov.poker.dao.api.entity.table;

public interface IPlayerAction extends IBaseEntity {

	String toString();

	void setAllIn(int allIn);

	int getAllIn();

	void setCheck(boolean check);

	boolean isCheck();

	void setFold(boolean fold);

	boolean isFold();

	void setRaise(int raise);

	int getRaise();

	void setCall(int call);

	int getCall();

	void setBet(int bet);

	int getBet();

	void setPlayerId(IPlayer playerId);

	IPlayer getPlayerId();

}
