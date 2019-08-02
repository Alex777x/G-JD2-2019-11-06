package by.itacademy.aalexandrov.poker.dao.orm.impl.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.UserRole;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.UserStatus;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICountry;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;

@Entity
public class UserAccount extends BaseEntity implements IUserAccount {

	@Column
	private String nickname;

	@Column
	private String password;

	@Column
	private String email;

	@Column
	private String foto;

	@ManyToOne(fetch = FetchType.LAZY, targetEntity = Country.class)
	private ICountry country;

	@Column
	@Enumerated(EnumType.STRING)
	private UserRole userRole;

	@Column
	@Enumerated(EnumType.STRING)
	private UserStatus userStatus;

	@Column
	private int sumGames;

	@Column
	private int wonGames;

	@Transient
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
