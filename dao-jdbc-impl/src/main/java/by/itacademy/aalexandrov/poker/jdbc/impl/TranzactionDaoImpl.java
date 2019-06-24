package by.itacademy.aalexandrov.poker.jdbc.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.ITranzactionDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITranzaction;
import by.itacademy.aalexandrov.poker.dao.api.filter.TranzactionFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.Tranzaction;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.PreparedStatementAction;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.SQLExecutionException;

public class TranzactionDaoImpl extends AbstractDaoImpl<ITranzaction, Integer> implements ITranzactionDao {

	@Override
	public ITranzaction createEntity() {
		return new Tranzaction();
	}

	@Override
	public void insert(ITranzaction entity) {
		executeStatement(new PreparedStatementAction<ITranzaction>(
				String.format("insert into %s (amount, comment, created, updated) values(?,?,?,?)",
						getTableName()),
				true) {
			@Override
			public ITranzaction doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setDouble(1, entity.getAmount());
				pStmt.setString(2, entity.getComment());
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
	public void update(ITranzaction entity) {
		executeStatement(new PreparedStatementAction<ITranzaction>(String
				.format("update %s set amount=?, comment=?, updated=? where id=?", getTableName())) {
			@Override
			public ITranzaction doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setDouble(1, entity.getAmount());
				pStmt.setString(2, entity.getComment());
				pStmt.setObject(3, entity.getUpdated(), Types.TIMESTAMP);
				pStmt.setInt(4, entity.getId());

				pStmt.executeUpdate();
				return entity;
			}
		});

	}

	@Override
	protected String getTableName() {
		return "tranzaction";
	}

	@Override
	protected ITranzaction parseRow(final ResultSet resultSet) throws SQLException {
		final ITranzaction entity = createEntity();
		entity.setId((Integer) resultSet.getObject("id"));
		entity.setAmount(resultSet.getDouble("amount"));
		entity.setComment(resultSet.getString("comment"));
		entity.setCreated(resultSet.getTimestamp("created"));
		entity.setUpdated(resultSet.getTimestamp("updated"));
		return entity;
	}

	@Override
	public void save(ITranzaction... entities) {
		try (Connection c = getConnection()) {
			c.setAutoCommit(false);
			try {

				for (ITranzaction entity : entities) {
					PreparedStatement pStmt = c.prepareStatement(String.format(
							"insert into %s (amount, comment, created, updated) values(?,?,?,?)",
							getTableName()), Statement.RETURN_GENERATED_KEYS);

					pStmt.setDouble(1, entity.getAmount());
					pStmt.setString(2, entity.getComment());
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
	public List<ITranzaction> find(TranzactionFilter filter) {
		final StringBuilder sqlTile = new StringBuilder("");
		appendSort(filter, sqlTile);
		appendPaging(filter, sqlTile);
		return executeFindQuery(sqlTile.toString());
	}

	@Override
	public long getCount(TranzactionFilter filter) {
		return executeCountQuery("");
	}

}
