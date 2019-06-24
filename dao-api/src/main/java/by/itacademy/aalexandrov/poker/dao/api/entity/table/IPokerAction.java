package by.itacademy.aalexandrov.poker.dao.api.entity.table;

public interface IPokerAction extends IBaseEntity {

	void setBigBlind(boolean bigBlind);

	boolean isBigBlind();

	void setSmallBlind(boolean smallBlind);

	boolean isSmallBlind();

	void setVaBank(int vaBank);

	int getVaBank();

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



}
