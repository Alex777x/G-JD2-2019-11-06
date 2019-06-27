package by.itacademy.aalexandrov.poker.service;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayerCard;
import by.itacademy.aalexandrov.poker.dao.api.filter.PlayerCardFilter;

public interface IPlayerCardService {

	long getCount(PlayerCardFilter filter);

	List<IPlayerCard> find(PlayerCardFilter filter);

	void save(final IPlayerCard entity);

	void save(IPlayerCard... entities);

	List<IPlayerCard> getAll();

	void deleteAll();

	void delete(final Integer id);

	IPlayerCard get(final Integer id);

	IPlayerCard createEntity();

}
