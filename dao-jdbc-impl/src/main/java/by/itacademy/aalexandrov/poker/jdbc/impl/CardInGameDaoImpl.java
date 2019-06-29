package by.itacademy.aalexandrov.poker.jdbc.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.List;
import java.util.Set;

import by.itacademy.aalexandrov.poker.dao.api.ICardInGameDao;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.CardStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICardInGame;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IGame;
import by.itacademy.aalexandrov.poker.dao.api.filter.CardInGameFilter;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.Card;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.CardInGame;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.Game;
import by.itacademy.aalexandrov.poker.jdbc.impl.entity.Player;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.PreparedStatementAction;
import by.itacademy.aalexandrov.poker.jdbc.impl.util.SQLExecutionException;

public class CardInGameDaoImpl extends AbstractDaoImpl<ICardInGame, Integer> implements ICardInGameDao {

	@Override
	public ICardInGame createEntity() {
		return new CardInGame();
	}

	@Override
	public void insert(ICardInGame entity) {
		executeStatement(new PreparedStatementAction<ICardInGame>(String.format(
				"insert into %s (card_id, game_id, player_id, card_state, created, updated) values(?,?,?,?,?,?)",
				getTableName()), true) {
			@Override
			public ICardInGame doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setInt(1, entity.getCardId().getId());
				pStmt.setInt(2, entity.getGameId().getId());
				pStmt.setInt(3, entity.getPlayerId().getId());
				pStmt.setString(4, entity.getCardStatus().name());
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
	public void update(ICardInGame entity) {
		executeStatement(new PreparedStatementAction<ICardInGame>(
				String.format("update %s set card_id=?, game_id=?, player_id=?, card_state=?, updated=? where id=?",
						getTableName())) {
			@Override
			public ICardInGame doWithPreparedStatement(final PreparedStatement pStmt) throws SQLException {
				pStmt.setInt(1, entity.getCardId().getId());
				pStmt.setInt(2, entity.getGameId().getId());
				pStmt.setInt(3, entity.getPlayerId().getId());
				pStmt.setString(4, entity.getCardStatus().name());
				pStmt.setObject(5, entity.getUpdated(), Types.TIMESTAMP);
				pStmt.setInt(6, entity.getId());

				pStmt.executeUpdate();
				return entity;
			}
		});

	}

	@Override
	protected String getTableName() {
		return "card_in_game";
	}

	@Override
	protected ICardInGame parseRow(final ResultSet resultSet, Set<String> columns) throws SQLException {
		final ICardInGame entity = createEntity();
		entity.setId((Integer) resultSet.getObject("id"));
		entity.setCardStatus(CardStatus.valueOf(resultSet.getString("card_state")));
		entity.setCreated(resultSet.getTimestamp("created"));
		entity.setUpdated(resultSet.getTimestamp("updated"));

		Integer card1Id = (Integer) resultSet.getObject("card_id");
		if (card1Id != null) {
			final Card card = new Card();
			card.setId(card1Id);
			if (columns.contains("card_id")) {
				card.setFilename(resultSet.getString("card_id"));
			}
			entity.setCardId(card);
		}

		Integer gameId = (Integer) resultSet.getObject("game_id");
		if (gameId != null) {
			final IGame game = new Game();
			game.setId(gameId);
			if (columns.contains("game_id")) {
				game.setBank(resultSet.getDouble("game_id"));
			}
			entity.setGameId(game);
		}

		Integer playerId = (Integer) resultSet.getObject("player_id");
		if (playerId != null) {
			final Player player = new Player();
			player.setId(playerId);
			if (columns.contains("player_id")) {
				player.setInGame(resultSet.getBoolean("player_id"));
				player.setStack(resultSet.getDouble("player_id"));
			}
			entity.setPlayerId(player);
		}

		return entity;
	}

	@Override
	public void save(ICardInGame... entities) {
		try (Connection c = getConnection()) {
			c.setAutoCommit(false);
			try {

				for (ICardInGame entity : entities) {
					PreparedStatement pStmt = c.prepareStatement(String.format(
							"insert into %s (card_id, game_id, player_id, card_state, created, updated) values(?,?,?,?,?,?)",
							getTableName()), Statement.RETURN_GENERATED_KEYS);

					pStmt.setInt(1, entity.getCardId().getId());
					pStmt.setInt(2, entity.getGameId().getId());
					pStmt.setInt(3, entity.getPlayerId().getId());
					pStmt.setString(4, entity.getCardStatus().name());
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
	public List<ICardInGame> find(CardInGameFilter filter) {
		final StringBuilder sqlTile = new StringBuilder("");
		appendSort(filter, sqlTile);
		appendPaging(filter, sqlTile);
		return executeFindQuery(sqlTile.toString());
	}

	@Override
	public long getCount(CardInGameFilter filter) {
		return executeCountQuery("");
	}

}
