package by.itacademy.aalexandrov.poker.jdbc.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.List;
import java.util.Set;

import by.itacademy.aalexandrov.poker.dao.api.IPlayerActionDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayerAction;
import by.itacademy.aalexandrov.poker.dao.api.filter.PlayerActionFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.Player;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.PlayerAction;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.PreparedStatementAction;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.SQLExecutionException;

public class PlayerActionDaoImpl extends AbstractDaoImpl<IPlayerAction, Integer> implements IPlayerActionDao {

	@Override
	public IPlayerAction createEntity() {
		return new PlayerAction();
	}

	@Override
	public void insert(IPlayerAction entity) {
		executeStatement(new PreparedStatementAction<IPlayerAction>(String.format(
				"insert into %s (player_id, bet, call, raise, fold, check_check, all_in, created, updated) values(?,?,?,?,?,?,?,?,?)",
				getTableName()), true) {
			@Override
			public IPlayerAction doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setInt(1, entity.getPlayerId().getId());
				pStmt.setInt(2, entity.getBet());
				pStmt.setInt(3, entity.getCall());
				pStmt.setInt(4, entity.getRaise());
				pStmt.setBoolean(5, entity.isFold());
				pStmt.setBoolean(6, entity.isCheck());
				pStmt.setInt(7, entity.getAllIn());
				pStmt.setObject(8, entity.getCreated(), Types.TIMESTAMP);
				pStmt.setObject(9, entity.getUpdated(), Types.TIMESTAMP);

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
	public void update(IPlayerAction entity) {
		executeStatement(new PreparedStatementAction<IPlayerAction>(String.format(
				"update %s set player_id=?, bet=?, call=?, raise=?, fold=?, check_check=?, all_in=?, updated=? where id=?",
				getTableName())) {
			@Override
			public IPlayerAction doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setInt(1, entity.getPlayerId().getId());
				pStmt.setInt(2, entity.getBet());
				pStmt.setInt(3, entity.getCall());
				pStmt.setInt(4, entity.getRaise());
				pStmt.setBoolean(5, entity.isFold());
				pStmt.setBoolean(6, entity.isCheck());
				pStmt.setInt(7, entity.getAllIn());
				pStmt.setObject(8, entity.getUpdated(), Types.TIMESTAMP);
				pStmt.setInt(9, entity.getId());

				pStmt.executeUpdate();
				return entity;
			}
		});

	}

	@Override
	protected String getTableName() {
		return "action";
	}

	@Override
	protected IPlayerAction parseRow(final ResultSet resultSet, Set<String> columns) throws SQLException {
		final IPlayerAction entity = createEntity();
		entity.setId((Integer) resultSet.getObject("id"));
		entity.setBet(resultSet.getInt("bet"));
		entity.setCall(resultSet.getInt("call"));
		entity.setRaise(resultSet.getInt("raise"));
		entity.setFold(resultSet.getBoolean("fold"));
		entity.setCheck(resultSet.getBoolean("check_check"));
		entity.setAllIn(resultSet.getInt("all_in"));
		entity.setCreated(resultSet.getTimestamp("created"));
		entity.setUpdated(resultSet.getTimestamp("updated"));

		Integer playerId = (Integer) resultSet.getObject("player_id");
		if (playerId != null) {
			final IPlayer player = new Player();
			player.setId(playerId);
			if (columns.contains("player_id")) {
				player.setInGame(resultSet.getBoolean("player_id"));
				player.setStack(resultSet.getDouble("player_id"));
			}
			entity.setPlayerId(player);
		}
		return entity;
	}

	@Override
	public void save(IPlayerAction... entities) {
		try (Connection c = getConnection()) {
			c.setAutoCommit(false);
			try {

				for (IPlayerAction entity : entities) {
					PreparedStatement pStmt = c.prepareStatement(String.format(
							"insert into %s (player_id, bet, call, raise, fold, check_check, all_in, created, updated) values(?,?,?,?,?,?,?,?)",
							getTableName()), Statement.RETURN_GENERATED_KEYS);

					pStmt.setInt(1, entity.getPlayerId().getId());
					pStmt.setInt(2, entity.getBet());
					pStmt.setInt(3, entity.getCall());
					pStmt.setInt(4, entity.getRaise());
					pStmt.setBoolean(5, entity.isFold());
					pStmt.setBoolean(6, entity.isCheck());
					pStmt.setInt(7, entity.getAllIn());
					pStmt.setObject(8, entity.getCreated(), Types.TIMESTAMP);
					pStmt.setObject(9, entity.getUpdated(), Types.TIMESTAMP);

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
	public List<IPlayerAction> find(PlayerActionFilter filter) {
		final StringBuilder sqlTile = new StringBuilder("");
		appendSort(filter, sqlTile);
		appendPaging(filter, sqlTile);
		return executeFindQuery(sqlTile.toString());
	}

	@Override
	public long getCount(PlayerActionFilter filter) {
		return executeCountQuery("");
	}

}
