package by.itacademy.aalexandrov.poker.dao.orm.impl.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Transient;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITiket;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;

@Entity
public class Tiket extends BaseEntity implements ITiket {

	@Transient
	private IUserAccount userAccount;

	@Column(name = "tiket_title")
	private String tiketTitle;

	@Column(name = "tiket_text")
	private String tiketText;

	@Column
	private String status;

	@Transient
	private String upperCaseName;

	public String getUpperCaseName() {
		return upperCaseName;
	}

	public void setUpperCaseName(String upperCaseName) {
		this.upperCaseName = upperCaseName;
	}

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
