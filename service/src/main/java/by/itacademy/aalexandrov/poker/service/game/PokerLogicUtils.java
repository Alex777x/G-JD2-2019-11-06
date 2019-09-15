package by.itacademy.aalexandrov.poker.service.game;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.CardsCombination;
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
		} else {
			return CardsCombination.high_card;
		}

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
		if (fiveCardsameSuit.size() != 5) {
			return false;
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
		if (fiveCardsameSuit.size() != 5) {
			return false;
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
		Map<Rank, Integer> ranks = new HashMap<>();
		countRanks(cards, ranks);
		for (Map.Entry<Rank, Integer> entry : ranks.entrySet()) {
			if (entry.getValue() == 4) {
				return true;
			} else if (entry.getValue() != 4) {
				continue;
			} else {
				return false;
			}
		}
		return false;
	}

	private static boolean isFullHouse(List<ICard> cards) {
		Map<Rank, Integer> ranks = new HashMap<>();
		countRanks(cards, ranks);
		boolean flag = false;
		for (Map.Entry<Rank, Integer> entry : ranks.entrySet()) {
			if (entry.getValue() == 3) {
				flag = true;
				break;
			} else if (entry.getValue() != 3) {
				continue;
			} else {
				return false;
			}
		}

		if (flag) {
			for (Map.Entry<Rank, Integer> entry : ranks.entrySet()) {
				if (entry.getValue() == 2) {
					return true;
				} else if (entry.getValue() != 2) {
					continue;
				} else {
					return false;
				}
			}
		}
		return false;
	}

	private static boolean isFlush(List<ICard> cards) {
		Map<Suits, Integer> suits = new HashMap<>();
		countSuits(cards, suits);
		for (Map.Entry<Suits, Integer> entry : suits.entrySet()) {
			if (entry.getValue() == 5) {
				return true;
			} else if (entry.getValue() != 5) {
				continue;
			} else {
				return false;
			}
		}
		return false;
	}

	private static boolean isStraight(List<ICard> cards) {
		Set<Rank> ranks = new HashSet<Rank>();
		List<ICard> cards1 = new ArrayList<ICard>();
		cards1.addAll(cards);
		for (Iterator<ICard> iterator = cards1.iterator(); iterator.hasNext();) {
			ICard value = iterator.next();
			if (!ranks.add(value.getRank())) {
				iterator.remove();
			}
		}
		Collections.sort(cards1);
		if (ranks.size() < 5) {
			return false;
		}

		ICard previous = null;
		int countSequenceCard = 1;
		for (ICard c : cards1) {
			if (previous != null) {

				int diff = c.getRank().ordinal() - previous.getRank().ordinal();

				if (diff == 1) {
					countSequenceCard++;
					if (countSequenceCard == 5) {
						return true;
					}
				} else {
					countSequenceCard = 1;
				}

			}
			previous = c;
		}

		return false;

	}

	private static boolean isThreeOfAKind(List<ICard> cards) {
		Map<Rank, Integer> ranks = new HashMap<>();
		countRanks(cards, ranks);
		for (Map.Entry<Rank, Integer> entry : ranks.entrySet()) {
			if (entry.getValue() == 3) {
				return true;
			} else if (entry.getValue() != 3) {
				continue;
			} else {
				return false;
			}
		}
		return false;
	}

	private static boolean isTwoPair(List<ICard> cards) {
		Map<Rank, Integer> ranks = new HashMap<>();
		countRanks(cards, ranks);
		boolean flag = false;
		for (Map.Entry<Rank, Integer> entry : ranks.entrySet()) {
			if (entry.getValue() == 2) {
				flag = true;
				ranks.remove(entry.getKey());
				break;
			} else if (entry.getValue() != 2) {
				continue;
			} else {
				return false;
			}
		}

		if (flag) {
			for (Map.Entry<Rank, Integer> entry : ranks.entrySet()) {
				if (entry.getValue() == 2) {
					return true;
				} else if (entry.getValue() != 2) {
					continue;
				} else {
					return false;
				}
			}
		}
		return false;
	}

	private static boolean isPair(List<ICard> cards) {
		Map<Rank, Integer> ranks = new HashMap<>();
		countRanks(cards, ranks);
		for (Map.Entry<Rank, Integer> entry : ranks.entrySet()) {
			if (entry.getValue() == 2) {
				return true;
			} else if (entry.getValue() != 2) {
				continue;
			} else {
				return false;
			}
		}
		return false;
	}

	private static void countSuits(List<ICard> cards, Map<Suits, Integer> suits) {
		int iclubs = 0;
		int idiamonds = 0;
		int ihearts = 0;
		int ispades = 0;
		for (ICard iCard : cards) {
			if (iCard.getSuit().equals(Suits.CLUBS)) {
				if (!suits.containsKey(Suits.CLUBS)) {
					suits.put(Suits.CLUBS, iclubs);
					iclubs++;
				} else {
					iclubs++;
					suits.replace(Suits.CLUBS, iclubs);
				}

			} else if (iCard.getSuit().equals(Suits.DIAMONDS)) {
				if (!suits.containsKey(Suits.DIAMONDS)) {
					suits.put(Suits.DIAMONDS, idiamonds);
					idiamonds++;
				} else {
					idiamonds++;
					suits.replace(Suits.DIAMONDS, idiamonds);
				}

			} else if (iCard.getSuit().equals(Suits.HEARTS)) {
				if (!suits.containsKey(Suits.HEARTS)) {
					suits.put(Suits.HEARTS, ihearts);
					ihearts++;
				} else {
					ihearts++;
					suits.replace(Suits.HEARTS, ihearts);
				}
			} else if (iCard.getSuit().equals(Suits.SPADES)) {
				if (!suits.containsKey(Suits.SPADES)) {
					suits.put(Suits.SPADES, ispades);
					ispades++;
				} else {
					ispades++;
					suits.replace(Suits.SPADES, ispades);
				}
			}
		}
	}

	private static void countRanks(List<ICard> cards, Map<Rank, Integer> ranks) {
		int iTwo = 1;
		int iThree = 1;
		int iFour = 1;
		int iFive = 1;
		int iSix = 1;
		int iSeven = 1;
		int iEight = 1;
		int iNine = 1;
		int iTen = 1;
		int iJack = 1;
		int iQueen = 1;
		int iKing = 1;
		int iAce = 1;
		for (ICard iCard : cards) {
			if (iCard.getRank().equals(Rank.TWO)) {
				if (!ranks.containsKey(Rank.TWO)) {
					ranks.put(Rank.TWO, iTwo);
				} else {
					iTwo++;
					ranks.replace(Rank.TWO, iTwo);
				}

			} else if (iCard.getRank().equals(Rank.THREE)) {
				if (!ranks.containsKey(Rank.THREE)) {
					ranks.put(Rank.THREE, iThree);
				} else {
					iThree++;
					ranks.replace(Rank.THREE, iThree);
				}

			} else if (iCard.getRank().equals(Rank.FOUR)) {
				if (!ranks.containsKey(Rank.FOUR)) {
					ranks.put(Rank.FOUR, iFour);
				} else {
					iFour++;
					ranks.replace(Rank.FOUR, iFour);
				}
			} else if (iCard.getRank().equals(Rank.FIVE)) {
				if (!ranks.containsKey(Rank.FIVE)) {
					ranks.put(Rank.FIVE, iFive);
				} else {
					iFive++;
					ranks.replace(Rank.FIVE, iFive);
				}
			} else if (iCard.getRank().equals(Rank.SIX)) {
				if (!ranks.containsKey(Rank.SIX)) {
					ranks.put(Rank.SIX, iSix);
				} else {
					iSix++;
					ranks.replace(Rank.SIX, iSix);
				}
			} else if (iCard.getRank().equals(Rank.SEVEN)) {
				if (!ranks.containsKey(Rank.SEVEN)) {
					ranks.put(Rank.SEVEN, iSeven);
				} else {
					iSeven++;
					ranks.replace(Rank.SEVEN, iSeven);
				}
			} else if (iCard.getRank().equals(Rank.EIGHT)) {
				if (!ranks.containsKey(Rank.EIGHT)) {
					ranks.put(Rank.EIGHT, iEight);
				} else {
					iEight++;
					ranks.replace(Rank.EIGHT, iEight);
				}
			} else if (iCard.getRank().equals(Rank.NINE)) {
				if (!ranks.containsKey(Rank.NINE)) {
					ranks.put(Rank.NINE, iNine);
				} else {
					iNine++;
					ranks.replace(Rank.NINE, iNine);
				}
			} else if (iCard.getRank().equals(Rank.TEN)) {
				if (!ranks.containsKey(Rank.TEN)) {
					ranks.put(Rank.TEN, iTen);
				} else {
					iTen++;
					ranks.replace(Rank.TEN, iTen);
				}
			} else if (iCard.getRank().equals(Rank.JACK)) {
				if (!ranks.containsKey(Rank.JACK)) {
					ranks.put(Rank.JACK, iJack);
				} else {
					iJack++;
					ranks.replace(Rank.JACK, iJack);
				}
			} else if (iCard.getRank().equals(Rank.QUEEN)) {
				if (!ranks.containsKey(Rank.QUEEN)) {
					ranks.put(Rank.QUEEN, iQueen);
				} else {
					iQueen++;
					ranks.replace(Rank.QUEEN, iQueen);
				}
			} else if (iCard.getRank().equals(Rank.KING)) {
				if (!ranks.containsKey(Rank.KING)) {
					ranks.put(Rank.KING, iKing);
				} else {
					iKing++;
					ranks.replace(Rank.KING, iKing);
				}
			} else if (iCard.getRank().equals(Rank.ACE)) {
				if (!ranks.containsKey(Rank.ACE)) {
					ranks.put(Rank.ACE, iAce);
				} else {
					iAce++;
					ranks.replace(Rank.ACE, iAce);
				}
			}
		}
	}

}
