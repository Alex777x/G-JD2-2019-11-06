package by.itacademy.aalexandrov.poker.dao.api.entity.table;

public interface ITranzaction extends IBaseEntity {

	void setComment(String comment);

	String getComment();

	void setAmount(double amount);

	double getAmount();

}
