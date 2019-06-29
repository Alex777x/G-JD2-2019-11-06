package by.itacademy.aalexandrov.poker.jdbc.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.List;
import java.util.Set;

import by.itacademy.aalexandrov.poker.dao.api.IUserAccountDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.UserRole;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.UserStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.dao.api.filter.UserAccountFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.Country;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.Statistic;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.Transaction;
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
				"insert into %s (nickname, password, email, foto, statistic_id, country_id, role_id, status_id, transaction_id, created, updated) values(?,?,?,?,?,?,?,?,?,?,?)",
				getTableName()), true) {
			@Override
			public IUserAccount doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setString(1, entity.getNickname());
				pStmt.setString(2, entity.getPassword());
				pStmt.setString(3, entity.getEmail());
				pStmt.setString(4, entity.getFoto());
				pStmt.setInt(5, entity.getStatisticId().getId());
				pStmt.setInt(6, entity.getCountryId().getId());
				pStmt.setString(7, entity.getUserRole().name());
				pStmt.setString(8, entity.getUserStatus().name());
				pStmt.setInt(9, entity.getTransactionId().getId());
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
		try {
			executeStatement(new PreparedStatementAction<IUserAccount>(String.format(
					"update %s set nickname=?, password=?, email=?, foto=?, statistic_id=?, country_id=?, role_id=?, status_id=?, transaction_id=?, updated=? where id=?",
					getTableName())) {
				@Override
				public IUserAccount doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
					pStmt.setString(1, entity.getNickname());
					pStmt.setString(2, entity.getPassword());
					pStmt.setString(3, entity.getEmail());
					pStmt.setString(4, entity.getFoto());
					pStmt.setInt(5, entity.getStatisticId().getId());
					pStmt.setInt(6, entity.getCountryId().getId());
					pStmt.setString(7, entity.getUserRole().name());
					pStmt.setString(8, entity.getUserStatus().name());
					pStmt.setInt(9, entity.getTransactionId().getId());
					pStmt.setObject(10, entity.getUpdated(), Types.TIMESTAMP);
					pStmt.setInt(11, entity.getId());

					pStmt.executeUpdate();
					return entity;
				}
			});
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

	}

	@Override
	protected String getTableName() {
		return "user_account";
	}

	@Override
	protected IUserAccount parseRow(final ResultSet resultSet, Set<String> columns) throws SQLException {
		final IUserAccount entity = createEntity();
		entity.setId((Integer) resultSet.getObject("id"));
		entity.setNickname(resultSet.getString("nickname"));
		entity.setPassword(resultSet.getString("password"));
		entity.setEmail(resultSet.getString("email"));
		entity.setFoto(resultSet.getString("foto"));
		entity.setUserRole(UserRole.valueOf(resultSet.getString("role_id")));
		entity.setUserStatus(UserStatus.valueOf(resultSet.getString("status_id")));
		entity.setCreated(resultSet.getTimestamp("created"));
		entity.setUpdated(resultSet.getTimestamp("updated"));

		Integer countryId = (Integer) resultSet.getObject("country_id");
		if (countryId != null) {
			final Country country = new Country();
			country.setId(countryId);
			if (columns.contains("country_id")) {
				country.setCountry(resultSet.getString("country_id"));
			}
			entity.setCountryId(country);
		}

		Integer statisticId = (Integer) resultSet.getObject("statistic_id");
		if (statisticId != null) {
			final Statistic statistic = new Statistic();
			statistic.setId(statisticId);
			if (columns.contains("statistic_id")) {
				statistic.setSumGames(resultSet.getInt("statistic_id"));
				statistic.setWonGames(resultSet.getInt("statistic_id"));
			}
			entity.setStatisticId(statistic);
		}

		Integer tranzactionId = (Integer) resultSet.getObject("transaction_id");
		if (tranzactionId != null) {
			final Transaction tranzaction = new Transaction();
			tranzaction.setId(tranzactionId);
			if (columns.contains("transaction_id")) {
				tranzaction.setAmount(resultSet.getInt("transaction_id"));
				tranzaction.setComment(resultSet.getString("transaction_id"));
			}
			entity.setTransactionId(tranzaction);
		}

		return entity;
	}

	@Override
	public void save(IUserAccount... entities) {
		try (Connection c = getConnection()) {
			c.setAutoCommit(false);
			try {

				for (IUserAccount entity : entities) {
					PreparedStatement pStmt = c.prepareStatement(String.format(
							"insert into %s (nickname, password, email, foto, statistic_id, country_id, role_id, status_id, transaction_id, created, updated) values(?,?,?,?,?,?,?,?,?,?)",
							getTableName()), Statement.RETURN_GENERATED_KEYS);

					pStmt.setString(1, entity.getNickname());
					pStmt.setString(2, entity.getPassword());
					pStmt.setString(3, entity.getEmail());
					pStmt.setString(4, entity.getFoto());
					pStmt.setInt(5, entity.getStatisticId().getId());
					pStmt.setObject(6, entity.getCountryId());
					pStmt.setObject(7, entity.getUserRole());
					pStmt.setObject(8, entity.getUserStatus());
					pStmt.setObject(9, entity.getTransactionId());
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
