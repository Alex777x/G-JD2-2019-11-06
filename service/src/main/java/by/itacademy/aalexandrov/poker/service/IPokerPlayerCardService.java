package by.itacademy.aalexandrov.poker.service;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPokerPlayerCard;
import by.itacademy.aalexandrov.poker.dao.api.filter.PokerPlayerCardFilter;

public interface IPokerPlayerCardService {

	long getCount(PokerPlayerCardFilter filter);

	List<IPokerPlayerCard> find(PokerPlayerCardFilter filter);

	void save(IPokerPlayerCard... entities);

	List<IPokerPlayerCard> getAll();

	void deleteAll();

	void delete(final Integer id);

	IPokerPlayerCard get(final Integer id);

	void save(final IPokerPlayerCard entity);

	IPokerPlayerCard createEntity();

}
