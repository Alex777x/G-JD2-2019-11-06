package by.itacademy.aalexandrov.poker.jdbc.impl.entity;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITiket;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;

public class Tiket extends BaseEntity implements ITiket {

	private IUserAccount userAccount;
	private String tiketTitle;
	private String tiketText;
	private String status;

	@Override
	public IUserAccount getUserAccount() {
		return userAccount;
	}

	@Override
	public void setUserAccount(IUserAccount userAccount) {
		this.userAccount = userAccount;
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
		return "Tiket [userAccount=" + userAccount + ", tiketTitle=" + tiketTitle + ", tiketText=" + tiketText
				+ ", status=" + status + "]";
	}

}
