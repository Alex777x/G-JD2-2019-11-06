package by.itacademy.aalexandrov.poker.jdbc.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.IPlayerDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPokerAction;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.dao.api.filter.PlayerFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.Player;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.PreparedStatementAction;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.SQLExecutionException;

public class PlayerDaoImpl extends AbstractDaoImpl<IPlayer, Integer> implements IPlayerDao {
	
	@Override
	public IPlayer createEntity() {
		return new Player();
	}

	@Override
	public void insert(IPlayer entity) {
		executeStatement(new PreparedStatementAction<IPlayer>(
				String.format("insert into %s (user_account_id, game_id, dealer, stack, poker_action_id, created, updated) values(?,?,?,?,?,?,?)",
						getTableName()),
				true) {
			@Override
			public IPlayer doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setObject(1, entity.getUserAccountId());
				pStmt.setObject(2, entity.getGameId());
				pStmt.setBoolean(3, entity.isDealer());
				pStmt.setDouble(4, entity.getStack());
				pStmt.setObject(5, entity.getPokerActionId());
				pStmt.setObject(6, entity.getCreated(), Types.TIMESTAMP);
				pStmt.setObject(7, entity.getUpdated(), Types.TIMESTAMP);

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
	public void update(IPlayer entity) {
		executeStatement(new PreparedStatementAction<IPlayer>(String
				.format("update %s set user_account_id=?, game_id=?, dealer=?, stack=?, poker_action_id=?, updated=? where id=?", getTableName())) {
			@Override
			public IPlayer doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setObject(1, entity.getUserAccountId());
				pStmt.setObject(2, entity.getGameId());
				pStmt.setBoolean(3, entity.isDealer());
				pStmt.setDouble(4, entity.getStack());
				pStmt.setObject(5, entity.getPokerActionId());
				pStmt.setObject(6, entity.getUpdated(), Types.TIMESTAMP);
				pStmt.setInt(7, entity.getId());

				pStmt.executeUpdate();
				return entity;
			}
		});

	}

	@Override
	protected String getTableName() {
		return "player";
	}

	@Override
	protected IPlayer parseRow(final ResultSet resultSet) throws SQLException {
		final IPlayer entity = createEntity();
		entity.setId((Integer) resultSet.getObject("id"));
		entity.setUserAccountId((IUserAccount) resultSet.getObject("user_account_id"));
		entity.setGameId((IGame) resultSet.getObject("game_id"));
		entity.setDealer(resultSet.getBoolean("dealer"));
		entity.setStack(resultSet.getDouble("stack"));
		entity.setPokerActionId((IPokerAction) resultSet.getObject("poker_action_id"));
		entity.setCreated(resultSet.getTimestamp("created"));
		entity.setUpdated(resultSet.getTimestamp("updated"));
		return entity;
	}

	@Override
	public void save(IPlayer... entities) {
		try (Connection c = getConnection()) {
			c.setAutoCommit(false);
			try {

				for (IPlayer entity : entities) {
					PreparedStatement pStmt = c.prepareStatement(String.format(
							"insert into %s (user_account_id, game_id, dealer, stack, poker_action_id, created, updated) values(?,?,?,?,?,?,?)",
							getTableName()), Statement.RETURN_GENERATED_KEYS);

					pStmt.setObject(1, entity.getUserAccountId());
					pStmt.setObject(2, entity.getGameId());
					pStmt.setBoolean(3, entity.isDealer());
					pStmt.setDouble(4, entity.getStack());
					pStmt.setObject(5, entity.getPokerActionId());
					pStmt.setObject(6, entity.getCreated(), Types.TIMESTAMP);
					pStmt.setObject(7, entity.getUpdated(), Types.TIMESTAMP);

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
	public List<IPlayer> find(PlayerFilter filter) {
		final StringBuilder sqlTile = new StringBuilder("");
		appendSort(filter, sqlTile);
		appendPaging(filter, sqlTile);
		return executeFindQuery(sqlTile.toString());
	}

	@Override
	public long getCount(PlayerFilter filter) {
		return executeCountQuery("");
	}

}
