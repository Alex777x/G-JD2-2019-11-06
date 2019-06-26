package by.itacademy.aalexandrov.poker.jdbc.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.IUserAccountDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.UserRole;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.UserStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICountry;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IStatistic;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITranzaction;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.dao.api.filter.UserAccountFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.UserAccount;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.PreparedStatementAction;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.SQLExecutionException;

public class UserAccountDaoImpl extends AbstractDaoImpl<IUserAccount, Integer> implements IUserAccountDao {

	@Override
	public IUserAccount createEntity() {
		return new UserAccount();
	}

	@Override
	public void insert(IUserAccount entity) {
		executeStatement(new PreparedStatementAction<IUserAccount>(String.format(
				"insert into %s (nickname, password, email, foto, statistic_id, country_id, role_id, status_id, tranzaction_id, created, updated) values(?,?,?,?,?,?,?,?,?,?,?)",
				getTableName()), true) {
			@Override
			public IUserAccount doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setString(1, entity.getNickname());
				pStmt.setString(2, entity.getPassword());
				pStmt.setString(3, entity.getEmail());
				pStmt.setString(4, entity.getFoto());
				pStmt.setInt(5, entity.getStatisticId().getId());
				pStmt.setInt(6, entity.getCountry().getId());
				pStmt.setString(7, entity.getUserRole().name());
				pStmt.setString(8, entity.getUserStatus().name());
				pStmt.setInt(9, entity.getTranzaction().getId());
				pStmt.setObject(10, entity.getCreated(), Types.TIMESTAMP);
				pStmt.setObject(11, entity.getUpdated(), Types.TIMESTAMP);

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
	public void update(IUserAccount entity) {
		executeStatement(new PreparedStatementAction<IUserAccount>(String.format(
				"update %s set nickname=?, password=?, email=?, foto=?, statistic_id=?, country_id=?, role_id=?, status_id=?, tranzaction_id=?, updated=? where id=?",
				getTableName())) {
			@Override
			public IUserAccount doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setString(1, entity.getNickname());
				pStmt.setString(2, entity.getPassword());
				pStmt.setString(3, entity.getEmail());
				pStmt.setString(4, entity.getFoto());
				pStmt.setInt(5, entity.getStatisticId().getId());
				pStmt.setObject(6, entity.getCountry());
				pStmt.setObject(7, entity.getUserRole().name());
				pStmt.setObject(8, entity.getUserStatus());
				pStmt.setObject(9, entity.getTranzaction());
				pStmt.setObject(10, entity.getUpdated(), Types.TIMESTAMP);
				pStmt.setInt(11, entity.getId());

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
	protected IUserAccount parseRow(final ResultSet resultSet) throws SQLException {
		final IUserAccount entity = createEntity();
		entity.setId((Integer) resultSet.getObject("id"));
		entity.setNickname(resultSet.getString("nickname"));
		entity.setPassword(resultSet.getString("password"));
		entity.setEmail(resultSet.getString("email"));
		entity.setFoto(resultSet.getString("foto"));
		entity.setCountry((ICountry) resultSet.getObject("country_id"));
		entity.setStatisticId((IStatistic) resultSet.getObject("statistic_id"));
		entity.setUserRole(UserRole.valueOf(resultSet.getString("role_id")));
		entity.setUserStatus(UserStatus.valueOf(resultSet.getString("status_id")));
		entity.setTranzaction((ITranzaction) resultSet.getObject("tranzaction_id"));
		entity.setCreated(resultSet.getTimestamp("created"));
		entity.setUpdated(resultSet.getTimestamp("updated"));
		return entity;
	}

	@Override
	public void save(IUserAccount... entities) {
		try (Connection c = getConnection()) {
			c.setAutoCommit(false);
			try {

				for (IUserAccount entity : entities) {
					PreparedStatement pStmt = c.prepareStatement(String.format(
							"insert into %s (nickname, password, email, foto, statistic_id, country_id, role_id, status_id, tranzaction_id, created, updated) values(?,?,?,?,?,?,?,?,?,?)",
							getTableName()), Statement.RETURN_GENERATED_KEYS);

					pStmt.setString(1, entity.getNickname());
					pStmt.setString(2, entity.getPassword());
					pStmt.setString(3, entity.getEmail());
					pStmt.setString(4, entity.getFoto());
					pStmt.setInt(5, entity.getStatisticId().getId());
					pStmt.setObject(6, entity.getCountry());
					pStmt.setObject(7, entity.getUserRole());
					pStmt.setObject(8, entity.getUserStatus());
					pStmt.setObject(9, entity.getTranzaction());
					pStmt.setObject(10, entity.getCreated(), Types.TIMESTAMP);
					pStmt.setObject(11, entity.getUpdated(), Types.TIMESTAMP);

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
	public List<IUserAccount> find(UserAccountFilter filter) {
		final StringBuilder sqlTile = new StringBuilder("");
		appendSort(filter, sqlTile);
		appendPaging(filter, sqlTile);
		return executeFindQuery(sqlTile.toString());
	}

	@Override
	public long getCount(UserAccountFilter filter) {
		return executeCountQuery("");
	}

}
