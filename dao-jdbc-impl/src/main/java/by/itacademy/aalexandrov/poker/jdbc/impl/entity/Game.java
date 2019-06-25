package by.itacademy.aalexandrov.poker.jdbc.impl.entity;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.GameStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IChat;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPokerBoard;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;

public class Game extends BaseEntity implements IGame {

	private GameStatus gameStatus;
	private IUserAccount winnerId;
	private IUserAccount nexStepPerformerId;
	private IPokerBoard pokerBoardId;
	private double bank;
	private IChat chatId;

	@Override
	public GameStatus getGameStatus() {
		return gameStatus;
	}

	@Override
	public void setGameStatus(GameStatus gameStatus) {
		this.gameStatus = gameStatus;
	}

	@Override
	public IUserAccount getWinnerId() {
		return winnerId;
	}

	@Override
	public void setWinnerId(IUserAccount winnerId) {
		this.winnerId = winnerId;
	}

	@Override
	public IUserAccount getNexStepPerformerId() {
		return nexStepPerformerId;
	}

	@Override
	public void setNexStepPerformerId(IUserAccount nexStepPerformerId) {
		this.nexStepPerformerId = nexStepPerformerId;
	}

	@Override
	public IPokerBoard getPokerBoardId() {
		return pokerBoardId;
	}

	@Override
	public void setPokerBoardId(IPokerBoard pokerBoardId) {
		this.pokerBoardId = pokerBoardId;
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
	public IChat getChatId() {
		return chatId;
	}

	@Override
	public void setChatId(IChat chatId) {
		this.chatId = chatId;
	}

	@Override
	public String toString() {
		return "Game [gameStatus=" + gameStatus + ", winnerId=" + winnerId + ", nexStepPerformerId="
				+ nexStepPerformerId + ", pokerBoardId=" + pokerBoardId + ", bank=" + bank + ", chatId=" + chatId + "]";
	}

}
