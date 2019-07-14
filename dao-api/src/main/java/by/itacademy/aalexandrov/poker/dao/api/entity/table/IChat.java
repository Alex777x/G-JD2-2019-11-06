package by.itacademy.aalexandrov.poker.dao.api.entity.table;

public interface IChat extends IBaseEntity {

	String toString();

	void setMessage(String message);

	String getMessage();

	void setUserAccount(IUserAccount userAccount);

	IUserAccount getUserAccount();

	void setGame(IGame game);

	IGame getGame();

}
