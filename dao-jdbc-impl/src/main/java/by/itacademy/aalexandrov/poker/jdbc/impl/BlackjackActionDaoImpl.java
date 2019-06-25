package by.itacademy.aalexandrov.poker.jdbc.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.IBlackjackActionDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IBlackjackAction;
import by.itacademy.aalexandrov.poker.dao.api.filter.BlackjackActionFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.BlackjackAction;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.PreparedStatementAction;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.SQLExecutionException;

public class BlackjackActionDaoImpl extends AbstractDaoImpl<IBlackjackAction, Integer> implements IBlackjackActionDao {
	
	@Override
	public IBlackjackAction createEntity() {
		return new BlackjackAction();
	}

	@Override
	public void insert(IBlackjackAction entity) {
		executeStatement(new PreparedStatementAction<IBlackjackAction>(
				String.format("insert into %s (bet, hit_me, stop, created, updated) values(?,?,?,?,?)",
						getTableName()),
				true) {
			@Override
			public IBlackjackAction doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setInt(1, entity.getBet());
				pStmt.setBoolean(2, entity.isHitMe());
				pStmt.setBoolean(3, entity.isStop());
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
	public void update(IBlackjackAction entity) {
		executeStatement(new PreparedStatementAction<IBlackjackAction>(String
				.format("update %s set bet=?, hit_me=?, stop=?, updated=? where id=?", getTableName())) {
			@Override
			public IBlackjackAction doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setInt(1, entity.getBet());
				pStmt.setBoolean(2, entity.isHitMe());
				pStmt.setBoolean(3, entity.isStop());
				pStmt.setObject(4, entity.getUpdated(), Types.TIMESTAMP);
				pStmt.setInt(5, entity.getId());

				pStmt.executeUpdate();
				return entity;
			}
		});

	}

	@Override
	protected String getTableName() {
		return "blackjack_action";
	}

	@Override
	protected IBlackjackAction parseRow(final ResultSet resultSet) throws SQLException {
		final IBlackjackAction entity = createEntity();
		entity.setId((Integer) resultSet.getObject("id"));
		entity.setBet(resultSet.getInt("bet"));
		entity.setHitMe(resultSet.getBoolean("hit_me"));
		entity.setStop(resultSet.getBoolean("stop"));
		entity.setUpdated(resultSet.getTimestamp("updated"));
		return entity;
	}

	@Override
	public void save(IBlackjackAction... entities) {
		try (Connection c = getConnection()) {
			c.setAutoCommit(false);
			try {

				for (IBlackjackAction entity : entities) {
					PreparedStatement pStmt = c.prepareStatement(String.format(
							"insert into %s (bet, hit_me, stop, created, updated) values(?,?,?,?,?)",
							getTableName()), Statement.RETURN_GENERATED_KEYS);

					pStmt.setInt(1, entity.getBet());
					pStmt.setBoolean(2, entity.isHitMe());
					pStmt.setBoolean(3, entity.isStop());
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
	public List<IBlackjackAction> find(BlackjackActionFilter filter) {
		final StringBuilder sqlTile = new StringBuilder("");
		appendSort(filter, sqlTile);
		appendPaging(filter, sqlTile);
		return executeFindQuery(sqlTile.toString());
	}

	@Override
	public long getCount(BlackjackActionFilter filter) {
		return executeCountQuery("");
	}

}
