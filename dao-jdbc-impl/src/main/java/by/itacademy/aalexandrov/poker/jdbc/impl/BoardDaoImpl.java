package by.itacademy.aalexandrov.poker.jdbc.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.List;
import java.util.Set;

import by.itacademy.aalexandrov.poker.dao.api.IBoardDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IBoard;
import by.itacademy.aalexandrov.poker.dao.api.filter.BoardFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.Board;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.Card;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.PreparedStatementAction;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.SQLExecutionException;

public class BoardDaoImpl extends AbstractDaoImpl<IBoard, Integer> implements IBoardDao {

	@Override
	public IBoard createEntity() {
		return new Board();
	}

	@Override
	public void insert(IBoard entity) {
		executeStatement(new PreparedStatementAction<IBoard>(String.format(
				"insert into %s (flop_card1_id, flop_card2_id, flop_card3_id, turn_card_id, river_card_id, created, updated) values(?,?,?,?,?,?,?)",
				getTableName()), true) {
			@Override
			public IBoard doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setInt(1, entity.getFlopCard1Id().getId());
				pStmt.setInt(2, entity.getFlopCard2Id().getId());
				pStmt.setInt(3, entity.getFlopCard3Id().getId());
				pStmt.setInt(4, entity.getTurnCardId().getId());
				pStmt.setInt(5, entity.getRiverCardId().getId());
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
	public void update(IBoard entity) {
		executeStatement(new PreparedStatementAction<IBoard>(String.format(
				"update %s set flop_card1_id=?, flop_card2_id=?, flop_card3_id=?, turn_card_id=?, river_card_id=?, updated=? where id=?",
				getTableName())) {
			@Override
			public IBoard doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setInt(1, entity.getFlopCard1Id().getId());
				pStmt.setInt(2, entity.getFlopCard2Id().getId());
				pStmt.setInt(3, entity.getFlopCard3Id().getId());
				pStmt.setInt(4, entity.getTurnCardId().getId());
				pStmt.setInt(5, entity.getRiverCardId().getId());
				pStmt.setObject(6, entity.getUpdated(), Types.TIMESTAMP);
				pStmt.setInt(7, entity.getId());

				pStmt.executeUpdate();
				return entity;
			}
		});

	}

	@Override
	protected String getTableName() {
		return "board";
	}

	@Override
	protected IBoard parseRow(final ResultSet resultSet, Set<String> columns) throws SQLException {
		final IBoard entity = createEntity();
		entity.setId((Integer) resultSet.getObject("id"));
		entity.setCreated(resultSet.getTimestamp("created"));
		entity.setUpdated(resultSet.getTimestamp("updated"));

		Integer flopCard1Id = (Integer) resultSet.getObject("flop_card1_id");
		if (flopCard1Id != null) {
			final Card card = new Card();
			card.setId(flopCard1Id);
			if (columns.contains("flop_card1_id")) {
				card.setFilename(resultSet.getString("flop_card1_id"));
			}
			entity.setFlopCard1Id(card);
		}

		Integer flopCard2Id = (Integer) resultSet.getObject("flop_card2_id");
		if (flopCard2Id != null) {
			final Card card = new Card();
			card.setId(flopCard2Id);
			if (columns.contains("flop_card2_id")) {
				card.setFilename(resultSet.getString("flop_card2_id"));
			}
			entity.setFlopCard2Id(card);
		}

		Integer flopCard3Id = (Integer) resultSet.getObject("flop_card3_id");
		if (flopCard3Id != null) {
			final Card card = new Card();
			card.setId(flopCard3Id);
			if (columns.contains("flop_card3_id")) {
				card.setFilename(resultSet.getString("flop_card3_id"));
			}
			entity.setFlopCard3Id(card);
		}

		Integer turnCardId = (Integer) resultSet.getObject("turn_card_id");
		if (turnCardId != null) {
			final Card card = new Card();
			card.setId(turnCardId);
			if (columns.contains("turn_card_id")) {
				card.setFilename(resultSet.getString("turn_card_id"));
			}
			entity.setTurnCardId(card);
		}

		Integer riverCardId = (Integer) resultSet.getObject("river_card_id");
		if (riverCardId != null) {
			final Card card = new Card();
			card.setId(riverCardId);
			if (columns.contains("river_card_id")) {
				card.setFilename(resultSet.getString("river_card_id"));
			}
			entity.setRiverCardId(card);
		}

		return entity;
	}

	@Override
	public void save(IBoard... entities) {
		try (Connection c = getConnection()) {
			c.setAutoCommit(false);
			try {

				for (IBoard entity : entities) {
					PreparedStatement pStmt = c.prepareStatement(String.format(
							"insert into %s (flop_card1_id, flop_card2_id, flop_card3_id, turn_card_id, river_card_id, created, updated) values(?,?,?,?,?,?,?)",
							getTableName()), Statement.RETURN_GENERATED_KEYS);

					pStmt.setObject(1, entity.getFlopCard1Id());
					pStmt.setObject(2, entity.getFlopCard2Id());
					pStmt.setObject(3, entity.getFlopCard3Id());
					pStmt.setObject(4, entity.getTurnCardId());
					pStmt.setObject(5, entity.getRiverCardId());
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
	public List<IBoard> find(BoardFilter filter) {
		final StringBuilder sqlTile = new StringBuilder("");
		appendSort(filter, sqlTile);
		appendPaging(filter, sqlTile);
		return executeFindQuery(sqlTile.toString());
	}

	@Override
	public long getCount(BoardFilter filter) {
		return executeCountQuery("");
	}

}
