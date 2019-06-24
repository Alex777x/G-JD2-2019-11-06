package by.itacademy.aalexandrov.poker.jdbc.impl.entity;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IStatistic;

public class Statistic extends BaseEntity implements IStatistic {

	private int sumGames;
	private int wonGames;

	@Override
	public int getSumGames() {
		return sumGames;
	}

	@Override
	public void setSumGames(int sumGames) {
		this.sumGames = sumGames;
	}

	@Override
	public int getWonGames() {
		return wonGames;
	}

	@Override
	public void setWonGames(int wonGames) {
		this.wonGames = wonGames;
	}

	@Override
	public String toString() {
		return "Statistic [sum_games=" + sumGames + ", won_games=" + wonGames + "]";
	}

}
