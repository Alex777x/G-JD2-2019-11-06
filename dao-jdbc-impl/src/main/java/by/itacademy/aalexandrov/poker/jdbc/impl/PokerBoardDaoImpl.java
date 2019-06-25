package by.itacademy.aalexandrov.poker.jdbc.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.IPokerBoardDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICard;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPokerBoard;
import by.itacademy.aalexandrov.poker.dao.api.filter.PokerBoardFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.PokerBoard;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.PreparedStatementAction;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.SQLExecutionException;

public class PokerBoardDaoImpl extends AbstractDaoImpl<IPokerBoard, Integer> implements IPokerBoardDao {
	
	@Override
	public IPokerBoard createEntity() {
		return new PokerBoard();
	}

	@Override
	public void insert(IPokerBoard entity) {
		executeStatement(new PreparedStatementAction<IPokerBoard>(
				String.format("insert into %s (flop_card1_id, flop_card2_id, flop_card3_id, turn_card_id, river_card_id, game_id, created, updated) values(?,?,?,?,?,?,?,?)",
						getTableName()),
				true) {
			@Override
			public IPokerBoard doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setObject(1, entity.getFlopCard1Id());
				pStmt.setObject(2, entity.getFlopCard2Id());
				pStmt.setObject(3, entity.getFlopCard3Id());
				pStmt.setObject(4, entity.getTurnCardId());
				pStmt.setObject(5, entity.getRiverCardId());
				pStmt.setObject(6, entity.getGameId());
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
	public void update(IPokerBoard entity) {
		executeStatement(new PreparedStatementAction<IPokerBoard>(String
				.format("update %s set flop_card1_id=?, flop_card2_id=?, flop_card3_id=?, turn_card_id=?, river_card_id=?, game_id=?, updated=? where id=?", getTableName())) {
			@Override
			public IPokerBoard doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setObject(1, entity.getFlopCard1Id());
				pStmt.setObject(2, entity.getFlopCard2Id());
				pStmt.setObject(3, entity.getFlopCard3Id());
				pStmt.setObject(4, entity.getTurnCardId());
				pStmt.setObject(5, entity.getRiverCardId());
				pStmt.setObject(6, entity.getGameId());
				pStmt.setObject(7, entity.getUpdated(), Types.TIMESTAMP);
				pStmt.setInt(8, entity.getId());

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
	protected IPokerBoard parseRow(final ResultSet resultSet) throws SQLException {
		final IPokerBoard entity = createEntity();
		entity.setId((Integer) resultSet.getObject("id"));
		entity.setFlopCard1Id((ICard) resultSet.getObject("flop_card1_id"));
		entity.setFlopCard2Id((ICard) resultSet.getObject("flop_card2_id"));
		entity.setFlopCard3Id((ICard) resultSet.getObject("flop_card3_id"));
		entity.setTurnCardId((ICard) resultSet.getObject("turn_card_id"));
		entity.setRiverCardId((ICard) resultSet.getObject("river_card_id"));
		entity.setGameId((IGame) resultSet.getObject("game_id"));
		entity.setCreated(resultSet.getTimestamp("created"));
		entity.setUpdated(resultSet.getTimestamp("updated"));
		return entity;
	}

	@Override
	public void save(IPokerBoard... entities) {
		try (Connection c = getConnection()) {
			c.setAutoCommit(false);
			try {

				for (IPokerBoard entity : entities) {
					PreparedStatement pStmt = c.prepareStatement(String.format(
							"insert into %s (flop_card1_id, flop_card2_id, flop_card3_id, turn_card_id, river_card_id, game_id, created, updated) values(?,?,?,?,?,?,?,?)",
							getTableName()), Statement.RETURN_GENERATED_KEYS);

					pStmt.setObject(1, entity.getFlopCard1Id());
					pStmt.setObject(2, entity.getFlopCard2Id());
					pStmt.setObject(3, entity.getFlopCard3Id());
					pStmt.setObject(4, entity.getTurnCardId());
					pStmt.setObject(5, entity.getRiverCardId());
					pStmt.setObject(6, entity.getGameId());
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
	public List<IPokerBoard> find(PokerBoardFilter filter) {
		final StringBuilder sqlTile = new StringBuilder("");
		appendSort(filter, sqlTile);
		appendPaging(filter, sqlTile);
		return executeFindQuery(sqlTile.toString());
	}

	@Override
	public long getCount(PokerBoardFilter filter) {
		return executeCountQuery("");
	}

}
