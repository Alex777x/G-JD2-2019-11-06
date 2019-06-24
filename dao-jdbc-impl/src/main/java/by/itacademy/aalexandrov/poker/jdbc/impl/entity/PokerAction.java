package by.itacademy.aalexandrov.poker.jdbc.impl.entity;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPokerAction;

public class PokerAction extends BaseEntity implements IPokerAction {

	private int bet;
	private int call;
	private int raise;
	private boolean fold;
	private boolean check;
	private int vaBank;
	private boolean smallBlind;
	private boolean bigBlind;

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
	public int getVaBank() {
		return vaBank;
	}

	@Override
	public void setVaBank(int vaBank) {
		this.vaBank = vaBank;
	}

	@Override
	public boolean isSmallBlind() {
		return smallBlind;
	}

	@Override
	public void setSmallBlind(boolean smallBlind) {
		this.smallBlind = smallBlind;
	}

	@Override
	public boolean isBigBlind() {
		return bigBlind;
	}

	@Override
	public void setBigBlind(boolean bigBlind) {
		this.bigBlind = bigBlind;
	}

	@Override
	public String toString() {
		return "PokerAction [bet=" + bet + ", call=" + call + ", raise=" + raise + ", fold=" + fold + ", check=" + check
				+ ", vaBank=" + vaBank + ", smallBlind=" + smallBlind + ", bigBlind=" + bigBlind + "]";
	}

}
