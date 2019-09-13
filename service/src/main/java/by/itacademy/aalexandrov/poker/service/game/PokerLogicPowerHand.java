package by.itacademy.aalexandrov.poker.service.game;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.CardsCombination;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;

public class PokerLogicPowerHand {

	public static CardsCombination resolveCombination(List<IPlayer> players) {
		List<CardsCombination> playersCombinations = new ArrayList<CardsCombination>();
		for (IPlayer iPlayer : players) {
			playersCombinations.add(iPlayer.getCurentHand());
		}

		Collections.sort(playersCombinations);
		return playersCombinations.get(0);
	}

}
