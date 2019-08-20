package by.itacademy.aalexandrov.poker.web.converter;

import java.util.function.Function;

import org.springframework.stereotype.Component;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICountry;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.web.dto.UserAccountDTO;

@Component
public class UserAccountToDTOConverter implements Function<IUserAccount, UserAccountDTO> {

	@Override
	public UserAccountDTO apply(IUserAccount entity) {
		UserAccountDTO dto = new UserAccountDTO();
		dto.setId(entity.getId());
		dto.setNickname(entity.getNickname());
		dto.setPassword(entity.getPassword());
		dto.setEmail(entity.getEmail());
		dto.setFoto(entity.getFoto());

		ICountry country = entity.getCountry();
		if (country != null) {
			dto.setCountry(country.getId());
		}

		dto.setUserRole(entity.getUserRole());
		dto.setUserStatus(entity.getUserStatus());
		dto.setSumGames(entity.getSumGames());
		dto.setWonGames(entity.getWonGames());
		dto.setCreated(entity.getCreated());
		dto.setUpdated(entity.getUpdated());
		return dto;
	}

}
