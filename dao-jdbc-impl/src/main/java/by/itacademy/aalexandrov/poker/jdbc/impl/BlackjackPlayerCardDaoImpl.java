package by.itacademy.aalexandrov.poker.jdbc.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.IBlackjackPlayerCardDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IBlackjackAction;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IBlackjackPlayerCard;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICard;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.dao.api.filter.BlackjackPlayerCardFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.BlackjackPlayerCard;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.PreparedStatementAction;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.SQLExecutionException;

public class BlackjackPlayerCardDaoImpl extends AbstractDaoImpl<IBlackjackPlayerCard, Integer> implements IBlackjackPlayerCardDao {
	
	@Override
	public IBlackjackPlayerCard createEntity() {
		return new BlackjackPlayerCard();
	}

	@Override
	public void insert(IBlackjackPlayerCard entity) {
		executeStatement(new PreparedStatementAction<IBlackjackPlayerCard>(
				String.format("insert into %s (player_id, card_id, blackjack_action_id, stack, created, updated) values(?,?,?,?,?,?)",
						getTableName()),
				true) {
			@Override
			public IBlackjackPlayerCard doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setObject(1, entity.getPlayerId());
				pStmt.setObject(2, entity.getCardId());
				pStmt.setObject(3, entity.getBlackjackActionId());
				pStmt.setDouble(4, entity.getStack());
				pStmt.setObject(5, entity.getCreated(), Types.TIMESTAMP);
				pStmt.setObject(6, entity.getUpdated(), Types.TIMESTAMP);

				pStmt.executeUpdate();

				final ResultSet rs = pStmt.getGeneratedKeys();
				rs.next();
				final int id = rs.getInt("id");

				rs.close();

				entity.setId(id);
				return entity;
			}
		});
	}

	@Override
	public void update(IBlackjackPlayerCard entity) {
		executeStatement(new PreparedStatementAction<IBlackjackPlayerCard>(String
				.format("update %s set player_id=?, card_id=?, blackjack_action_id=?, stack=?, updated=? where id=?", getTableName())) {
			@Override
			public IBlackjackPlayerCard doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setObject(1, entity.getPlayerId());
				pStmt.setObject(2, entity.getCardId());
				pStmt.setObject(3, entity.getBlackjackActionId());
				pStmt.setDouble(4, entity.getStack());
				pStmt.setObject(5, entity.getUpdated(), Types.TIMESTAMP);
				pStmt.setInt(6, entity.getId());

				pStmt.executeUpdate();
				return entity;
			}
		});

	}

	@Override
	protected String getTableName() {
		return "user_account";
	}

	@Override
	protected IBlackjackPlayerCard parseRow(final ResultSet resultSet) throws SQLException {
		final IBlackjackPlayerCard entity = createEntity();
		entity.setId((Integer) resultSet.getObject("id"));
		entity.setPlayerId((IPlayer) resultSet.getObject("player_id"));
		entity.setCardId((ICard) resultSet.getObject("card_id"));
		entity.setBlackjackActionId((IBlackjackAction) resultSet.getObject("blackjack_action_id"));
		entity.setStack(resultSet.getDouble("stack"));
		entity.setCreated(resultSet.getTimestamp("created"));
		entity.setUpdated(resultSet.getTimestamp("updated"));
		return entity;
	}

	@Override
	public void save(IBlackjackPlayerCard... entities) {
		try (Connection c = getConnection()) {
			c.setAutoCommit(false);
			try {

				for (IBlackjackPlayerCard entity : entities) {
					PreparedStatement pStmt = c.prepareStatement(String.format(
							"insert into %s (player_id, card_id, blackjack_action_id, stack, created, updated) values(?,?,?,?,?,?)",
							getTableName()), Statement.RETURN_GENERATED_KEYS);

					pStmt.setObject(1, entity.getPlayerId());
					pStmt.setObject(2, entity.getCardId());
					pStmt.setObject(3, entity.getBlackjackActionId());
					pStmt.setDouble(4, entity.getStack());
					pStmt.setObject(5, entity.getCreated(), Types.TIMESTAMP);
					pStmt.setObject(6, entity.getUpdated(), Types.TIMESTAMP);

					pStmt.executeUpdate();

					final ResultSet rs = pStmt.getGeneratedKeys();
					rs.next();
					final int id = rs.getInt("id");

					rs.close();
					pStmt.close();
					entity.setId(id);
				}

				// the same should be done in 'update' DAO method
				c.commit();
			} catch (final Exception e) {
				c.rollback();
				throw new RuntimeException(e);
			}

		} catch (final SQLException e) {
			throw new SQLExecutionException(e);
		}

	}

	@Override
	public List<IBlackjackPlayerCard> find(BlackjackPlayerCardFilter filter) {
		final StringBuilder sqlTile = new StringBuilder("");
		appendSort(filter, sqlTile);
		appendPaging(filter, sqlTile);
		return executeFindQuery(sqlTile.toString());
	}

	@Override
	public long getCount(BlackjackPlayerCardFilter filter) {
		return executeCountQuery("");
	}

}
