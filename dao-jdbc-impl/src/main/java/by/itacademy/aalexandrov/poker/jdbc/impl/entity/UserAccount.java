package by.itacademy.aalexandrov.poker.jdbc.impl.entity;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.UserRole;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.UserStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICountry;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IStatistic;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITranzaction;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;

public class UserAccount extends BaseEntity implements IUserAccount {

	private String nickname;
	private String password;
	private String email;
	private String foto;
	private ICountry countryId;
	private IStatistic statisticId;
	private UserRole userRole;
	private UserStatus userStatus;
	private ITranzaction tranzaction;

	@Override
	public IStatistic getStatisticId() {
		return statisticId;
	}

	@Override
	public void setStatisticId(IStatistic statisticId) {
		this.statisticId = statisticId;
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
	public ICountry getCountryId() {
		return countryId;
	}

	@Override
	public void setCountryId(ICountry countryId) {
		this.countryId = countryId;
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
	public ITranzaction getTranzaction() {
		return tranzaction;
	}

	@Override
	public void setTranzaction(ITranzaction tranzaction) {
		this.tranzaction = tranzaction;
	}

	@Override
	public String toString() {
		return "UserAccount [nickname=" + nickname + ", password=" + password + ", email=" + email + ", foto=" + foto
				+ ", country=" + countryId + ", userRole=" + userRole + ", userStatus=" + userStatus + ", tranzaction="
				+ tranzaction + "]";
	}

}
