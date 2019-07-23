package by.itacademy.aalexandrov.poker.web.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.UserRole;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.service.IUserAccountService;

@Component("customAuthenticationProvider")
public class CustomAuthenticationProvider implements AuthenticationProvider {

	@Autowired
	private IUserAccountService userAccountService;

	// TODO inject UserService

	@Override
	public Authentication authenticate(final Authentication authentication) throws AuthenticationException {
		final String username = authentication.getPrincipal() + "";
		final String password = authentication.getCredentials() + "";

		IUserAccount account = userAccountService.findNickname(username);

		if (account == null) {
			throw new BadCredentialsException("1000");
		}

		if (!account.getPassword().equals(password)) {
			throw new BadCredentialsException("1000");
		}

		final int userId = account.getId();

		UserRole userRole = account.getUserRole();
		final List<SimpleGrantedAuthority> authorities = new ArrayList<>();

		authorities.add(new SimpleGrantedAuthority("ROLE_" + userRole.name()));

		ExtendedToken token = new ExtendedToken(username, password, authorities);
		token.setId(userId);
		return token;

	}

	@Override
	public boolean supports(final Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

}