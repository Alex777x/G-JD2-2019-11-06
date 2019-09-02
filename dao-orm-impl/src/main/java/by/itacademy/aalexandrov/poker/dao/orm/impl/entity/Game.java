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
	private int activePlayerId;

	@Column
	private long timestampEndStep;

	@Transient
	private String upperCaseName;

	@Override
	public long getTimestampEndStep() {
		return timestampEndStep;
	}

	@Override
	public void setTimestampEndStep(long timestampEndStep) {
		this.timestampEndStep = timestampEndStep;
	}

	@Override
	public int getActivePlayerId() {
		return activePlayerId;
	}

	@Override
	public void setActivePlayerId(int activePlayerId) {
		this.activePlayerId = activePlayerId;
	}

	public String getUpperCaseName() {
		return upperCaseName;
	}

	public void setUpperCaseName(String upperCaseName) {
		this.upperCaseName = upperCaseName;
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
