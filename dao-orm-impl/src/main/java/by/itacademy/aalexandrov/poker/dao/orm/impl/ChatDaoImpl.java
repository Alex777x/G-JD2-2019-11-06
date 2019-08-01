package by.itacademy.aalexandrov.poker.dao.orm.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import by.itacademy.aalexandrov.poker.dao.api.IChatDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IChat;
import by.itacademy.aalexandrov.poker.dao.api.filter.ChatFilter;
import by.itacademy.aalexandrov.poker.dao.orm.impl.entity.Chat;

@Repository
public class ChatDaoImpl extends AbstractDaoImpl<IChat, Integer> implements IChatDao {

	protected ChatDaoImpl() {
		super(Chat.class);
	}

	@Override
	public IChat createEntity() {
		return new Chat();
	}

	@Override
	public List<IChat> find(ChatFilter filter) {
		throw new RuntimeException("not implemented");
	}

	@Override
	public long getCount(ChatFilter filter) {
		throw new RuntimeException("not implemented");
	}

	@Override
	public void save(IChat... entities) {
		throw new RuntimeException("not implemented");
	}

}
