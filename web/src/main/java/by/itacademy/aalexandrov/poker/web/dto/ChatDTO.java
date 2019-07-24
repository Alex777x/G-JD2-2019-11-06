package by.itacademy.aalexandrov.poker.web.dto;

import java.util.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class ChatDTO {

	private Integer id;
	@NotNull
	private Integer game;
	@NotNull
	private Integer userAccount;
	@Size(min = 1, max = 50)
	private String message;
	private Date created;
	private Date updated;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getGame() {
		return game;
	}

	public void setGame(Integer game) {
		this.game = game;
	}

	public Integer getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(Integer userAccount) {
		this.userAccount = userAccount;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
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
