package by.itacademy.aalexandrov.poker.jdbc.impl.entity;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayerAction;

public class PlayerAction extends BaseEntity implements IPlayerAction {

	private int bet;
	private int call;
	private int raise;
	private boolean fold;
	private boolean check;
	private int allIn;

	@Override
	public int getBet() {
		return bet;
	}

	@Override
	public void setBet(int bet) {
		this.bet = bet;
	}

	@Override
	public int getCall() {
		return call;
	}

	@Override
	public void setCall(int call) {
		this.call = call;
	}

	@Override
	public int getRaise() {
		return raise;
	}

	@Override
	public void setRaise(int raise) {
		this.raise = raise;
	}

	@Override
	public boolean isFold() {
		return fold;
	}

	@Override
	public void setFold(boolean fold) {
		this.fold = fold;
	}

	@Override
	public boolean isCheck() {
		return check;
	}

	@Override
	public void setCheck(boolean check) {
		this.check = check;
	}

	@Override
	public int getAllIn() {
		return allIn;
	}

	@Override
	public void setAllIn(int allIn) {
		this.allIn = allIn;
	}

	@Override
	public String toString() {
		return "Action [bet=" + bet + ", call=" + call + ", raise=" + raise + ", fold=" + fold + ", check=" + check
				+ ", allIn=" + allIn + "]";
	}

}
