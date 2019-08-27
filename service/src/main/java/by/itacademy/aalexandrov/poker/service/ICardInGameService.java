package by.itacademy.aalexandrov.poker.service;

import java.util.List;

import javax.transaction.Transactional;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICardInGame;
import by.itacademy.aalexandrov.poker.dao.api.filter.CardInGameFilter;

public interface ICardInGameService {

	@Transactional
	long getCount(CardInGameFilter filter);

	@Transactional
	List<ICardInGame> find(CardInGameFilter filter);

	@Transactional
	void save(final ICardInGame entity);

	@Transactional
	void save(ICardInGame... entities);

	List<ICardInGame> getAll();

	@Transactional
	void deleteAll();

	@Transactional
	void delete(final Integer id);

	ICardInGame get(final Integer id);

	@Transactional
	ICardInGame createEntity();

	@Transactional
	ICardInGame getFullInfo(Integer id);

	@Transactional
	List<ICardInGame> getFullInfo();

	@Transactional
	List<ICardInGame> getAllCardsInGameByGame(Integer gameid);

}
