package by.itacademy.aalexandrov.poker.jdbc.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.IPokerPlayerCardDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICard;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPokerPlayerCard;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.dao.api.filter.PokerPlayerCardFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.PokerPlayerCard;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.PreparedStatementAction;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.SQLExecutionException;

public class PokerPlayerCardDaoImpl extends AbstractDaoImpl<IPokerPlayerCard, Integer> implements IPokerPlayerCardDao {
	
	@Override
	public IPokerPlayerCard createEntity() {
		return new PokerPlayerCard();
	}

	@Override
	public void insert(IPokerPlayerCard entity) {
		executeStatement(new PreparedStatementAction<IPokerPlayerCard>(
				String.format("insert into %s (player_id, card1_id, card2_id, card_state, created, updated) values(?,?,?,?,?,?)",
						getTableName()),
				true) {
			@Override
			public IPokerPlayerCard doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setObject(1, entity.getPokerPlayerId());
				pStmt.setObject(2, entity.getCard1Id());
				pStmt.setObject(3, entity.getCard2Id());
				pStmt.setBoolean(4, entity.isCardState());
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
	public void update(IPokerPlayerCard entity) {
		executeStatement(new PreparedStatementAction<IPokerPlayerCard>(String
				.format("update %s set player_id=?, card1_id=?, card2_id=?, card_state=?, updated=? where id=?", getTableName())) {
			@Override
			public IPokerPlayerCard doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setObject(1, entity.getPokerPlayerId());
				pStmt.setObject(2, entity.getCard1Id());
				pStmt.setObject(3, entity.getCard2Id());
				pStmt.setBoolean(4, entity.isCardState());
				pStmt.setObject(5, entity.getUpdated(), Types.TIMESTAMP);
				pStmt.setInt(6, entity.getId());

				pStmt.executeUpdate();
				return entity;
			}
		});

	}

	@Override
	protected String getTableName() {
		return "poker_player_card";
	}

	@Override
	protected IPokerPlayerCard parseRow(final ResultSet resultSet) throws SQLException {
		final IPokerPlayerCard entity = createEntity();
		entity.setId((Integer) resultSet.getObject("id"));
		entity.setPokerPlayerId((IUserAccount) resultSet.getObject("player_id"));
		entity.setCard1Id((ICard) resultSet.getObject("card1_id"));
		entity.setCard2Id((ICard) resultSet.getObject("card2_id"));
		entity.setCardState(resultSet.getBoolean("card_state"));
		entity.setCreated(resultSet.getTimestamp("created"));
		entity.setUpdated(resultSet.getTimestamp("updated"));
		return entity;
	}

	@Override
	public void save(IPokerPlayerCard... entities) {
		try (Connection c = getConnection()) {
			c.setAutoCommit(false);
			try {

				for (IPokerPlayerCard entity : entities) {
					PreparedStatement pStmt = c.prepareStatement(String.format(
							"insert into %s (player_id, card1_id, card2_id, card_state, created, updated) values(?,?,?,?,?,?)",
							getTableName()), Statement.RETURN_GENERATED_KEYS);

					pStmt.setObject(1, entity.getPokerPlayerId());
					pStmt.setObject(2, entity.getCard1Id());
					pStmt.setObject(3, entity.getCard2Id());
					pStmt.setBoolean(4, entity.isCardState());
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
	public List<IPokerPlayerCard> find(PokerPlayerCardFilter filter) {
		final StringBuilder sqlTile = new StringBuilder("");
		appendSort(filter, sqlTile);
		appendPaging(filter, sqlTile);
		return executeFindQuery(sqlTile.toString());
	}

	@Override
	public long getCount(PokerPlayerCardFilter filter) {
		return executeCountQuery("");
	}

}
