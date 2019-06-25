package by.itacademy.aalexandrov.poker.jdbc.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.IBlackjackBoardDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IBlackjacBoard;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICard;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.filter.BlackjacBoardFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.BlackjackBoard;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.PreparedStatementAction;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.SQLExecutionException;

public class BlackjackBoardDaoImpl extends AbstractDaoImpl<IBlackjacBoard, Integer> implements IBlackjackBoardDao {
	
	@Override
	public IBlackjacBoard createEntity() {
		return new BlackjackBoard();
	}

	@Override
	public void insert(IBlackjacBoard entity) {
		executeStatement(new PreparedStatementAction<IBlackjacBoard>(
				String.format("insert into %s (game_id, card_id, created, updated) values(?,?,?,?)",
						getTableName()),
				true) {
			@Override
			public IBlackjacBoard doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setObject(1, entity.getGameId());
				pStmt.setObject(2, entity.getCardId());
				pStmt.setObject(3, entity.getCreated(), Types.TIMESTAMP);
				pStmt.setObject(4, entity.getUpdated(), Types.TIMESTAMP);

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
	public void update(IBlackjacBoard entity) {
		executeStatement(new PreparedStatementAction<IBlackjacBoard>(String
				.format("update %s set game_id=?, card_id=?, updated=? where id=?", getTableName())) {
			@Override
			public IBlackjacBoard doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setObject(1, entity.getGameId());
				pStmt.setObject(2, entity.getCardId());
				pStmt.setObject(3, entity.getUpdated(), Types.TIMESTAMP);
				pStmt.setInt(4, entity.getId());

				pStmt.executeUpdate();
				return entity;
			}
		});

	}

	@Override
	protected String getTableName() {
		return "blackjack_board";
	}

	@Override
	protected IBlackjacBoard parseRow(final ResultSet resultSet) throws SQLException {
		final IBlackjacBoard entity = createEntity();
		entity.setId((Integer) resultSet.getObject("id"));
		entity.setGameId((IGame) resultSet.getObject("game_id"));
		entity.setCardId((ICard) resultSet.getObject("card_id"));
		entity.setCreated(resultSet.getTimestamp("created"));
		entity.setUpdated(resultSet.getTimestamp("updated"));
		return entity;
	}

	@Override
	public void save(IBlackjacBoard... entities) {
		try (Connection c = getConnection()) {
			c.setAutoCommit(false);
			try {

				for (IBlackjacBoard entity : entities) {
					PreparedStatement pStmt = c.prepareStatement(String.format(
							"insert into %s (game_id, card_id, created, updated) values(?,?,?,?)",
							getTableName()), Statement.RETURN_GENERATED_KEYS);

					pStmt.setObject(1, entity.getGameId());
					pStmt.setObject(2, entity.getCardId());
					pStmt.setObject(3, entity.getCreated(), Types.TIMESTAMP);
					pStmt.setObject(4, entity.getUpdated(), Types.TIMESTAMP);

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
	public List<IBlackjacBoard> find(BlackjacBoardFilter filter) {
		final StringBuilder sqlTile = new StringBuilder("");
		appendSort(filter, sqlTile);
		appendPaging(filter, sqlTile);
		return executeFindQuery(sqlTile.toString());
	}

	@Override
	public long getCount(BlackjacBoardFilter filter) {
		return executeCountQuery("");
	}

}
