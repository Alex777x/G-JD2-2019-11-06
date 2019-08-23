package by.itacademy.aalexandrov.poker.dao.orm.impl.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Transient;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.GameStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;

@Entity
public class Game extends BaseEntity implements IGame {

	@Column
	@Enumerated(EnumType.STRING)
	private GameStatus state;

	@Column
	private double bank;

	@Column
	private boolean position1;

	@Column
	private boolean position2;

	@Column
	private boolean position3;

	@Column
	private boolean position4;

	@Column
	private boolean position5;

	@Column
	private boolean position6;

	@Column
	private boolean position7;

	@Column
	private boolean position8;

	@Column
	private boolean position9;

	@Column
	private boolean position10;

	@Column
	private int numberOfPlayers;

	@Transient
	private String upperCaseName;

	@Override
	public int getNumberOfPlayers() {
		return numberOfPlayers;
	}

	@Override
	public void setNumberOfPlayers(int numberOfPlayers) {
		this.numberOfPlayers = numberOfPlayers;
	}

	public String getUpperCaseName() {
		return upperCaseName;
	}

	public void setUpperCaseName(String upperCaseName) {
		this.upperCaseName = upperCaseName;
	}

	@Override
	public boolean isPosition1() {
		return position1;
	}

	@Override
	public void setPosition1(boolean position1) {
		this.position1 = position1;
	}

	@Override
	public boolean isPosition2() {
		return position2;
	}

	@Override
	public void setPosition2(boolean position2) {
		this.position2 = position2;
	}

	@Override
	public boolean isPosition3() {
		return position3;
	}

	@Override
	public void setPosition3(boolean position3) {
		this.position3 = position3;
	}

	@Override
	public boolean isPosition4() {
		return position4;
	}

	@Override
	public void setPosition4(boolean position4) {
		this.position4 = position4;
	}

	@Override
	public boolean isPosition5() {
		return position5;
	}

	@Override
	public void setPosition5(boolean position5) {
		this.position5 = position5;
	}

	@Override
	public boolean isPosition6() {
		return position6;
	}

	@Override
	public void setPosition6(boolean position6) {
		this.position6 = position6;
	}

	@Override
	public boolean isPosition7() {
		return position7;
	}

	@Override
	public void setPosition7(boolean position7) {
		this.position7 = position7;
	}

	@Override
	public boolean isPosition8() {
		return position8;
	}

	@Override
	public void setPosition8(boolean position8) {
		this.position8 = position8;
	}

	@Override
	public boolean isPosition9() {
		return position9;
	}

	@Override
	public void setPosition9(boolean position9) {
		this.position9 = position9;
	}

	@Override
	public boolean isPosition10() {
		return position10;
	}

	@Override
	public void setPosition10(boolean position10) {
		this.position10 = position10;
	}

	@Override
	public GameStatus getState() {
		return state;
	}

	@Override
	public void setState(GameStatus state) {
		this.state = state;
	}

	@Override
	public double getBank() {
		return bank;
	}

	@Override
	public void setBank(double bank) {
		this.bank = bank;
	}

	@Override
	public String toString() {
		return "Game [state=" + state + ", bank=" + bank + "]";
	}

}
