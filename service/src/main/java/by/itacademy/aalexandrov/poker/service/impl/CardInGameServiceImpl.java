package by.itacademy.aalexandrov.poker.service.impl;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import by.itacademy.aalexandrov.poker.dao.api.ICardInGameDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.CardStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICardInGame;
import by.itacademy.aalexandrov.poker.dao.api.filter.CardInGameFilter;
import by.itacademy.aalexandrov.poker.service.ICardInGameService;

@Service
public class CardInGameServiceImpl implements ICardInGameService {

	private static final Logger LOGGER = LoggerFactory.getLogger(CardInGameServiceImpl.class);

	private ICardInGameDao dao;

	@Autowired
	public CardInGameServiceImpl(ICardInGameDao dao) {
		super();
		this.dao = dao;
	}

	@Override
	public ICardInGame createEntity() {
		return dao.createEntity();
	}

	@Override
	public void save(final ICardInGame entity) {
		final Date modifedOn = new Date();
		entity.setUpdated(modifedOn);
		if (entity.getId() == null) {
			LOGGER.info("new CardInGame created: {}", entity);
			entity.setCreated(modifedOn);
			dao.insert(entity);
		} else {
			LOGGER.info("new CardInGame updated: {}", entity);
			dao.update(entity);
		}
	}

	@Override
	public void save(ICardInGame... entities) {
		Date modified = new Date();
		for (ICardInGame iCardInGame : entities) {

			iCardInGame.setUpdated(modified);
			iCardInGame.setCreated(modified);

		}

		dao.save(entities);
	}

	@Override
	public ICardInGame get(final Integer id) {
		final ICardInGame entity = dao.get(id);
		LOGGER.debug("entityById: {}", entity);
		return entity;
	}

	@Override
	public void delete(final Integer id) {
		LOGGER.info("delete entity: {}", id);
		dao.delete(id);
	}

	@Override
	public void deleteAll() {
		LOGGER.info("delete all CardInGames");
		dao.deleteAll();
	}

	@Override
	public List<ICardInGame> getAll() {
		final List<ICardInGame> all = dao.selectAll();
		LOGGER.debug("total count in DB: {}", all.size());
		return all;
	}

	@Override
	public List<ICardInGame> find(CardInGameFilter filter) {
		return dao.find(filter);
	}

	@Override
	public long getCount(CardInGameFilter filter) {
		return dao.getCount(filter);
	}

	@Override
	public ICardInGame getFullInfo(Integer id) {
		return dao.getFullInfo(id);
	}

	@Override
	public List<ICardInGame> getFullInfo() {
		return dao.getFullInfo();
	}

	@Override
	public List<ICardInGame> getAllCardsInGameByGame(Integer gameid, CardStatus indeck) {
		return dao.getAllCardsInGameByGame(gameid, indeck);
	}

	@Override
	public List<ICardInGame> getPlayerCards(Integer id) {
		return dao.getPlayerCards(id);
	}

	@Override
	public void deleteDeckForGame(Integer id) {
		LOGGER.info("delete all CardInGames for Game");
		dao.deleteDeckForGame(id);

	}

}
