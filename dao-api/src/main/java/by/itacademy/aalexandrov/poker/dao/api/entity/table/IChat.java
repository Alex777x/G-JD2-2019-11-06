package by.itacademy.aalexandrov.poker.dao.api.entity.table;

public interface IChat extends IBaseEntity {

	void setMessage(String message);

	String getMessage();

	void setPlayerId(IPlayer playerId);

	IPlayer getPlayerId();

}
