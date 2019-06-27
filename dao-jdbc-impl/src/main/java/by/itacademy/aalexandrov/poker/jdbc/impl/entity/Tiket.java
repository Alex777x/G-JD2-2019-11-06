package by.itacademy.aalexandrov.poker.jdbc.impl.entity;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITiket;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;

public class Tiket extends BaseEntity implements ITiket {

	private IUserAccount userId;
	private String tiketTitle;
	private String tiketText;
	private String status;

	
	@Override
	public IUserAccount getUserId() {
		return userId;
	}

	
	@Override
	public void setUserId(IUserAccount userId) {
		this.userId = userId;
	}

	@Override
	public String getTiketTitle() {
		return tiketTitle;
	}

	@Override
	public void setTiketTitle(String tiketTitle) {
		this.tiketTitle = tiketTitle;
	}

	@Override
	public String getTiketText() {
		return tiketText;
	}

	@Override
	public void setTiketText(String tiketText) {
		this.tiketText = tiketText;
	}

	@Override
	public String getStatus() {
		return status;
	}

	@Override
	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Tiket [userId=" + userId + ", tiketTitle=" + tiketTitle + ", tiketText=" + tiketText + ", status="
				+ status + "]";
	}

}
