package by.itacademy.aalexandrov.poker.service;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICard;
import by.itacademy.aalexandrov.poker.dao.api.filter.CardFilter;

public interface ICardService {

	long getCount(CardFilter filter);

	List<ICard> find(CardFilter filter);
	
	void save(final ICard entity);

	void save(ICard... entities);

	List<ICard> getAll();

	void deleteAll();

	void delete(final Integer id);

	ICard get(final Integer id);

	ICard createEntity();

}
