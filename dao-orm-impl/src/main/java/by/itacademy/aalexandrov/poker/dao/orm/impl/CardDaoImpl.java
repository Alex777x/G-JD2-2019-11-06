package by.itacademy.aalexandrov.poker.dao.orm.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import by.itacademy.aalexandrov.poker.dao.api.ICardDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICard;
import by.itacademy.aalexandrov.poker.dao.api.filter.CardFilter;
import by.itacademy.aalexandrov.poker.dao.orm.impl.entity.Card;

@Repository
public class CardDaoImpl extends AbstractDaoImpl<ICard, Integer> implements ICardDao {

	protected CardDaoImpl() {
		super(Card.class);
	}

	@Override
	public ICard createEntity() {
		return new Card();
	}

	@Override
	public List<ICard> find(CardFilter filter) {
		throw new RuntimeException("not implemented");
	}

	@Override
	public long getCount(CardFilter filter) {
		throw new RuntimeException("not implemented");
	}

	@Override
	public void save(ICard... entities) {
		throw new RuntimeException("not implemented");
	}

}
