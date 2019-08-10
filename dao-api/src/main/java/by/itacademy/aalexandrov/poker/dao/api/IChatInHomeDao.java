package by.itacademy.aalexandrov.poker.dao.api;

import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IChatInHome;
import by.itacademy.aalexandrov.poker.dao.api.filter.ChatInHomeFilter;

public interface IChatInHomeDao extends IDao<IChatInHome, Integer> {

	List<IChatInHome> find(ChatInHomeFilter filter);

	long getCount(ChatInHomeFilter filter);

	void save(IChatInHome... entities);

	IChatInHome getFullInfo(Integer id);

	List<IChatInHome> getFullInfo();

}
