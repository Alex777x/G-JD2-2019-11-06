package by.itacademy.aalexandrov.poker.web.controller;

import java.sql.Timestamp;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.service.IGameService;
import by.itacademy.aalexandrov.poker.service.IPlayerService;

public class PlayersStepHelper {
	static IGameService gameService;
	static IPlayerService playerService;

	public static void assignCurrentPlayerToGameStep(Integer playerId, Integer gameId) {
		// set player id to game (as current active player)
		// set timestamp (current +30sec) which means deadline for current step
		Timestamp timestamp = new Timestamp(System.currentTimeMillis() + 30);
		IGame game = gameService.getFullInfo(gameId);
		game.setActivePlayerId(playerId);
		game.setTimestampEndStep(timestamp);
		gameService.save(game);

		new java.util.Timer().schedule(new java.util.TimerTask() {
			@Override
			public void run() {

				// get current game player from DB
				Integer currentPlayer = gameService.getFullInfo(gameId).getActivePlayerId();

				if (currentPlayer == playerId) {
					// set next player as active
					game.setActivePlayerId(playerId);
					game.setTimestampEndStep(timestamp);
					gameService.save(game);
				}

			}
		}, 30000);

	}

	public void makeStep(Long playerId, Long gameId) {

		// get current player in DB for game

		// if (playerId!==currentPlayerInDb) throw new Exception ("не твой уже ход!!!")

	}

}
