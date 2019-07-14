package by.itacademy.aalexandrov.poker.web.dto;

import java.util.Date;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;

public class TiketDTO {

	private Integer id;
	private IUserAccount userAccount;
	private String tiketTitle;
	private String tiketText;
	private String status;
	private Date created;
	private Date updated;

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

	public IUserAccount getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(IUserAccount userAccount) {
		this.userAccount = userAccount;
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
