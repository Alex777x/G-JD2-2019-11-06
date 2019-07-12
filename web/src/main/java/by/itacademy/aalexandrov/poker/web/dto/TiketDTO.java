package by.itacademy.aalexandrov.poker.web.dto;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;

public class TiketDTO {

	private Integer id;
	private IUserAccount userAccountId;
	private String tiketTitle;
	private String tiketText;
	private String status;

	public IUserAccount getUserAccountId() {
		return userAccountId;
	}

	public void setUserAccountId(IUserAccount userAccountId) {
		this.userAccountId = userAccountId;
	}

	public String getTiketTitle() {
		return tiketTitle;
	}

	public void setTiketTitle(String tiketTitle) {
		this.tiketTitle = tiketTitle;
	}

	public String getTiketText() {
		return tiketText;
	}

	public void setTiketText(String tiketText) {
		this.tiketText = tiketText;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

}
