package by.itacademy.aalexandrov.poker.web.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.GameStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerPosition;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.service.IGameService;
import by.itacademy.aalexandrov.poker.service.IPlayerService;
import by.itacademy.aalexandrov.poker.service.ITransactionService;
import by.itacademy.aalexandrov.poker.service.IUserAccountService;
import by.itacademy.aalexandrov.poker.web.converter.GameFromDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.GameToDTOConverter;
import by.itacademy.aalexandrov.poker.web.security.AuthHelper;

@Controller
@RequestMapping(value = "/inGame")
public class InGameController extends AbstractController {

	@Autowired
	private IGameService gameService;
	@Autowired
	private GameToDTOConverter gameToDtoConverter;
	@Autowired
	private GameFromDTOConverter gameFromDtoConverter;
	@Autowired
	private IPlayerService playerService;
	@Autowired
	private IUserAccountService userAccountService;
	@Autowired
	private ITransactionService transactionService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView index(@RequestParam(name = "id", required = true) Integer gameId) {
		IGame game = gameService.getFullInfo(gameId);
		Integer loggedUserId = AuthHelper.getLoggedUserId();
		IUserAccount curentUser = userAccountService.getFullInfo(loggedUserId);
		double balance = transactionService.getSumm(curentUser.getId());

		if (playerService.findPlayer(loggedUserId)) {
			IPlayer player = playerService.createEntity();
			player.setGame(game);
			player.setUserAccount(curentUser);
			player.setPosition(null);
			player.setInGame(true);
			player.setState(PlayerStatus.INACTIVE);
			player.setStack(balance);
			playerService.save(player);
		}

		return new ModelAndView("inGame.index");
	}

	@RequestMapping(value = "/setposition", method = RequestMethod.POST)
	public ResponseEntity<Map<Integer, Boolean>> setPosition(
			@RequestParam(name = "id", required = true) final Integer id) {
		Integer loggedUserId = AuthHelper.getLoggedUserId();
		IPlayer player = playerService.getPlayerByUser(loggedUserId);
		int gameId = player.getGame().getId();
		IGame curentGame = gameService.getFullInfo(gameId);
		String checkCurentPosition = player.getPosition().name();

		Map<Integer, Boolean> response = new HashMap<>();
		if (!checkCurentPosition.equals("FREE")) {
			return new ResponseEntity<Map<Integer, Boolean>>(response, HttpStatus.OK);
		}

		int position = 0;
		boolean flag = false;
		switch (id) {
		case 1:
			boolean freePosition1 = curentGame.isPosition1();
			if (!freePosition1) {
				curentGame.setPosition1(true);
				curentGame.setNumberOfPlayers(curentGame.getNumberOfPlayers() + 1);
				gameService.save(curentGame);
				player.setPosition(PlayerPosition.ONE);
				playerService.save(player);
				flag = true;
				position = 1;
				break;
			}
		case 2:
			boolean freePosition2 = curentGame.isPosition2();
			if (!freePosition2) {
				curentGame.setPosition2(true);
				curentGame.setNumberOfPlayers(curentGame.getNumberOfPlayers() + 1);
				gameService.save(curentGame);
				player.setPosition(PlayerPosition.TWO);
				playerService.save(player);
				flag = true;
				position = 2;
				break;
			}
		case 3:
			boolean freePosition3 = curentGame.isPosition3();
			if (!freePosition3) {
				curentGame.setPosition3(true);
				curentGame.setNumberOfPlayers(curentGame.getNumberOfPlayers() + 1);
				gameService.save(curentGame);
				player.setPosition(PlayerPosition.THREE);
				playerService.save(player);
				flag = true;
				position = 3;
				break;
			}
		case 4:
			boolean freePosition4 = curentGame.isPosition4();
			if (!freePosition4) {
				curentGame.setPosition4(true);
				curentGame.setNumberOfPlayers(curentGame.getNumberOfPlayers() + 1);
				gameService.save(curentGame);
				player.setPosition(PlayerPosition.FOUR);
				playerService.save(player);
				flag = true;
				position = 4;
				break;
			}
		case 5:
			boolean freePosition5 = curentGame.isPosition5();
			if (!freePosition5) {
				curentGame.setPosition5(true);
				curentGame.setNumberOfPlayers(curentGame.getNumberOfPlayers() + 1);
				gameService.save(curentGame);
				player.setPosition(PlayerPosition.FIVE);
				playerService.save(player);
				flag = true;
				position = 5;
				break;
			}
		case 6:
			boolean freePosition6 = curentGame.isPosition6();
			if (!freePosition6) {
				curentGame.setPosition6(true);
				curentGame.setNumberOfPlayers(curentGame.getNumberOfPlayers() + 1);
				gameService.save(curentGame);
				player.setPosition(PlayerPosition.SIX);
				playerService.save(player);
				flag = true;
				position = 6;
				break;
			}
		case 7:
			boolean freePosition7 = curentGame.isPosition7();
			if (!freePosition7) {
				curentGame.setPosition7(true);
				curentGame.setNumberOfPlayers(curentGame.getNumberOfPlayers() + 1);
				gameService.save(curentGame);
				player.setPosition(PlayerPosition.SEVEN);
				playerService.save(player);
				flag = true;
				position = 7;
				break;
			}
		case 8:
			boolean freePosition8 = curentGame.isPosition8();
			if (!freePosition8) {
				curentGame.setPosition8(true);
				curentGame.setNumberOfPlayers(curentGame.getNumberOfPlayers() + 1);
				gameService.save(curentGame);
				player.setPosition(PlayerPosition.EIGHT);
				playerService.save(player);
				flag = true;
				position = 8;
				break;
			}
		case 9:
			boolean freePosition9 = curentGame.isPosition9();
			if (!freePosition9) {
				curentGame.setPosition9(true);
				curentGame.setNumberOfPlayers(curentGame.getNumberOfPlayers() + 1);
				gameService.save(curentGame);
				player.setPosition(PlayerPosition.NINE);
				playerService.save(player);
				flag = true;
				position = 9;
				break;
			}
		case 10:
			boolean freePosition10 = curentGame.isPosition10();
			if (!freePosition10) {
				curentGame.setPosition10(true);
				curentGame.setNumberOfPlayers(curentGame.getNumberOfPlayers() + 1);
				gameService.save(curentGame);
				player.setPosition(PlayerPosition.TEN);
				playerService.save(player);
				flag = true;
				position = 10;
				break;
			}
		}

		int checkNumberOfPlayers = curentGame.getNumberOfPlayers();
		if (checkNumberOfPlayers >= 2) {
			curentGame.setState(GameStatus.ACTIVE);
			gameService.save(curentGame);
		}
		response.put(position, flag);
		return new ResponseEntity<Map<Integer, Boolean>>(response, HttpStatus.OK);

	}

}
