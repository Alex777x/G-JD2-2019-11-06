package by.itacademy.aalexandrov.poker.jdbc.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.List;
import java.util.Set;

import by.itacademy.aalexandrov.poker.dao.api.IPlayerCardDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayerCard;
import by.itacademy.aalexandrov.poker.dao.api.filter.PlayerCardFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.Card;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.PlayerCard;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.PreparedStatementAction;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.SQLExecutionException;

public class PlayerCardDaoImpl extends AbstractDaoImpl<IPlayerCard, Integer> implements IPlayerCardDao {

	@Override
	public IPlayerCard createEntity() {
		return new PlayerCard();
	}

	@Override
	public void insert(IPlayerCard entity) {
		executeStatement(new PreparedStatementAction<IPlayerCard>(
				String.format("insert into %s (card1_id, card2_id, card_state, created, updated) values(?,?,?,?,?)",
						getTableName()),
				true) {
			@Override
			public IPlayerCard doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setObject(1, entity.getCard1Id().getId());
				pStmt.setObject(2, entity.getCard2Id().getId());
				pStmt.setBoolean(3, entity.isCardState());
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
	public void update(IPlayerCard entity) {
		executeStatement(new PreparedStatementAction<IPlayerCard>(String
				.format("update %s set card1_id=?, card2_id=?, card_state=?, updated=? where id=?", getTableName())) {
			@Override
			public IPlayerCard doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setInt(1, entity.getCard1Id().getId());
				pStmt.setInt(2, entity.getCard2Id().getId());
				pStmt.setBoolean(3, entity.isCardState());
				pStmt.setObject(4, entity.getUpdated(), Types.TIMESTAMP);
				pStmt.setInt(5, entity.getId());

				pStmt.executeUpdate();
				return entity;
			}
		});

	}

	@Override
	protected String getTableName() {
		return "player_card";
	}

	@Override
	protected IPlayerCard parseRow(final ResultSet resultSet, Set<String> columns) throws SQLException {
		final IPlayerCard entity = createEntity();
		entity.setId((Integer) resultSet.getObject("id"));
		entity.setCardState(resultSet.getBoolean("card_state"));
		entity.setCreated(resultSet.getTimestamp("created"));
		entity.setUpdated(resultSet.getTimestamp("updated"));

		Integer card1Id = (Integer) resultSet.getObject("card1_id");
		if (card1Id != null) {
			final Card card = new Card();
			card.setId(card1Id);
			if (columns.contains("card1_id")) {
				card.setFilename(resultSet.getString("card1_id"));
			}
			entity.setCard1Id(card);
		}

		Integer card2Id = (Integer) resultSet.getObject("card2_id");
		if (card2Id != null) {
			final Card card = new Card();
			card.setId(card2Id);
			if (columns.contains("card2_id")) {
				card.setFilename(resultSet.getString("card2_id"));
			}
			entity.setCard2Id(card);
		}

		return entity;
	}

	@Override
	public void save(IPlayerCard... entities) {
		try (Connection c = getConnection()) {
			c.setAutoCommit(false);
			try {

				for (IPlayerCard entity : entities) {
					PreparedStatement pStmt = c.prepareStatement(String.format(
							"insert into %s (card1_id, card2_id, card_state, created, updated) values(?,?,?,?,?)",
							getTableName()), Statement.RETURN_GENERATED_KEYS);

					pStmt.setObject(1, entity.getCard1Id());
					pStmt.setObject(2, entity.getCard2Id());
					pStmt.setBoolean(3, entity.isCardState());
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
	public List<IPlayerCard> find(PlayerCardFilter filter) {
		final StringBuilder sqlTile = new StringBuilder("");
		appendSort(filter, sqlTile);
		appendPaging(filter, sqlTile);
		return executeFindQuery(sqlTile.toString());
	}

	@Override
	public long getCount(PlayerCardFilter filter) {
		return executeCountQuery("");
	}

}
