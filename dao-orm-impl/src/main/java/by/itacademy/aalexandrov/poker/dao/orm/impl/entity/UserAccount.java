package by.itacademy.aalexandrov.poker.dao.orm.impl.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Transient;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.UserRole;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.UserStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICountry;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;

@Entity
public class UserAccount extends BaseEntity implements IUserAccount {

	@Column // simple column
	private String nickname;

	@Column // simple column
	private String password;

	@Column // simple column
	private String email;

	@Column // simple column
	private String foto;

	// @OneToOne(fetch = FetchType.LAZY, mappedBy = "country", targetEntity =
	// Country.class)
	@Transient
	private ICountry country;

	@Column // simple column
	private UserRole userRole;

	@Column // simple column
	private UserStatus userStatus;

	@Column // simple column
	private int sumGames;

	@Column // simple column
	private int wonGames;

	@Transient // skip from DB mapping
	private String upperCaseName;

	public String getUpperCaseName() {
		return upperCaseName;
	}

	public void setUpperCaseName(String upperCaseName) {
		this.upperCaseName = upperCaseName;
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
	public ICountry getCountry() {
		return country;
	}

	@Override
	public void setCountry(ICountry country) {
		this.country = country;
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
	public int getSumGames() {
		return sumGames;
	}

	@Override
	public void setSumGames(int sumGames) {
		this.sumGames = sumGames;
	}

	@Override
	public int getWonGames() {
		return wonGames;
	}

	@Override
	public void setWonGames(int wonGames) {
		this.wonGames = wonGames;
	}

}
