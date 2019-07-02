package by.itacademy.aalexandrov.poker.jdbc.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import org.springframework.stereotype.Repository;

import by.itacademy.aalexandrov.poker.dao.api.ICountryDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICountry;
import by.itacademy.aalexandrov.poker.dao.api.filter.CountryFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.Country;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.PreparedStatementAction;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.SQLExecutionException;

@Repository
public class CountryDaoImpl extends AbstractDaoImpl<ICountry, Integer> implements ICountryDao {

	@Override
	public ICountry createEntity() {
		return new Country();
	}

	@Override
	public void insert(ICountry entity) {
		executeStatement(new PreparedStatementAction<ICountry>(
				String.format("insert into %s (country) values(?)", getTableName()), true) {
			@Override
			public ICountry doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setString(1, entity.getCountry());

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
	public void update(ICountry entity) {
		executeStatement(new PreparedStatementAction<ICountry>(
				String.format("update %s set country=? where id=?", getTableName())) {
			@Override
			public ICountry doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setString(1, entity.getCountry());
				pStmt.setInt(2, entity.getId());

				pStmt.executeUpdate();
				return entity;
			}
		});

	}

	@Override
	protected String getTableName() {
		return "country";
	}

	@Override
	protected ICountry parseRow(ResultSet resultSet) throws SQLException {
		ICountry entity = createEntity();
		entity.setId((Integer) resultSet.getObject("id"));
		entity.setCountry(resultSet.getString("country"));
		return entity;
	}

	@Override
	public void save(ICountry... entities) {
		try (Connection c = getConnection()) {
			c.setAutoCommit(false);
			try {

				for (ICountry entity : entities) {
					PreparedStatement pStmt = c.prepareStatement(
							String.format("insert into %s (country) values(?)", getTableName()),
							Statement.RETURN_GENERATED_KEYS);
					pStmt.setString(1, entity.getCountry());

					pStmt.executeUpdate();

					ResultSet rs = pStmt.getGeneratedKeys();
					rs.next();
					int id = rs.getInt("id");

					rs.close();
					pStmt.close();
					entity.setId(id);
				}

				c.commit();
			} catch (Exception e) {
				c.rollback();
				throw new RuntimeException(e);
			}
		} catch (Exception e) {
			throw new SQLExecutionException(e);
		}

	}

	@Override
	public List<ICountry> find(CountryFilter filter) {
		StringBuilder sqlTile = new StringBuilder("");
		appendSort(filter, sqlTile);
		appendPaging(filter, sqlTile);
		return executeFindQuery(sqlTile.toString());
	}

	@Override
	public long getCount(CountryFilter filter) {
		return executeCountQuery("");
	}

}
