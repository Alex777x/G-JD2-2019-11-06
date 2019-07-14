package by.itacademy.aalexandrov.poker.jdbc.impl.entity;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.UserRole;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.UserStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICountry;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IStatistic;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITransaction;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;

public class UserAccount extends BaseEntity implements IUserAccount {

	private String nickname;
	private String password;
	private String email;
	private String foto;
	private ICountry country;
	private IStatistic statistic;
	private UserRole userRole;
	private UserStatus userStatus;
	private ITransaction transaction;

	@Override
	public ICountry getCountry() {
		return country;
	}

	@Override
	public void setCountry(ICountry country) {
		this.country = country;
	}

	@Override
	public IStatistic getStatistic() {
		return statistic;
	}

	@Override
	public void setStatistic(IStatistic statistic) {
		this.statistic = statistic;
	}

	@Override
	public ITransaction getTransaction() {
		return transaction;
	}

	@Override
	public void setTransaction(ITransaction transaction) {
		this.transaction = transaction;
	}

	@Override
	public String getNickname() {
		return nickname;
	}

	@Override
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String getPassword() {
		return password;
	}

	@Override
	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String getEmail() {
		return email;
	}

	@Override
	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String getFoto() {
		return foto;
	}

	@Override
	public void setFoto(String foto) {
		this.foto = foto;
	}

	@Override
	public UserRole getUserRole() {
		return userRole;
	}

	@Override
	public void setUserRole(UserRole userRole) {
		this.userRole = userRole;
	}

	@Override
	public UserStatus getUserStatus() {
		return userStatus;
	}

	@Override
	public void setUserStatus(UserStatus userStatus) {
		this.userStatus = userStatus;
	}

	@Override
	public String toString() {
		return "UserAccount [nickname=" + nickname + ", password=" + password + ", email=" + email + ", foto=" + foto
				+ ", country=" + country + ", statistic=" + statistic + ", userRole=" + userRole + ", userStatus="
				+ userStatus + ", transaction=" + transaction + "]";
	}

}
