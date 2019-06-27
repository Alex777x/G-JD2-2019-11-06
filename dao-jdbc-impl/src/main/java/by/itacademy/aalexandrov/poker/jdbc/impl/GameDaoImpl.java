package by.itacademy.aalexandrov.poker.jdbc.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.IGameDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.GameStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IChat;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IBoard;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.dao.api.filter.GameFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.Game;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.PreparedStatementAction;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.SQLExecutionException;

public class GameDaoImpl extends AbstractDaoImpl<IGame, Integer> implements IGameDao {
	
	@Override
	public IGame createEntity() {
		return new Game();
	}

	@Override
	public void insert(IGame entity) {
		executeStatement(new PreparedStatementAction<IGame>(
				String.format("insert into %s (state, winner_id, next_step_performer_id, poker_board_id, bank, chat_id, created, updated) values(?,?,?,?,?,?,?,?)",
						getTableName()),
				true) {
			@Override
			public IGame doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setObject(1, entity.getGameStatus());
				pStmt.setObject(2, entity.getWinnerId());
				pStmt.setObject(3, entity.getNexStepPerformerId());
				pStmt.setObject(4, entity.getPokerBoardId());
				pStmt.setDouble(5, entity.getBank());
				pStmt.setObject(6, entity.getChatId());
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
	public void update(IGame entity) {
		executeStatement(new PreparedStatementAction<IGame>(String
				.format("update %s set state=?, winner_id=?, next_step_performer_id=?, poker_board_id=?, bank=?, chat_id=?, updated=? where id=?", getTableName())) {
			@Override
			public IGame doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setObject(1, entity.getGameStatus());
				pStmt.setObject(2, entity.getWinnerId());
				pStmt.setObject(3, entity.getNexStepPerformerId());
				pStmt.setObject(4, entity.getPokerBoardId());
				pStmt.setDouble(5, entity.getBank());
				pStmt.setObject(6, entity.getChatId());
				pStmt.setObject(7, entity.getUpdated(), Types.TIMESTAMP);
				pStmt.setInt(8, entity.getId());

				pStmt.executeUpdate();
				return entity;
			}
		});

	}

	@Override
	protected String getTableName() {
		return "game";
	}

	@Override
	protected IGame parseRow(final ResultSet resultSet) throws SQLException {
		final IGame entity = createEntity();
		entity.setId((Integer) resultSet.getObject("id"));
		entity.setGameStatus((GameStatus) resultSet.getObject("state"));
		entity.setWinnerId((IUserAccount) resultSet.getObject("winner_id"));
		entity.setNexStepPerformerId((IUserAccount) resultSet.getObject("next_step_performer_id"));
		entity.setPokerBoardId((IBoard) resultSet.getObject("poker_board_id"));
		entity.setBank(resultSet.getDouble("bank"));
		entity.setChatId((IChat) resultSet.getObject("chat_id"));
		entity.setCreated(resultSet.getTimestamp("created"));
		entity.setUpdated(resultSet.getTimestamp("updated"));
		return entity;
	}

	@Override
	public void save(IGame... entities) {
		try (Connection c = getConnection()) {
			c.setAutoCommit(false);
			try {

				for (IGame entity : entities) {
					PreparedStatement pStmt = c.prepareStatement(String.format(
							"insert into %s (state, winner_id, next_step_performer_id, poker_board_id, bank, chat_id, created, updated) values(?,?,?,?,?,?,?,?)",
							getTableName()), Statement.RETURN_GENERATED_KEYS);

					pStmt.setObject(1, entity.getGameStatus());
					pStmt.setObject(2, entity.getWinnerId());
					pStmt.setObject(3, entity.getNexStepPerformerId());
					pStmt.setObject(4, entity.getPokerBoardId());
					pStmt.setDouble(5, entity.getBank());
					pStmt.setObject(6, entity.getChatId());
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
	public List<IGame> find(GameFilter filter) {
		final StringBuilder sqlTile = new StringBuilder("");
		appendSort(filter, sqlTile);
		appendPaging(filter, sqlTile);
		return executeFindQuery(sqlTile.toString());
	}

	@Override
	public long getCount(GameFilter filter) {
		return executeCountQuery("");
	}

}
