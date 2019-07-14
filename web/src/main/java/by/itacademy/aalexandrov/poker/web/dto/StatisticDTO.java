package by.itacademy.aalexandrov.poker.web.dto;

public class StatisticDTO {

	private Integer id;
	private int sumGames;
	private int wonGames;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getSumGames() {
		return sumGames;
	}

	public void setSumGames(int sumGames) {
		this.sumGames = sumGames;
	}

	public int getWonGames() {
		return wonGames;
	}

	public void setWonGames(int wonGames) {
		this.wonGames = wonGames;
	}

}
