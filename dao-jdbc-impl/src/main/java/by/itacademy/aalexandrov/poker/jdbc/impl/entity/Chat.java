package by.itacademy.aalexandrov.poker.jdbc.impl.entity;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IChat;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;

public class Chat extends BaseEntity implements IChat {

	private IPlayer playerId;
	private String message;

	@Override
	public IPlayer getPlayerId() {
		return playerId;
	}

	@Override
	public void setPlayerId(IPlayer playerId) {
		this.playerId = playerId;
	}

	@Override
	public String getMessage() {
		return message;
	}

	@Override
	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "Chat [playerId=" + playerId + ", message=" + message + "]";
	}

}
