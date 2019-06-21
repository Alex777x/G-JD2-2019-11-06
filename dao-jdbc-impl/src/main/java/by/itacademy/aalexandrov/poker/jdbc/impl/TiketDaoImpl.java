package by.itacademy.aalexandrov.poker.jdbc.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;

import by.itacademy.aalexandrov.poker.dao.api.ITiketDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITiket;
import by.itacademy.aalexandrov.poker.dao.api.filter.TiketFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.Tiket;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.PreparedStatementAction;

public class TiketDaoImpl extends AbstractDaoImpl<ITiket, Integer> implements ITiketDao {

	@Override
	public ITiket createEntity() {
		return new Tiket();
	}

	@Override
	public void update(ITiket entity) {
		throw new RuntimeException("not implemented");

	}

	@Override
	public void insert(ITiket entity) {
		executeStatement(new PreparedStatementAction<ITiket>(
				String.format("insert into %s (tiket_title, tiket_text, status, created, updated) values(?,?,?,?,?)",
						getTableName()),
				true) {
			@Override
			public ITiket doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setString(1, entity.getTiketTitle());
				pStmt.setString(2, entity.getTiketText());
				pStmt.setString(3, entity.getStatus());
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
	protected String getTableName() {
		return "tiket";
	}

	@Override
	public List<ITiket> find(TiketFilter filter) {
		throw new RuntimeException("not implemented");
	}

	@Override
	public long getCount(TiketFilter filter) {
		throw new RuntimeException("not implemented");
	}

	@Override
	protected ITiket parseRow(final ResultSet resultSet) throws SQLException {
		final ITiket entity = createEntity();
		entity.setId((Integer) resultSet.getObject("id"));
		entity.setTiketTitle(resultSet.getString("tiket_title"));
		entity.setTiketText(resultSet.getString("tiket_text"));
		entity.setStatus(resultSet.getString("status"));
		entity.setCreated(resultSet.getTimestamp("created"));
		entity.setUpdated(resultSet.getTimestamp("updated"));
		return entity;
	}

}
