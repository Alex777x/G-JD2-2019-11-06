package by.itacademy.aalexandrov.poker.jdbc.impl.entity;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IChat;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.GameStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IBoard;

public class Game extends BaseEntity implements IGame {

	private IChat chatId;
	private IPlayer playerId;
	private IBoard boardId;
	private GameStatus state;
	private double bank;

	@Override
	public IChat getChatId() {
		return chatId;
	}

	@Override
	public void setChatId(IChat chatId) {
		this.chatId = chatId;
	}

	@Override
	public IPlayer getPlayerId() {
		return playerId;
	}

	@Override
	public void setPlayerId(IPlayer playerId) {
		this.playerId = playerId;
	}

	@Override
	public IBoard getBoardId() {
		return boardId;
	}

	@Override
	public void setBoardId(IBoard boardId) {
		this.boardId = boardId;
	}

	@Override
	public GameStatus getState() {
		return state;
	}

	@Override
	public void setState(GameStatus state) {
		this.state = state;
	}

	@Override
	public double getBank() {
		return bank;
	}

	@Override
	public void setBank(double bank) {
		this.bank = bank;
	}

	@Override
	public String toString() {
		return "Game [chatId=" + chatId + ", playerId=" + playerId + ", boardId=" + boardId + ", state=" + state
				+ ", bank=" + bank + "]";
	}

}
