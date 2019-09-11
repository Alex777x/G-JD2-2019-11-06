package by.itacademy.aalexandrov.poker.service.impl;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.Rank;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.Suits;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICard;
import by.itacademy.aalexandrov.poker.service.game.CardsCombination;
import by.itacademy.aalexandrov.poker.service.game.PokerLogicUtils;

public class PokeLogicUtilsTest extends AbstractTest {

	private ICard _10_hearts;
	private ICard _jack_hearts;
	private ICard _queen_hearts;
	private ICard _king_hearts;
	private ICard _ace_hearts;

	private ICard _7_clubs;
	private ICard _8_clubs;
	private ICard _9_clubs;
	private ICard _10_clubs;
	private ICard _jack_clubs;

	private ICard _king_clubs;
	private ICard _king_spades;
	private ICard _king_diamonds;

	private ICard _jack_spades;
	private ICard _7_spades;
	private ICard _ace_spades;
	private ICard _2_spades;
	private ICard _9_spades;

	private ICard _5_diamonds;
	private ICard _6_clubs;
	private ICard _8_hearts;
	private ICard _9_diamonds;

	@BeforeEach
	public void setupCards() {
		_9_diamonds = cardService.createEntity();
		_9_diamonds.setRank(Rank.NINE);
		_9_diamonds.setSuit(Suits.DIAMONDS);

		_8_hearts = cardService.createEntity();
		_8_hearts.setRank(Rank.EIGHT);
		_8_hearts.setSuit(Suits.HEARTS);

		_6_clubs = cardService.createEntity();
		_6_clubs.setRank(Rank.SIX);
		_6_clubs.setSuit(Suits.CLUBS);

		_5_diamonds = cardService.createEntity();
		_5_diamonds.setRank(Rank.FIVE);
		_5_diamonds.setSuit(Suits.DIAMONDS);

		_9_spades = cardService.createEntity();
		_9_spades.setRank(Rank.NINE);
		_9_spades.setSuit(Suits.SPADES);

		_2_spades = cardService.createEntity();
		_2_spades.setRank(Rank.TWO);
		_2_spades.setSuit(Suits.SPADES);

		_ace_spades = cardService.createEntity();
		_ace_spades.setRank(Rank.ACE);
		_ace_spades.setSuit(Suits.SPADES);

		_7_spades = cardService.createEntity();
		_7_spades.setRank(Rank.SEVEN);
		_7_spades.setSuit(Suits.SPADES);

		_jack_spades = cardService.createEntity();
		_jack_spades.setRank(Rank.JACK);
		_jack_spades.setSuit(Suits.SPADES);

		_10_hearts = cardService.createEntity();
		_10_hearts.setRank(Rank.TEN);
		_10_hearts.setSuit(Suits.HEARTS);

		_jack_hearts = cardService.createEntity();
		_jack_hearts.setRank(Rank.JACK);
		_jack_hearts.setSuit(Suits.HEARTS);

		_queen_hearts = cardService.createEntity();
		_queen_hearts.setRank(Rank.QUEEN);
		_queen_hearts.setSuit(Suits.HEARTS);

		_king_hearts = cardService.createEntity();
		_king_hearts.setRank(Rank.KING);
		_king_hearts.setSuit(Suits.HEARTS);

		_ace_hearts = cardService.createEntity();
		_ace_hearts.setRank(Rank.ACE);
		_ace_hearts.setSuit(Suits.HEARTS);

		_7_clubs = cardService.createEntity();
		_7_clubs.setRank(Rank.SEVEN);
		_7_clubs.setSuit(Suits.CLUBS);

		_8_clubs = cardService.createEntity();
		_8_clubs.setRank(Rank.EIGHT);
		_8_clubs.setSuit(Suits.CLUBS);

		_9_clubs = cardService.createEntity();
		_9_clubs.setRank(Rank.NINE);
		_9_clubs.setSuit(Suits.CLUBS);

		_10_clubs = cardService.createEntity();
		_10_clubs.setRank(Rank.TEN);
		_10_clubs.setSuit(Suits.CLUBS);

		_jack_clubs = cardService.createEntity();
		_jack_clubs.setRank(Rank.JACK);
		_jack_clubs.setSuit(Suits.CLUBS);

		_king_clubs = cardService.createEntity();
		_king_clubs.setRank(Rank.KING);
		_king_clubs.setSuit(Suits.CLUBS);

		_king_spades = cardService.createEntity();
		_king_spades.setRank(Rank.KING);
		_king_spades.setSuit(Suits.SPADES);

		_king_diamonds = cardService.createEntity();
		_king_diamonds.setRank(Rank.KING);
		_king_diamonds.setSuit(Suits.DIAMONDS);

	}

