package by.itacademy.aalexandrov.poker.dao.api.entity.table;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.Rank;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.Suits;

public interface ICard extends IBaseEntity, Comparable<ICard> {

	void setFilename(String filename);

	String getFilename();

	void setRank(Rank rank);

	Rank getRank();

	void setSuit(Suits suit);

	Suits getSuit();

}
