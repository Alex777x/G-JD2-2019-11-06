package by.itacademy.aalexandrov.poker.dao.orm.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import by.itacademy.aalexandrov.poker.dao.api.ICardInGameDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICardInGame;
import by.itacademy.aalexandrov.poker.dao.api.filter.CardInGameFilter;
import by.itacademy.aalexandrov.poker.dao.orm.impl.entity.CardInGame;

@Repository
public class CardInGameDaoImpl extends AbstractDaoImpl<ICardInGame, Integer> implements ICardInGameDao {

	protected CardInGameDaoImpl() {
		super(CardInGame.class);
	}

	@Override
	public ICardInGame createEntity() {
		return new CardInGame();
	}

	@Override
	public List<ICardInGame> find(CardInGameFilter filter) {
		throw new RuntimeException("not implemented");
	}

	@Override
	public long getCount(CardInGameFilter filter) {
		throw new RuntimeException("not implemented");
	}

	@Override
	public void save(ICardInGame... entities) {
		throw new RuntimeException("not implemented");
	}

}
