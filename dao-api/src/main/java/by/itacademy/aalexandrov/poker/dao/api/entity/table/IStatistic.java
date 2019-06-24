package by.itacademy.aalexandrov.poker.dao.api.entity.table;

public interface IStatistic extends IBaseEntity {

	void setWonGames(int wonGames);

	int getWonGames();

	void setSumGames(int sumGames);

	int getSumGames();

	
	
}
