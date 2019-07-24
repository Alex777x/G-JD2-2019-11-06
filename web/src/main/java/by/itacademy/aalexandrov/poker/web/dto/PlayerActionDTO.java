package by.itacademy.aalexandrov.poker.web.dto;

import java.util.Date;

import javax.validation.constraints.NotNull;


public class PlayerActionDTO {

	private Integer id;
	@NotNull
	private Integer player;
	private int bet;
	private int call;
	private int raise;
	private boolean fold;
	private boolean check;
	private int allIn;
	private Date created;
	private Date updated;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getPlayer() {
		return player;
	}

	public void setPlayer(Integer player) {
		this.player = player;
	}

	public int getBet() {
		return bet;
	}

	public void setBet(int bet) {
		this.bet = bet;
	}

	public int getCall() {
		return call;
	}

	public void setCall(int call) {
		this.call = call;
	}

	public int getRaise() {
		return raise;
	}

	public void setRaise(int raise) {
		this.raise = raise;
	}

	public boolean isFold() {
		return fold;
	}

	public void setFold(boolean fold) {
		this.fold = fold;
	}

	public boolean isCheck() {
		return check;
	}

	public void setCheck(boolean check) {
		this.check = check;
	}

	public int getAllIn() {
		return allIn;
	}

	public void setAllIn(int allIn) {
		this.allIn = allIn;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public Date getUpdated() {
		return updated;
	}

	public void setUpdated(Date updated) {
		this.updated = updated;
	}

}
