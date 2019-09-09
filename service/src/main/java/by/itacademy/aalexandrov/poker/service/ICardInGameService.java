package by.itacademy.aalexandrov.poker.service;

import java.util.List;

import javax.transaction.Transactional;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.CardStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICardInGame;
import by.itacademy.aalexandrov.poker.dao.api.filter.CardInGameFilter;

public interface ICardInGameService {

	long getCount(CardInGameFilter filter);

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

	ICardInGame getFullInfo(Integer id);

	List<ICardInGame> getFullInfo();

	List<ICardInGame> getAllCardsInGameByGame(Integer gameid, CardStatus indeck);

	List<ICardInGame> getPlayerCards(Integer id);

}
