package by.itacademy.aalexandrov.poker.service.game;

import java.util.Collections;
import java.util.HashSet;
import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.Rank;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICard;

public class PokerLogicUtils {

	public static CardsCombination resolveCombination(List<ICard> cards) {

		if (isRoyalFlush(cards)) {
			return CardsCombination.royal_flush;
		} else if (isStraightFlush(cards)) {
			return CardsCombination.straight_flush;
		} else if (isFourOfAKind(cards)) {
			return CardsCombination.four_of_a_kind;
		} else if (isFullHouse(cards)) {
			return CardsCombination.full_house;
		} else if (isFlush(cards)) {
			return CardsCombination.flush;
		} else if (isStraight(cards)) {
			return CardsCombination.straight;
		} else if (isThreeOfAKind(cards)) {
			return CardsCombination.three_of_a_kind;
		} else if (isTwoPair(cards)) {
			return CardsCombination.two_pair;
		} else if (isPair(cards)) {
			return CardsCombination.pair;
		} else if (isHighCard(cards)) {
			return CardsCombination.high_card;
		}

		throw new IllegalArgumentException("can't resolve the combination for cards:"
				+ cards.stream().map(e -> e.toString()).reduce("", String::concat));
	}

	private static boolean isRoyalFlush(List<ICard> cards) {
		// if all cards of the same suite then....
		HashSet<Object> suits = new HashSet<>();
		for (ICard iCard : cards) {
			suits.add(iCard.getSuit());
		}

		if (suits.size() != 1) {
			return false;
		}

		// sort all cards
		Collections.sort(cards);
		if (Rank.TEN.equals(cards.get(0).getRank())) {
			return false;
		}

		ICard previous = null;
		for (ICard c : cards) {
			if (previous != null) {

				int diff = c.getRank().ordinal() - previous.getRank().ordinal();

				if (diff != 1) {
					return false;
				}

			}
			previous = c;

		}
		return true;
	}

	private static boolean isStraightFlush(List<ICard> cards) {
		// if all cards of the same suite then....
		HashSet<Object> suits = new HashSet<>();
		for (ICard iCard : cards) {
			suits.add(iCard.getSuit());
		}

		if (suits.size() != 1) {
			return false;
		}

		// sort all cards
		Collections.sort(cards);

		ICard previous = null;
		for (ICard c : cards) {
			if (previous != null) {

				int diff = c.getRank().ordinal() - previous.getRank().ordinal();

				if (diff != 1) {
					return false;
				}

			}
			previous = c;

		}
		return true;
	}

	private static boolean isFourOfAKind(List<ICard> cards) {
		// TODO Auto-generated method stub
		return false;
	}

	private static boolean isHighCard(List<ICard> cards) {
		// TODO Auto-generated method stub
		return false;
	}

	private static boolean isPair(List<ICard> cards) {
		// TODO Auto-generated method stub
		return false;
	}

	private static boolean isTwoPair(List<ICard> cards) {
		// TODO Auto-generated method stub
		return false;
	}

	private static boolean isThreeOfAKind(List<ICard> cards) {
		// TODO Auto-generated method stub
		return false;
	}

	private static boolean isStraight(List<ICard> cards) {
		// TODO Auto-generated method stub
		return false;
	}

	private static boolean isFlush(List<ICard> cards) {
		// TODO Auto-generated method stub
		return false;
	}

	private static boolean isFullHouse(List<ICard> cards) {
		// TODO Auto-generated method stub
		return false;
	}

}
