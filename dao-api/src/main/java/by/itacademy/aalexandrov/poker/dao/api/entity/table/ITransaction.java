package by.itacademy.aalexandrov.poker.dao.api.entity.table;

public interface ITransaction extends IBaseEntity {

	void setUserAccount(IUserAccount userAccount);

	IUserAccount getUserAccount();

	void setComment(String comment);

	String getComment();

	void setAmount(double amount);

	double getAmount();

}
