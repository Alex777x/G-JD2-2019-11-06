package by.itacademy.aalexandrov.poker.jdbc.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Repository;

import by.itacademy.aalexandrov.poker.dao.api.IPlayerDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerPosition;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.PlayerStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.dao.api.filter.PlayerFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.Game;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.Player;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.UserAccount;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.PreparedStatementAction;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.SQLExecutionException;

@Repository
public class PlayerDaoImpl extends AbstractDaoImpl<IPlayer, Integer> implements IPlayerDao {

	@Override
	public IPlayer createEntity() {
		return new Player();
	}

	@Override
	public void insert(IPlayer entity) {
		executeStatement(new PreparedStatementAction<IPlayer>(String.format(
				"insert into %s ( game_id, user_account_id, position_id, in_game, state, stack, created, updated) values(?,?,?,?,?,?,?,?)",
				getTableName()), true) {
			@Override
			public IPlayer doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setInt(1, entity.getGameId().getId());
				pStmt.setInt(2, entity.getUserAccountId().getId());
				pStmt.setString(3, entity.getPositionId().name());
				pStmt.setBoolean(4, entity.isInGame());
				pStmt.setString(5, entity.getState().name());
				pStmt.setDouble(6, entity.getStack());
				pStmt.setObject(7, entity.getCreated(), Types.TIMESTAMP);
				pStmt.setObject(8, entity.getUpdated(), Types.TIMESTAMP);

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
		executeStatement(new PreparedStatementAction<IPlayer>(String.format(
				"update %s set game_id=?, user_account_id=?, position_id=?, in_game=?, state=?, stack=?, updated=? where id=?",
				getTableName())) {
			@Override
			public IPlayer doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setInt(1, entity.getGameId().getId());
				pStmt.setInt(2, entity.getUserAccountId().getId());
				pStmt.setString(3, entity.getPositionId().name());
				pStmt.setBoolean(4, entity.isInGame());
				pStmt.setString(5, entity.getState().name());
				pStmt.setDouble(6, entity.getStack());
				pStmt.setObject(7, entity.getUpdated(), Types.TIMESTAMP);
				pStmt.setInt(8, entity.getId());

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
	protected IPlayer parseRow(final ResultSet resultSet, Set<String> columns) throws SQLException {
		final IPlayer entity = createEntity();
		entity.setId((Integer) resultSet.getObject("id"));
		entity.setPositionId(PlayerPosition.valueOf(resultSet.getString("position_id")));
		entity.setInGame(resultSet.getBoolean("in_game"));
		entity.setState(PlayerStatus.valueOf(resultSet.getString("state")));
		entity.setStack(resultSet.getDouble("stack"));
		entity.setCreated(resultSet.getTimestamp("created"));
		entity.setUpdated(resultSet.getTimestamp("updated"));

		Integer userAccountId = (Integer) resultSet.getObject("user_account_id");
		if (userAccountId != null) {
			final UserAccount userAccount = new UserAccount();
			userAccount.setId(userAccountId);
			if (columns.contains("user_account_id")) {
				userAccount.setNickname(resultSet.getString("user_account_id"));
				userAccount.setPassword(resultSet.getString("user_account_id"));
				userAccount.setEmail(resultSet.getString("user_account_id"));
				userAccount.setFoto(resultSet.getString("user_account_id"));
			}
			entity.setUserAccountId(userAccount);
		}

		Integer gameId = (Integer) resultSet.getObject("game_id");
		if (gameId != null) {
			final IGame game = new Game();
			game.setId(gameId);
			if (columns.contains("game_id")) {
				game.setBank(resultSet.getDouble("game_id"));
			}
			entity.setGameId(game);
		}

		return entity;
	}

	@Override
	public void save(IPlayer... entities) {
		try (Connection c = getConnection()) {
			c.setAutoCommit(false);
			try {

				for (IPlayer entity : entities) {
					PreparedStatement pStmt = c.prepareStatement(String.format(
							"insert into %s (game_id, user_account_id, position_id, in_game, state, stack, created, updated) values(?,?,?,?,?,?,?,?)",
							getTableName()), Statement.RETURN_GENERATED_KEYS);

					pStmt.setInt(1, entity.getGameId().getId());
					pStmt.setInt(2, entity.getUserAccountId().getId());
					pStmt.setString(3, entity.getPositionId().name());
					pStmt.setBoolean(4, entity.isInGame());
					pStmt.setString(5, entity.getState().name());
					pStmt.setDouble(6, entity.getStack());
					pStmt.setObject(7, entity.getCreated(), Types.TIMESTAMP);
					pStmt.setObject(8, entity.getUpdated(), Types.TIMESTAMP);

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
