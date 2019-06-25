package by.itacademy.aalexandrov.poker.service;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IBlackjackPlayerCard;
import by.itacademy.aalexandrov.poker.dao.api.filter.BlackjackPlayerCardFilter;

public interface IBlackjackPlayerCardService {

	long getCount(BlackjackPlayerCardFilter filter);

	List<IBlackjackPlayerCard> find(BlackjackPlayerCardFilter filter);

	void save(IBlackjackPlayerCard... entities);

	List<IBlackjackPlayerCard> getAll();

	void deleteAll();

	void delete(final Integer id);

	IBlackjackPlayerCard get(final Integer id);

	void save(final IBlackjackPlayerCard entity);

	IBlackjackPlayerCard createEntity();

}
