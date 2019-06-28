package by.itacademy.aalexandrov.poker.dao.api.entity.table;

public interface IChat extends IBaseEntity {

	String toString();

	void setMessage(String message);

	String getMessage();

	void setUserAccountId(IUserAccount userAccountId);

	IUserAccount getUserAccountId();

	void setGameId(IGame gameId);

	IGame getGameId();

}
