package by.itacademy.aalexandrov.poker.dao.orm.impl.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITransaction;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;

@Entity
public class Transaction extends BaseEntity implements ITransaction {

	@Column
	private double amount;

	@Column
	private String comment;

	@ManyToOne(fetch = FetchType.LAZY, targetEntity = UserAccount.class)
	private IUserAccount userAccount;

	@Transient
	private String upperCaseName;

	public String getUpperCaseName() {
		return upperCaseName;
	}

	public void setUpperCaseName(String upperCaseName) {
		this.upperCaseName = upperCaseName;
	}

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
	public IUserAccount getUserAccount() {
		return userAccount;
	}

	@Override
	public void setUserAccount(IUserAccount userAccount) {
		this.userAccount = userAccount;
	}

	@Override
	public String toString() {
		return "Transaction [amount=" + amount + ", comment=" + comment + ", userAccount=" + userAccount + "]";
	}

}
