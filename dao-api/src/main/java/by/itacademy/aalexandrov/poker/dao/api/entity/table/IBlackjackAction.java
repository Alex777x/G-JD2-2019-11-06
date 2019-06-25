package by.itacademy.aalexandrov.poker.dao.api.entity.table;

public interface IBlackjackAction extends IBaseEntity {

	void setStop(boolean stop);

	boolean isStop();

	void setHitMe(boolean hitMe);

	boolean isHitMe();

	void setBet(int bet);

	int getBet();

}
