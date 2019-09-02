package by.itacademy.aalexandrov.poker.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.service.IGameService;
import by.itacademy.aalexandrov.poker.service.IPlayerService;

public class PlayersStepHelper {
	@Autowired
	IGameService gameService;
	@Autowired
	IPlayerService playerService;

	public void assignCurrentPlayerToGameStep(Integer playerId, Integer gameId) {
		// set player id to game (as current active player)
		// set timestamp (current +30sec) which means deadline for current step

		new java.util.Timer().schedule(new java.util.TimerTask() {
			@Override
			public void run() {

				// get current game player from DB
				IGame game = gameService.getFullInfo(gameId);
				Integer currentPlayer = game.getActivePlayerId();

				if (currentPlayer == playerId) {
					List<IPlayer> players = playerService.getPlayersByGame(gameId);
					for (IPlayer iPlayer : players) {
						if (iPlayer.getId() == currentPlayer) {
							int index = players.indexOf(iPlayer);
							game.setActivePlayerId(index + 1);
							gameService.save(game);
						}
					}

				}

			}
		}, 30000);

	}

	public void makeStep(Long playerId, Long gameId) {

		// get current player in DB for game

		// if (playerId!==currentPlayerInDb) throw new Exception ("не твой уже ход!!!")

	}

}
