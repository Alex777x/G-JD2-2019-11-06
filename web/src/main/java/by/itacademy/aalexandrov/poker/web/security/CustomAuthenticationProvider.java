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
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Component;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.UserRole;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.service.ITransactionService;
import by.itacademy.aalexandrov.poker.service.IUserAccountService;
import by.itacademy.aalexandrov.poker.web.mail.SendEmailSSL;

@Component("customAuthenticationProvider")
public class CustomAuthenticationProvider implements AuthenticationProvider {

	@Autowired
	private IUserAccountService userAccountService;

	@Autowired
	private ITransactionService transactionService;

	// TODO inject UserService

	@Override
	public Authentication authenticate(final Authentication authentication) throws AuthenticationException {
		final String username = authentication.getPrincipal().toString() + "";
		final String password = authentication.getCredentials() + "";

		IUserAccount account;
		String email;

		try {
			account = userAccountService.findNickname(username);
		} catch (Exception e) {
			throw new UsernameNotFoundException("No user found with username: " + username);
		}

		if (!BCrypt.checkpw(password, account.getPassword())) {
			throw new BadCredentialsException("1000");
		}

		double balance = 0;

		try {
			balance = transactionService.getSumm(account.getId());
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("balance not found");
		}

		email = account.getEmail();
		SendEmailSSL.sendEmail(email);

		final int userId = account.getId();
		final String foto = account.getFoto();

		final UserRole userRole = account.getUserRole();
		final List<SimpleGrantedAuthority> authorities = new ArrayList<>();

		authorities.add(new SimpleGrantedAuthority("ROLE_" + userRole.name()));

		final ExtendedToken token = new ExtendedToken(username, password, authorities);
		token.setId(userId);
		token.setUserRole(userRole);
		token.setFoto(foto);
		token.setSum(balance);

		return token;

	}

	@Override
	public boolean supports(final Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

}