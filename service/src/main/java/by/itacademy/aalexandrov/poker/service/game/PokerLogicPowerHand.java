package by.itacademy.aalexandrov.poker.service.game;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.CardsCombination;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;

public class PokerLogicPowerHand {

	public static CardsCombination resolveCombination(List<IPlayer> players) {
		CardsCombination playersCombinations = null;
		IPlayer previous = null;
		for (IPlayer iPlayer : players) {
			if (previous != null) {
				if (iPlayer.getCurentHand().ordinal() < previous.getCurentHand().ordinal()) {
					playersCombinations = iPlayer.getCurentHand();
				}
			}
			previous = iPlayer;
		}
		return playersCombinations;
	}

}
