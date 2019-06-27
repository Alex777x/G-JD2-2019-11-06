package by.itacademy.aalexandrov.poker.jdbc.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.List;
import java.util.Set;

import by.itacademy.aalexandrov.poker.dao.api.ITiketDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITiket;
import by.itacademy.aalexandrov.poker.dao.api.filter.TiketFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.Tiket;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.UserAccount;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.PreparedStatementAction;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.SQLExecutionException;

public class TiketDaoImpl extends AbstractDaoImpl<ITiket, Integer> implements ITiketDao {

	@Override
	public ITiket createEntity() {
		return new Tiket();
	}

	@Override
	public void insert(ITiket entity) {
		executeStatement(new PreparedStatementAction<ITiket>(
				String.format("insert into %s (user_account_id, tiket_title, tiket_text, status, created, updated) values(?,?,?,?,?,?)",
						getTableName()),
				true) {
			@Override
			public ITiket doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setInt(1, entity.getUserAccountId().getId());
				pStmt.setString(2, entity.getTiketTitle());
				pStmt.setString(3, entity.getTiketText());
				pStmt.setString(4, entity.getStatus());
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
	public void update(ITiket entity) {
		executeStatement(new PreparedStatementAction<ITiket>(String
				.format("update %s set user_account_id=?, tiket_title=?, tiket_text=?, status=?, updated=? where id=?", getTableName())) {
			@Override
			public ITiket doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setInt(1, entity.getUserAccountId().getId());
				pStmt.setString(2, entity.getTiketTitle());
				pStmt.setString(3, entity.getTiketText());
				pStmt.setString(4, entity.getStatus());
				pStmt.setObject(5, entity.getUpdated(), Types.TIMESTAMP);
				pStmt.setInt(6, entity.getId());

				pStmt.executeUpdate();
				return entity;
			}
		});

	}

	@Override
	protected String getTableName() {
		return "tiket";
	}

	@Override
	protected ITiket parseRow(final ResultSet resultSet, Set<String> columns) throws SQLException {
		final ITiket entity = createEntity();
		entity.setId((Integer) resultSet.getObject("id"));
		entity.setTiketTitle(resultSet.getString("tiket_title"));
		entity.setTiketText(resultSet.getString("tiket_text"));
		entity.setStatus(resultSet.getString("status"));
		entity.setCreated(resultSet.getTimestamp("created"));
		entity.setUpdated(resultSet.getTimestamp("updated"));
		
		Integer userAccountId = (Integer) resultSet.getObject("user_account_id");
		if (userAccountId != null) {
            final UserAccount userAccount = new UserAccount();
            userAccount.setId(userAccountId);
            if (columns.contains("user_account_id")) {
                userAccount.setNickname(resultSet.getString("user_account_id"));
                userAccount.setPassword(resultSet.getString("user_account_id"));
                userAccount.setEmail(resultSet.getString("user_account_id"));
                userAccount.setFoto(resultSet.getString("user_account_id"));
                userAccount.setFoto(resultSet.getString("user_account_id"));
            }
            entity.setUserAccountId(userAccount);
        }
		
		return entity;
	}

	@Override
	public void save(ITiket... entities) {
		try (Connection c = getConnection()) {
			c.setAutoCommit(false);
			try {

				for (ITiket entity : entities) {
					PreparedStatement pStmt = c.prepareStatement(String.format(
							"insert into %s (user_account_id, tiket_title, tiket_text, status, created, updated) values(?,?,?,?,?,?)",
							getTableName()), Statement.RETURN_GENERATED_KEYS);

					pStmt.setInt(1, entity.getUserAccountId().getId());
					pStmt.setString(2, entity.getTiketTitle());
					pStmt.setString(3, entity.getTiketText());
					pStmt.setString(4, entity.getStatus());
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
	public List<ITiket> find(TiketFilter filter) {
		final StringBuilder sqlTile = new StringBuilder("");
		appendSort(filter, sqlTile);
		appendPaging(filter, sqlTile);
		return executeFindQuery(sqlTile.toString());
	}

	@Override
	public long getCount(TiketFilter filter) {
		return executeCountQuery("");
	}

}