	@Test
	// @Ignore
	public void testRoyalFlash() {
		List<ICard> cards = new ArrayList<>();
		cards.add(_10_hearts);
		cards.add(_jack_hearts);
		cards.add(_queen_hearts);
		cards.add(_king_hearts);
		cards.add(_ace_hearts);

		cards.add(_7_clubs);
		cards.add(_8_clubs);
		// add others

		assertEquals(CardsCombination.royal_flush, PokerLogicUtils.resolveCombination(cards));

	}

	@Test
	// @Ignore
	public void testStraigFlash() {
		List<ICard> cards = new ArrayList<>();
		cards.add(_7_clubs);
		cards.add(_8_clubs);
		cards.add(_9_clubs);
		cards.add(_10_clubs);
		cards.add(_jack_clubs);

		cards.add(_10_hearts);
		cards.add(_jack_hearts);

		assertEquals(CardsCombination.straight_flush, PokerLogicUtils.resolveCombination(cards));

	}

//	@Test
//	// @Ignore
//	public void fourOfAKind() {
//		List<ICard> cards = new ArrayList<>();
//		cards.add(_king_hearts);
//		cards.add(_king_clubs);
//		cards.add(_king_spades);
//		cards.add(_king_diamonds);
//		cards.add(_7_clubs);
//
//		cards.add(_10_hearts);
//		cards.add(_jack_hearts);
//
//		assertEquals(CardsCombination.four_of_a_kind, PokerLogicUtils.resolveCombination(cards));
//
//	}
//
//	@Test
//	// @Ignore
//	public void fullHouse() {
//		List<ICard> cards = new ArrayList<>();
//		cards.add(_king_hearts);
//		cards.add(_king_clubs);
//		cards.add(_king_spades);
//		cards.add(_10_hearts);
//		cards.add(_10_clubs);
//
//		cards.add(_7_clubs);
//		cards.add(_jack_hearts);
//
//		assertEquals(CardsCombination.full_house, PokerLogicUtils.resolveCombination(cards));
//
//	}
//
//	@Test
//	// @Ignore
//	public void flush() {
//		List<ICard> cards = new ArrayList<>();
//		cards.add(_jack_spades);
//		cards.add(_7_spades);
//		cards.add(_ace_spades);
//		cards.add(_2_spades);
//		cards.add(_9_spades);
//
//		cards.add(_king_hearts);
//		cards.add(_jack_hearts);
//
//		assertEquals(CardsCombination.flush, PokerLogicUtils.resolveCombination(cards));
//
//	}
//
//	@Test
//	// @Ignore
//	public void straight() {
//		List<ICard> cards = new ArrayList<>();
//		cards.add(_5_diamonds);
//		cards.add(_6_clubs);
//		cards.add(_7_spades);
//		cards.add(_8_hearts);
//		cards.add(_9_diamonds);
//
//		cards.add(_king_hearts);
//		cards.add(_jack_hearts);
//
//		assertEquals(CardsCombination.straight, PokerLogicUtils.resolveCombination(cards));
//
//	}
//
//	@Test
//	// @Ignore
//	public void threeOfAKind() {
//		List<ICard> cards = new ArrayList<>();
//		cards.add(_king_clubs);
//		cards.add(_king_hearts);
//		cards.add(_king_spades);
//		cards.add(_6_clubs);
//		cards.add(_9_diamonds);
//
//		cards.add(_2_spades);
//		cards.add(_jack_hearts);
//
//		assertEquals(CardsCombination.three_of_a_kind, PokerLogicUtils.resolveCombination(cards));
//
//	}
//
//	@Test
//	// @Ignore
//	public void twoPair() {
//		List<ICard> cards = new ArrayList<>();
//		cards.add(_king_clubs);
//		cards.add(_king_hearts);
//		cards.add(_10_hearts);
//		cards.add(_10_clubs);
//		cards.add(_9_diamonds);
//
//		cards.add(_2_spades);
//		cards.add(_jack_hearts);
//
//		assertEquals(CardsCombination.two_pair, PokerLogicUtils.resolveCombination(cards));
//
//	}
//
//	@Test
//	// @Ignore
//	public void pair() {
//		List<ICard> cards = new ArrayList<>();
//		cards.add(_king_clubs);
//		cards.add(_king_hearts);
//		cards.add(_7_clubs);
//		cards.add(_10_clubs);
//		cards.add(_9_diamonds);
//
//		cards.add(_2_spades);
//		cards.add(_jack_hearts);
//
//		assertEquals(CardsCombination.pair, PokerLogicUtils.resolveCombination(cards));
//
//	}
//
//	@Test
//	// @Ignore
//	public void highCard() {
//		List<ICard> cards = new ArrayList<>();
//		cards.add(_king_clubs);
//		cards.add(_5_diamonds);
//		cards.add(_7_clubs);
//		cards.add(_10_clubs);
//		cards.add(_9_diamonds);
//
//		cards.add(_2_spades);
//		cards.add(_jack_hearts);
//
//		assertEquals(CardsCombination.high_card, PokerLogicUtils.resolveCombination(cards));
//
//	}

}
