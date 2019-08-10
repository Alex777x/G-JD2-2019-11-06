package by.itacademy.aalexandrov.poker.dao.api.entity.table;

public interface IChatInHome extends IBaseEntity {

	void setMessage(String message);

	String getMessage();

	void setUserAccount(IUserAccount userAccount);

	IUserAccount getUserAccount();

}
