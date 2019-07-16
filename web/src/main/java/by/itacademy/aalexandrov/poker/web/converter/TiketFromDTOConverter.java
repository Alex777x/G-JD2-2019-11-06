package by.itacademy.aalexandrov.poker.web.converter;

import java.util.function.Function;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITiket;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.service.ITiketService;
import by.itacademy.aalexandrov.poker.service.IUserAccountService;
import by.itacademy.aalexandrov.poker.web.dto.TiketDTO;

@Component
public class TiketFromDTOConverter implements Function<TiketDTO, ITiket> {

	@Autowired
	private ITiketService tiketService;
	
	@Autowired
	private IUserAccountService userAccountService;
	

	@Override
	public ITiket apply(final TiketDTO dto) {
		final ITiket entity = tiketService.createEntity();
		entity.setId(dto.getId());
		
		IUserAccount userAccount = userAccountService.createEntity();
		userAccount.setId(dto.getUserAccount());
		entity.setUserAccount(userAccount);
		
		
		entity.setTiketTitle(dto.getTiketTitle());
		entity.setTiketText(dto.getTiketText());
		entity.setStatus(dto.getStatus());
		return entity;
	}
}