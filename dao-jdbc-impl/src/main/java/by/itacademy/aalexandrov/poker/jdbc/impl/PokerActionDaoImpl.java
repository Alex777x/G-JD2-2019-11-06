package by.itacademy.aalexandrov.poker.jdbc.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.IPokerActionDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPokerAction;
import by.itacademy.aalexandrov.poker.dao.api.filter.PokerActionFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.PokerAction;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.PreparedStatementAction;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.SQLExecutionException;

public class PokerActionDaoImpl extends AbstractDaoImpl<IPokerAction, Integer> implements IPokerActionDao {

	@Override
	public IPokerAction createEntity() {
		return new PokerAction();
	}

	@Override
	public void insert(IPokerAction entity) {
		executeStatement(new PreparedStatementAction<IPokerAction>(
				String.format("insert into %s (bet, call, raise, fold, check, va_bank, small_blind, big_blind, created, updated) values(?,?,?,?,?,?,?,?,?,?)",
						getTableName()),
				true) {
			@Override
			public IPokerAction doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setInt(1, entity.getBet());
				pStmt.setInt(2, entity.getCall());
				pStmt.setInt(3, entity.getRaise());
				pStmt.setBoolean(4, entity.isFold());
				pStmt.setBoolean(5, entity.isCheck());
				pStmt.setInt(6, entity.getVaBank());
				pStmt.setBoolean(7, entity.isSmallBlind());
				pStmt.setBoolean(8, entity.isBigBlind());
				pStmt.setObject(9, entity.getCreated(), Types.TIMESTAMP);
				pStmt.setObject(10, entity.getUpdated(), Types.TIMESTAMP);

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
	public void update(IPokerAction entity) {
		executeStatement(new PreparedStatementAction<IPokerAction>(String
				.format("update %s set bet=?, call=?, raise=?, fold=?, check=?, va_bank=?, small_blind=?, big_blind=?, updated=? where id=?", getTableName())) {
			@Override
			public IPokerAction doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setInt(1, entity.getBet());
				pStmt.setInt(2, entity.getCall());
				pStmt.setInt(3, entity.getRaise());
				pStmt.setBoolean(4, entity.isFold());
				pStmt.setBoolean(5, entity.isCheck());
				pStmt.setInt(6, entity.getVaBank());
				pStmt.setBoolean(7, entity.isSmallBlind());
				pStmt.setBoolean(8, entity.isBigBlind());
				pStmt.setObject(9, entity.getUpdated(), Types.TIMESTAMP);
				pStmt.setInt(10, entity.getId());

				pStmt.executeUpdate();
				return entity;
			}
		});

	}

	@Override
	protected String getTableName() {
		return "poker_action";
	}

	@Override
	protected IPokerAction parseRow(final ResultSet resultSet) throws SQLException {
		final IPokerAction entity = createEntity();
		entity.setId((Integer) resultSet.getObject("id"));
		entity.setBet(resultSet.getInt("bet"));
		entity.setCall(resultSet.getInt("call"));
		entity.setRaise(resultSet.getInt("raise"));
		entity.setFold(resultSet.getBoolean("fold"));
		entity.setCheck(resultSet.getBoolean("check"));
		entity.setVaBank(resultSet.getInt("va_bank"));
		entity.setSmallBlind(resultSet.getBoolean("small_blind"));
		entity.setBigBlind(resultSet.getBoolean("big_blind"));
		entity.setCreated(resultSet.getTimestamp("created"));
		entity.setUpdated(resultSet.getTimestamp("updated"));
		return entity;
	}

	@Override
	public void save(IPokerAction... entities) {
		try (Connection c = getConnection()) {
			c.setAutoCommit(false);
			try {

				for (IPokerAction entity : entities) {
					PreparedStatement pStmt = c.prepareStatement(String.format(
							"insert into %s (bet, call, raise, fold, check, va_bank, small_blind, big_blind, created, updated) values(?,?,?,?,?,?,?,?,?,?)",
							getTableName()), Statement.RETURN_GENERATED_KEYS);

					pStmt.setInt(1, entity.getBet());
					pStmt.setInt(2, entity.getCall());
					pStmt.setInt(3, entity.getRaise());
					pStmt.setBoolean(4, entity.isFold());
					pStmt.setBoolean(5, entity.isCheck());
					pStmt.setInt(6, entity.getVaBank());
					pStmt.setBoolean(7, entity.isSmallBlind());
					pStmt.setBoolean(8, entity.isBigBlind());
					pStmt.setObject(9, entity.getCreated(), Types.TIMESTAMP);
					pStmt.setObject(10, entity.getUpdated(), Types.TIMESTAMP);

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
	public List<IPokerAction> find(PokerActionFilter filter) {
		final StringBuilder sqlTile = new StringBuilder("");
		appendSort(filter, sqlTile);
		appendPaging(filter, sqlTile);
		return executeFindQuery(sqlTile.toString());
	}

	@Override
	public long getCount(PokerActionFilter filter) {
		return executeCountQuery("");
	}
	
}
