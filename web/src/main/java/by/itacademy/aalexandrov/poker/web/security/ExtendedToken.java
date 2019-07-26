package by.itacademy.aalexandrov.poker.web.security;

import java.util.Collection;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.UserRole;

public class ExtendedToken extends UsernamePasswordAuthenticationToken {

	private Integer id;

	private UserRole userRole;

	private String foto;

	public ExtendedToken(final Object principal, final Object credentials,
			final Collection<? extends GrantedAuthority> authorities) {
		super(principal, credentials, authorities);
	}

	public Integer getId() {
		return id;
	}

	public void setId(final Integer id) {
		this.id = id;
	}

	public UserRole getUserRole() {
		return userRole;
	}

	public void setUserRole(UserRole userRole) {
		this.userRole = userRole;
	}

	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}

}