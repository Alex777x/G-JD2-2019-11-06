package by.itacademy.aalexandrov.poker.web.dto;

import java.util.Date;

import javax.validation.constraints.NotNull;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.GameStatus;

public class GameDTO {

	private Integer id;
	private GameStatus state;
	@NotNull
	private double bank;
	private Date created;
	private Date updated;
	private long plaersCount;

	public long getPlaersCount() {
		return plaersCount;
	}

	public void setPlaersCount(long plaersCount) {
		this.plaersCount = plaersCount;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public GameStatus getState() {
		return state;
	}

	public void setState(GameStatus state) {
		this.state = state;
	}

	public double getBank() {
		return bank;
	}

	public void setBank(double bank) {
		this.bank = bank;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public Date getUpdated() {
		return updated;
	}

	public void setUpdated(Date updated) {
		this.updated = updated;
	}

}
