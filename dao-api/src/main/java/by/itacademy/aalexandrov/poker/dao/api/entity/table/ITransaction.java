package by.itacademy.aalexandrov.poker.dao.api.entity.table;

public interface ITransaction extends IBaseEntity {

	void setComment(String comment);

	String getComment();

	void setAmount(double amount);

	double getAmount();

}
