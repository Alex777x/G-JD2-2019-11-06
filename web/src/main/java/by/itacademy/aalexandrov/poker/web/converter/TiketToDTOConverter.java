package by.itacademy.aalexandrov.poker.web.converter;

import java.util.function.Function;

import org.springframework.stereotype.Component;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITiket;
import by.itacademy.aalexandrov.poker.web.dto.TiketDTO;

@Component
public class TiketToDTOConverter implements Function<ITiket, TiketDTO> {

	@Override
	public TiketDTO apply(ITiket entity) {
		TiketDTO dto = new TiketDTO();
		dto.setId(entity.getId());
		dto.setUserAccount(entity.getUserAccount());
		dto.setTiketTitle(entity.getTiketTitle());
		dto.setTiketText(entity.getTiketText());
		dto.setStatus(entity.getStatus());
		dto.setCreated(entity.getCreated());
		dto.setUpdated(entity.getUpdated());
		return dto;
	}

}
