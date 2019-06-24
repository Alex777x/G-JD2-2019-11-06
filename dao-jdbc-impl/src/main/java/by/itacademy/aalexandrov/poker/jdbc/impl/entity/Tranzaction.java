package by.itacademy.aalexandrov.poker.jdbc.impl.entity;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITranzaction;

public class Tranzaction extends BaseEntity implements ITranzaction {

	private double amount;
	private String comment;

	@Override
	public double getAmount() {
		return amount;
	}

	@Override
	public void setAmount(double amount) {
		this.amount = amount;
	}

	@Override
	public String getComment() {
		return comment;
	}

	@Override
	public void setComment(String comment) {
		this.comment = comment;
	}

	@Override
	public String toString() {
		return "Tranzaction [amount=" + amount + ", comment=" + comment + "]";
	}

}
