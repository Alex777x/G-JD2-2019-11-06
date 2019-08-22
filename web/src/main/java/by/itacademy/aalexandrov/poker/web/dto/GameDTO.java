package by.itacademy.aalexandrov.poker.web.dto;

import java.util.Date;

import javax.validation.constraints.NotNull;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.GameStatus;

public class GameDTO {

	private Integer id;
	@NotNull
	private GameStatus state;
	@NotNull
	private double bank;
	private Date created;
	private Date updated;
	@NotNull
	private long plaersCount;
	@NotNull
	private boolean position1;
	@NotNull
	private boolean position2;
	@NotNull
	private boolean position3;
	@NotNull
	private boolean position4;
	@NotNull
	private boolean position5;
	@NotNull
	private boolean position6;
	@NotNull
	private boolean position7;
	@NotNull
	private boolean position8;
	@NotNull
	private boolean position9;
	@NotNull
	private boolean position10;

	public long getPlaersCount() {
		return plaersCount;
	}

	public void setPlaersCount(long plaersCount) {
		this.plaersCount = plaersCount;
	}

	public boolean isPosition1() {
		return position1;
	}

	public void setPosition1(boolean position1) {
		this.position1 = position1;
	}

	public boolean isPosition2() {
		return position2;
	}

	public void setPosition2(boolean position2) {
		this.position2 = position2;
	}

	public boolean isPosition3() {
		return position3;
	}

	public void setPosition3(boolean position3) {
		this.position3 = position3;
	}

	public boolean isPosition4() {
		return position4;
	}

	public void setPosition4(boolean position4) {
		this.position4 = position4;
	}

	public boolean isPosition5() {
		return position5;
	}

	public void setPosition5(boolean position5) {
		this.position5 = position5;
	}

	public boolean isPosition6() {
		return position6;
	}

	public void setPosition6(boolean position6) {
		this.position6 = position6;
	}

	public boolean isPosition7() {
		return position7;
	}

	public void setPosition7(boolean position7) {
		this.position7 = position7;
	}

	public boolean isPosition8() {
		return position8;
	}

	public void setPosition8(boolean position8) {
		this.position8 = position8;
	}

	public boolean isPosition9() {
		return position9;
	}

	public void setPosition9(boolean position9) {
		this.position9 = position9;
	}

	public boolean isPosition10() {
		return position10;
	}

	public void setPosition10(boolean position10) {
		this.position10 = position10;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public GameStatus getState() {
		return state;
	}

	public void setState(GameStatus state) {
		this.state = state;
	}

	public double getBank() {
		return bank;
	}

	public void setBank(double bank) {
		this.bank = bank;
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
