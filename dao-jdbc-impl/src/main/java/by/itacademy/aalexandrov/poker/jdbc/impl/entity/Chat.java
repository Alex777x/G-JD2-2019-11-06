package by.itacademy.aalexandrov.poker.jdbc.impl.entity;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IChat;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;

public class Chat extends BaseEntity implements IChat {

	private IGame gameId;
	private IUserAccount userAccountId;
	private String message;

	@Override
	public IGame getGameId() {
		return gameId;
	}

	@Override
	public void setGameId(IGame gameId) {
		this.gameId = gameId;
	}

	@Override
	public IUserAccount getUserAccountId() {
		return userAccountId;
	}

	@Override
	public void setUserAccountId(IUserAccount userAccountId) {
		this.userAccountId = userAccountId;
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
		return "Chat [gameId=" + gameId + ", userAccountId=" + userAccountId + ", message=" + message + "]";
	}

}
