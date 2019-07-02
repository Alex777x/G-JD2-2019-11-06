package by.itacademy.aalexandrov.poker.jdbc.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import org.springframework.stereotype.Repository;

import by.itacademy.aalexandrov.poker.dao.api.IStatisticDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IStatistic;
import by.itacademy.aalexandrov.poker.dao.api.filter.StatisticFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.Statistic;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.PreparedStatementAction;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.SQLExecutionException;

@Repository
public class StatisticDaoImpl extends AbstractDaoImpl<IStatistic, Integer> implements IStatisticDao {

	@Override
	public IStatistic createEntity() {
		return new Statistic();
	}

	@Override
	public void insert(IStatistic entity) {
		executeStatement(new PreparedStatementAction<IStatistic>(
				String.format("insert into %s (sum_games, won_games) values(?,?)", getTableName()), true) {
			@Override
			public IStatistic doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setInt(1, entity.getSumGames());
				pStmt.setInt(2, entity.getWonGames());

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
	public void update(IStatistic entity) {
		executeStatement(new PreparedStatementAction<IStatistic>(
				String.format("update %s set sum_games=?, won_games=? where id=?", getTableName())) {
			@Override
			public IStatistic doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setInt(1, entity.getSumGames());
				pStmt.setInt(2, entity.getWonGames());
				pStmt.setInt(3, entity.getId());

				pStmt.executeUpdate();
				return entity;
			}
		});

	}

	@Override
	protected String getTableName() {
		return "statistic";
	}

	@Override
	protected IStatistic parseRow(ResultSet resultSet) throws SQLException {
		IStatistic entity = createEntity();
		entity.setId((Integer) resultSet.getObject("id"));
		entity.setSumGames(resultSet.getInt("sum_games"));
		entity.setWonGames(resultSet.getInt("won_games"));
		return entity;
	}

	@Override
	public void save(IStatistic... entities) {
		try (Connection c = getConnection()) {
			c.setAutoCommit(false);
			try {

				for (IStatistic entity : entities) {
					PreparedStatement pStmt = c.prepareStatement(
							String.format("insert into %s (sum_games, won_games) values(?,?)", getTableName()),
							Statement.RETURN_GENERATED_KEYS);

					pStmt.setInt(1, entity.getSumGames());
					pStmt.setInt(2, entity.getWonGames());

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
	public List<IStatistic> find(StatisticFilter filter) {
		final StringBuilder sqlTile = new StringBuilder("");
		appendSort(filter, sqlTile);
		appendPaging(filter, sqlTile);
		return executeFindQuery(sqlTile.toString());
	}

	@Override
	public long getCount(StatisticFilter filter) {
		return executeCountQuery("");
	}

}
