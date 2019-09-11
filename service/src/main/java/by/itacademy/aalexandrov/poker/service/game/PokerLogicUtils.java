package by.itacademy.aalexandrov.poker.service.game;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.Rank;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.Suits;
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
		Map<Suits, Integer> suits = new HashMap<>();
		countSuits(cards, suits);

		Suits suit = null;
		for (Map.Entry<Suits, Integer> entry : suits.entrySet()) {
			if (entry.getValue() == 5) {
				suit = entry.getKey();
				break;
			} else if (entry.getValue() != 5) {
				continue;
			} else {
				return false;
			}
		}
		List<ICard> fiveCardsameSuit = new ArrayList<ICard>();
		for (ICard iCard : cards) {
			if (iCard.getSuit().equals(suit)) {
				fiveCardsameSuit.add(iCard);
			}
		}

		Collections.sort(fiveCardsameSuit);
		if (!Rank.ACE.equals(fiveCardsameSuit.get(fiveCardsameSuit.size() - 1).getRank())) {
			return false;
		}

		ICard previous = null;
		for (ICard c : fiveCardsameSuit) {
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
		Map<Suits, Integer> suits = new HashMap<>();
		countSuits(cards, suits);

		Suits suit = null;
		for (Map.Entry<Suits, Integer> entry : suits.entrySet()) {
			if (entry.getValue() == 5) {
				suit = entry.getKey();
				break;
			} else if (entry.getValue() != 5) {
				continue;
			} else {
				return false;
			}
		}
		List<ICard> fiveCardsameSuit = new ArrayList<ICard>();
		for (ICard iCard : cards) {
			if (iCard.getSuit().equals(suit)) {
				fiveCardsameSuit.add(iCard);
			}
		}

		Collections.sort(fiveCardsameSuit);

		ICard previous = null;
		for (ICard c : fiveCardsameSuit) {
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

	private static void countSuits(List<ICard> cards, Map<Suits, Integer> suits) {
		int iclubs = 1;
		int idiamonds = 1;
		int ihearts = 1;
		int ispades = 1;
		for (ICard iCard : cards) {
			if (iCard.getSuit().equals(Suits.CLUBS)) {
				if (!suits.containsKey(Suits.CLUBS)) {
					suits.put(Suits.CLUBS, iclubs);
				} else {
					iclubs++;
					suits.replace(Suits.CLUBS, iclubs);
				}

			} else if (iCard.getSuit().equals(Suits.DIAMONDS)) {
				if (!suits.containsKey(Suits.DIAMONDS)) {
					suits.put(Suits.DIAMONDS, idiamonds);
				} else {
					idiamonds++;
					suits.replace(Suits.DIAMONDS, idiamonds);
				}

			} else if (iCard.getSuit().equals(Suits.HEARTS)) {
				if (!suits.containsKey(Suits.HEARTS)) {
					suits.put(Suits.HEARTS, ihearts);
				} else {
					ihearts++;
					suits.replace(Suits.HEARTS, ihearts);
				}
			} else if (iCard.getSuit().equals(Suits.SPADES)) {
				if (!suits.containsKey(Suits.SPADES)) {
					suits.put(Suits.SPADES, ispades);
				} else {
					ispades++;
					suits.replace(Suits.SPADES, ispades);
				}
			}
		}
	}

}
