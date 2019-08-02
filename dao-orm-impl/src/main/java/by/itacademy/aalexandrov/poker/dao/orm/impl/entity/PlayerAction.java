package by.itacademy.aalexandrov.poker.dao.orm.impl.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Transient;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayerAction;

@Entity
public class PlayerAction extends BaseEntity implements IPlayerAction {

	@Transient
	private IPlayer player;

	@Column
	private int bet;

	@Column
	private int call;

	@Column
	private int raise;

	@Column
	private boolean fold;

	@Column(name = "check_check")
	private boolean check;

	@Column(name = "all_in")
	private int allIn;

	@Transient
	private String upperCaseName;

	public String getUpperCaseName() {
		return upperCaseName;
	}

	public void setUpperCaseName(String upperCaseName) {
		this.upperCaseName = upperCaseName;
	}

	@Override
	public IPlayer getPlayer() {
		return player;
	}

	@Override
	public void setPlayer(IPlayer player) {
		this.player = player;
	}

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
		return "PlayerAction [player=" + player + ", bet=" + bet + ", call=" + call + ", raise=" + raise + ", fold="
				+ fold + ", check=" + check + ", allIn=" + allIn + "]";
	}

}
