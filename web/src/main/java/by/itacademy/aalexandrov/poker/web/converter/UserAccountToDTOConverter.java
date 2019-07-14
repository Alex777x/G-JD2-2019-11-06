package by.itacademy.aalexandrov.poker.web.converter;

import java.util.function.Function;

import org.springframework.stereotype.Component;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.web.dto.UserAccountDTO;

@Component
public class UserAccountToDTOConverter implements Function<IUserAccount, UserAccountDTO>{

	@Override
	public UserAccountDTO apply(IUserAccount entity) {
		UserAccountDTO dto = new UserAccountDTO();
		dto.setId(entity.getId());
		dto.setNickname(entity.getNickname());
		dto.setPassword(entity.getPassword());
		dto.setEmail(entity.getEmail());
		dto.setFoto(entity.getFoto());
		dto.setCountry(entity.getCountry());
		dto.setStatistic(entity.getStatistic());
		dto.setUserRole(entity.getUserRole());
		dto.setUserStatus(entity.getUserStatus());
		dto.setTransaction(entity.getTransaction());
		dto.setCreated(entity.getCreated());
		dto.setUpdated(entity.getUpdated());
		return dto;
	}

}
