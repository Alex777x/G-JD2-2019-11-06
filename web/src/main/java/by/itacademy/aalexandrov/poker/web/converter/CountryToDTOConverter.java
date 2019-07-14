package by.itacademy.aalexandrov.poker.web.converter;

import java.util.function.Function;

import org.springframework.stereotype.Component;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICountry;
import by.itacademy.aalexandrov.poker.web.dto.CountryDTO;

@Component
public class CountryToDTOConverter implements Function<ICountry, CountryDTO> {

	@Override
	public CountryDTO apply(ICountry entity) {
		CountryDTO dto = new CountryDTO();
		dto.setId(entity.getId());
		dto.setCountry(entity.getCountry());
		return dto;
	}

}
