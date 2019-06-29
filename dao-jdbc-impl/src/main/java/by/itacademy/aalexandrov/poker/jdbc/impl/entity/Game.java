package by.itacademy.aalexandrov.poker.jdbc.impl.entity;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.GameStatus;

public class Game extends BaseEntity implements IGame {

	private GameStatus state;
	private double bank;

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
