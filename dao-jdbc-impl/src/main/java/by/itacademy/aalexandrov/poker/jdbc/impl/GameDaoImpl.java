package by.itacademy.aalexandrov.poker.jdbc.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.List;
import java.util.Set;

import by.itacademy.aalexandrov.poker.dao.api.IGameDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.GameStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IChat;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IPlayer;
import by.itacademy.aalexandrov.poker.dao.api.filter.GameFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.Board;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.Chat;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.Game;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.Player;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.PreparedStatementAction;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.SQLExecutionException;

public class GameDaoImpl extends AbstractDaoImpl<IGame, Integer> implements IGameDao {

	@Override
	public IGame createEntity() {
		return new Game();
	}

	@Override
	public void insert(IGame entity) {
		executeStatement(new PreparedStatementAction<IGame>(String.format(
				"insert into %s (chat_id, player_id, board_id, state, bank, created, updated) values(?,?,?,?,?,?,?)",
				getTableName()), true) {
			@Override
			public IGame doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setInt(1, entity.getChatId().getId());
				pStmt.setInt(2, entity.getPlayerId().getId());
				pStmt.setInt(3, entity.getBoardId().getId());
				pStmt.setString(4, entity.getState().name());
				pStmt.setDouble(5, entity.getBank());
				pStmt.setObject(6, entity.getCreated(), Types.TIMESTAMP);
				pStmt.setObject(7, entity.getUpdated(), Types.TIMESTAMP);

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
	public void update(IGame entity) {
		executeStatement(new PreparedStatementAction<IGame>(
				String.format("update %s set chat_id=?, player_id=?, board_id=?, state=?, bank=?, updated=? where id=?",
						getTableName())) {
			@Override
			public IGame doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setInt(1, entity.getChatId().getId());
				pStmt.setInt(2, entity.getPlayerId().getId());
				pStmt.setInt(3, entity.getBoardId().getId());
				pStmt.setString(4, entity.getState().name());
				pStmt.setDouble(5, entity.getBank());
				pStmt.setObject(6, entity.getUpdated(), Types.TIMESTAMP);
				pStmt.setInt(7, entity.getId());

				pStmt.executeUpdate();
				return entity;
			}
		});

	}

	@Override
	protected String getTableName() {
		return "game";
	}

	@Override
	protected IGame parseRow(final ResultSet resultSet, Set<String> columns) throws SQLException {
		final IGame entity = createEntity();
		entity.setId((Integer) resultSet.getObject("id"));
		entity.setState(GameStatus.valueOf(resultSet.getString("state")));
		entity.setBank(resultSet.getDouble("bank"));
		entity.setCreated(resultSet.getTimestamp("created"));
		entity.setUpdated(resultSet.getTimestamp("updated"));

		Integer chatId = (Integer) resultSet.getObject("chat_id");
		if (chatId != null) {
			final IChat chat = new Chat();
			chat.setId(chatId);
			if (columns.contains("chat_id")) {
				chat.setMessage(resultSet.getString("chat_id"));
			}
			entity.setChatId(chat);
		}

		Integer playerId = (Integer) resultSet.getObject("player_id");
		if (playerId != null) {
			final IPlayer player = new Player();
			player.setId(playerId);
			if (columns.contains("player_id")) {
				player.setInGame(resultSet.getBoolean("player_id"));
				player.setStack(resultSet.getInt("player_id"));
			}
			entity.setPlayerId(player);
		}

		Integer boardId = (Integer) resultSet.getObject("board_id");
		if (boardId != null) {
			final Board board = new Board();
			board.setId(boardId);
			if (columns.contains("board_id")) {
			}
			entity.setBoardId(board);
		}

		return entity;
	}

	@Override
	public void save(IGame... entities) {
		try (Connection c = getConnection()) {
			c.setAutoCommit(false);
			try {

				for (IGame entity : entities) {
					PreparedStatement pStmt = c.prepareStatement(String.format(
							"insert into %s (chat_id, player_id, board_id, state, bank, created, updated) values(?,?,?,?,?,?,?)",
							getTableName()), Statement.RETURN_GENERATED_KEYS);

					pStmt.setObject(1, entity.getChatId().getId());
					pStmt.setInt(2, entity.getPlayerId().getId());
					pStmt.setInt(3, entity.getBoardId().getId());
					pStmt.setString(4, entity.getState().name());
					pStmt.setDouble(5, entity.getBank());
					pStmt.setObject(6, entity.getCreated(), Types.TIMESTAMP);
					pStmt.setObject(7, entity.getUpdated(), Types.TIMESTAMP);

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
	public List<IGame> find(GameFilter filter) {
		final StringBuilder sqlTile = new StringBuilder("");
		appendSort(filter, sqlTile);
		appendPaging(filter, sqlTile);
		return executeFindQuery(sqlTile.toString());
	}

	@Override
	public long getCount(GameFilter filter) {
		return executeCountQuery("");
	}

}
