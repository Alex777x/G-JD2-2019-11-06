package by.itacademy.aalexandrov.poker.jdbc.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.ICardDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.Rank;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.Suits;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICard;
import by.itacademy.aalexandrov.poker.dao.api.filter.CardFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.Card;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.PreparedStatementAction;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.SQLExecutionException;

public class CardDaoImpl extends AbstractDaoImpl<ICard, Integer> implements ICardDao {
	
	@Override
	public ICard createEntity() {
		return new Card();
	}

	@Override
	public void insert(ICard entity) {
		executeStatement(new PreparedStatementAction<ICard>(
				String.format("insert into %s (suite, rank, filename, created, updated) values(?,?,?,?,?)",
						getTableName()),
				true) {
			@Override
			public ICard doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setObject(1, entity.getSuit());
				pStmt.setObject(2, entity.getRank());
				pStmt.setString(3, entity.getFilename());
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
	public void update(ICard entity) {
		executeStatement(new PreparedStatementAction<ICard>(String
				.format("update %s set suite=?, rank=?, filename=?, updated=? where id=?", getTableName())) {
			@Override
			public ICard doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setObject(1, entity.getSuit());
				pStmt.setObject(2, entity.getRank());
				pStmt.setString(3, entity.getFilename());
				pStmt.setObject(4, entity.getUpdated(), Types.TIMESTAMP);
				pStmt.setInt(5, entity.getId());

				pStmt.executeUpdate();
				return entity;
			}
		});

	}

	@Override
	protected String getTableName() {
		return "card";
	}

	@Override
	protected ICard parseRow(final ResultSet resultSet) throws SQLException {
		final ICard entity = createEntity();
		entity.setId((Integer) resultSet.getObject("id"));
		entity.setSuit((Suits) resultSet.getObject("suite"));
		entity.setRank((Rank) resultSet.getObject("rank"));
		entity.setFilename(resultSet.getString("filename"));
		entity.setCreated(resultSet.getTimestamp("created"));
		entity.setUpdated(resultSet.getTimestamp("updated"));
		return entity;
	}

	@Override
	public void save(ICard... entities) {
		try (Connection c = getConnection()) {
			c.setAutoCommit(false);
			try {

				for (ICard entity : entities) {
					PreparedStatement pStmt = c.prepareStatement(String.format(
							"insert into %s (suite, rank, filename, created, updated) values(?,?,?,?,?,?,?,?,?,?)",
							getTableName()), Statement.RETURN_GENERATED_KEYS);

					pStmt.setObject(1, entity.getSuit());
					pStmt.setObject(2, entity.getRank());
					pStmt.setString(3, entity.getFilename());
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
	public List<ICard> find(CardFilter filter) {
		final StringBuilder sqlTile = new StringBuilder("");
		appendSort(filter, sqlTile);
		appendPaging(filter, sqlTile);
		return executeFindQuery(sqlTile.toString());
	}

	@Override
	public long getCount(CardFilter filter) {
		return executeCountQuery("");
	}

}
