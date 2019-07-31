package by.itacademy.aalexandrov.poker.dao.orm.impl.entity;

import javax.persistence.Column;
import javax.persistence.Entity;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.Rank;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.Suits;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICard;

@Entity
public class Card extends BaseEntity implements ICard {

	@Column
	private Suits suit;

	@Column
	private Rank rank;

	@Column
	private String filename;

	@Override
	public Suits getSuit() {
		return suit;
	}

	@Override
	public void setSuit(Suits suit) {
		this.suit = suit;
	}

	@Override
	public Rank getRank() {
		return rank;
	}

	@Override
	public void setRank(Rank rank) {
		this.rank = rank;
	}

	@Override
	public String getFilename() {
		return filename;
	}

	@Override
	public void setFilename(String filename) {
		this.filename = filename;
	}

	@Override
	public String toString() {
		return "Card [suit=" + suit + ", rank=" + rank + ", filename=" + filename + "]";
	}

}
