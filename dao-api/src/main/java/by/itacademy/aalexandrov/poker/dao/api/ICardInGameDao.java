package by.itacademy.aalexandrov.poker.dao.api;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICardInGame;
import by.itacademy.aalexandrov.poker.dao.api.filter.CardInGameFilter;

public interface ICardInGameDao extends IDao<ICardInGame, Integer> {

	List<ICardInGame> find(CardInGameFilter filter);

	long getCount(CardInGameFilter filter);

	void save(ICardInGame... entities);

	ICardInGame getFullInfo(Integer id);

	List<ICardInGame> getFullInfo();

}
