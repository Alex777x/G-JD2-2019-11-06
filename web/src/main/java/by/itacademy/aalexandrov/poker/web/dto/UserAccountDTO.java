package by.itacademy.aalexandrov.poker.web.dto;

import java.util.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.UserRole;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.UserStatus;
import by.itacademy.aalexandrov.poker.service.PasswordUtils;

public class UserAccountDTO {

	private Integer id;
	@NotNull
	@Size(min = 1, max = 50)
	private String nickname;
	@NotNull
	private String password;
	@NotNull(message = "Email must be specified")
	@Pattern(regexp = "^(?:[a-zA-Z0-9_'^&/+-])+(?:\\.(?:[a-zA-Z0-9_'^&/+-])+)"
			+ "*@(?:(?:\\[?(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?))\\.)"
			+ "{3}(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\]?)|(?:[a-zA-Z0-9-]+\\.)"
			+ "+(?:[a-zA-Z]){2,}\\.?)$", message = "given email cannot exist")
	private String email;
	private String foto;
	@NotNull(message = "You must choose a country")
	private Integer country;
	private UserRole userRole;
	private UserStatus userStatus;
	private Integer sumGames;
	private Integer wonGames;
	private Date created;
	private Date updated;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		String salt = PasswordUtils.getSalt(password.length());
		String cryptPassword = PasswordUtils.generateSecurePassword(password, salt);
		this.password = cryptPassword;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}

	public Integer getCountry() {
		return country;
	}

	public void setCountry(Integer country) {
		this.country = country;
	}

	public UserRole getUserRole() {
		return userRole;
	}

	public void setUserRole(UserRole userRole) {
		this.userRole = userRole;
	}

	public UserStatus getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(UserStatus userStatus) {
		this.userStatus = userStatus;
	}

	public Integer getSumGames() {
		return sumGames;
	}

	public void setSumGames(Integer sumGames) {
		this.sumGames = sumGames;
	}

	public Integer getWonGames() {
		return wonGames;
	}

	public void setWonGames(Integer wonGames) {
		this.wonGames = wonGames;
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
