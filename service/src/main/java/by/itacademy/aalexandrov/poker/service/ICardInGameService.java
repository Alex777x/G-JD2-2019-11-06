package by.itacademy.aalexandrov.poker.service;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICardInGame;
import by.itacademy.aalexandrov.poker.dao.api.filter.CardInGameFilter;

public interface ICardInGameService {

	long getCount(CardInGameFilter filter);

	List<ICardInGame> find(CardInGameFilter filter);

	void save(final ICardInGame entity);

	void save(ICardInGame... entities);

	List<ICardInGame> getAll();

	void deleteAll();

	void delete(final Integer id);

	ICardInGame get(final Integer id);

	ICardInGame createEntity();

}
