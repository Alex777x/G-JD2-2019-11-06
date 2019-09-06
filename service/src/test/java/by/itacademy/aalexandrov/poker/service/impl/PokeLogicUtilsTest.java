package by.itacademy.aalexandrov.poker.service.impl;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.jupiter.api.BeforeEach;

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

	@BeforeEach
	public void setupCards() {
		_10_hearts = cardService.createEntity();
		_10_hearts.setRank(Rank.TEN);
		_10_hearts.setSuit(Suits.HEARTS);
		_jack_hearts.setRank(Rank.JACK);
		_jack_hearts.setSuit(Suits.HEARTS);
		_queen_hearts.setRank(Rank.QUEEN);
		_queen_hearts.setSuit(Suits.HEARTS);
		_king_hearts.setRank(Rank.KING);
		_king_hearts.setSuit(Suits.HEARTS);
		_ace_hearts.setRank(Rank.ACE);
		_ace_hearts.setSuit(Suits.HEARTS);
		_7_clubs.setRank(Rank.SEVEN);
		_7_clubs.setSuit(Suits.CLUBS);
		_8_clubs.setRank(Rank.EIGHT);
		_8_clubs.setSuit(Suits.CLUBS);
		_9_clubs.setRank(Rank.NINE);
		_10_clubs.setRank(Rank.TEN);
		_10_clubs.setSuit(Suits.CLUBS);
		_jack_clubs.setRank(Rank.JACK);
		_jack_clubs.setSuit(Suits.CLUBS);
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

		assertEquals(CardsCombination.straight_flush, PokerLogicUtils.resolveCombination(cards));

	}
}
