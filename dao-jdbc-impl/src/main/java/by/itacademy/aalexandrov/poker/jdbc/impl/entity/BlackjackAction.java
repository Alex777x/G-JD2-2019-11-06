package by.itacademy.aalexandrov.poker.jdbc.impl.entity;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IBlackjackAction;

public class BlackjackAction extends BaseEntity implements IBlackjackAction {

	private int bet;
	private boolean hitMe;
	private boolean stop;

	@Override
	public int getBet() {
		return bet;
	}

	@Override
	public void setBet(int bet) {
		this.bet = bet;
	}

	@Override
	public boolean isHitMe() {
		return hitMe;
	}

	@Override
	public void setHitMe(boolean hitMe) {
		this.hitMe = hitMe;
	}

	@Override
	public boolean isStop() {
		return stop;
	}

	@Override
	public void setStop(boolean stop) {
		this.stop = stop;
	}

	@Override
	public String toString() {
		return "BlackjackAction [bet=" + bet + ", hitMe=" + hitMe + ", stop=" + stop + "]";
	}

}
