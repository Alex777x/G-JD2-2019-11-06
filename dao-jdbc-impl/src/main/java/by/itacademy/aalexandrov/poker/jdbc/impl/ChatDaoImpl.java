package by.itacademy.aalexandrov.poker.jdbc.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.List;
import java.util.Set;

import by.itacademy.aalexandrov.poker.dao.api.IChatDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IChat;
import by.itacademy.aalexandrov.poker.dao.api.filter.ChatFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.Chat;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.Game;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.UserAccount;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.PreparedStatementAction;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.SQLExecutionException;

public class ChatDaoImpl extends AbstractDaoImpl<IChat, Integer> implements IChatDao {

	@Override
	public IChat createEntity() {
		return new Chat();
	}

	@Override
	public void insert(IChat entity) {
		executeStatement(new PreparedStatementAction<IChat>(
				String.format("insert into %s (game_id, user_account_id, message, created, updated) values(?,?,?,?,?)",
						getTableName()),
				true) {
			@Override
			public IChat doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setInt(1, entity.getGameId().getId());
				pStmt.setInt(2, entity.getUserAccountId().getId());
				pStmt.setString(3, entity.getMessage());
				pStmt.setObject(4, entity.getCreated(), Types.TIMESTAMP);
				pStmt.setObject(5, entity.getUpdated(), Types.TIMESTAMP);

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
	public void update(IChat entity) {
		executeStatement(new PreparedStatementAction<IChat>(String.format(
				"update %s set game_id=?, user_account_id=?, message=?, updated=? where id=?", getTableName())) {
			@Override
			public IChat doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setInt(1, entity.getGameId().getId());
				pStmt.setInt(2, entity.getUserAccountId().getId());
				pStmt.setString(3, entity.getMessage());
				pStmt.setObject(4, entity.getUpdated(), Types.TIMESTAMP);
				pStmt.setInt(5, entity.getId());

				pStmt.executeUpdate();
				return entity;
			}
		});

	}

	@Override
	protected String getTableName() {
		return "chat";
	}

	@Override
	protected IChat parseRow(final ResultSet resultSet, Set<String> columns) throws SQLException {
		final IChat entity = createEntity();
		entity.setId((Integer) resultSet.getObject("id"));
		entity.setMessage(resultSet.getString("message"));
		entity.setCreated(resultSet.getTimestamp("created"));
		entity.setUpdated(resultSet.getTimestamp("updated"));

		Integer gameId = (Integer) resultSet.getObject("game_id");
		if (gameId != null) {
			final Game game = new Game();
			game.setId(gameId);
			if (columns.contains("game_id")) {
				game.setBank(resultSet.getInt("game_id"));
			}
			entity.setGameId(game);
		}

		Integer userAccountId = (Integer) resultSet.getObject("user_account_id");
		if (userAccountId != null) {
			final UserAccount yserAccount = new UserAccount();
			yserAccount.setId(userAccountId);
			if (columns.contains("user_account_id")) {
				yserAccount.setNickname(resultSet.getString("user_account_id"));
			}
			entity.setUserAccountId(yserAccount);
		}

		return entity;
	}

	@Override
	public void save(IChat... entities) {
		try (Connection c = getConnection()) {
			c.setAutoCommit(false);
			try {

				for (IChat entity : entities) {
					PreparedStatement pStmt = c.prepareStatement(String.format(
							"insert into %s (game_id, user_account_id, message, created, updated) values(?,?,?,?,?)",
							getTableName()), Statement.RETURN_GENERATED_KEYS);

					pStmt.setInt(1, entity.getGameId().getId());
					pStmt.setInt(2, entity.getUserAccountId().getId());
					pStmt.setString(3, entity.getMessage());
					pStmt.setObject(4, entity.getCreated(), Types.TIMESTAMP);
					pStmt.setObject(5, entity.getUpdated(), Types.TIMESTAMP);

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
	public List<IChat> find(ChatFilter filter) {
		final StringBuilder sqlTile = new StringBuilder("");
		appendSort(filter, sqlTile);
		appendPaging(filter, sqlTile);
		return executeFindQuery(sqlTile.toString());
	}

	@Override
	public long getCount(ChatFilter filter) {
		return executeCountQuery("");
	}

}
