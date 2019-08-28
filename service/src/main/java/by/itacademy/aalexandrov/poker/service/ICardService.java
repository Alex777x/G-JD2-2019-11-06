package by.itacademy.aalexandrov.poker.service;

import java.util.List;

import javax.transaction.Transactional;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICard;
import by.itacademy.aalexandrov.poker.dao.api.filter.CardFilter;

public interface ICardService {

	@Transactional
	long getCount(CardFilter filter);

	@Transactional
	List<ICard> find(CardFilter filter);

	@Transactional
	void save(final ICard entity);

	@Transactional
	void save(ICard... entities);

	List<ICard> getAll();

	@Transactional
	void deleteAll();

	@Transactional
	void delete(final Integer id);

	ICard get(final Integer id);

	@Transactional
	ICard createEntity();

	@Transactional
	List<ICard> getFullInfo();

	@Transactional
	ICard getFullInfo(Integer id);

}
