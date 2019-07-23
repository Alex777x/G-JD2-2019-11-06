package by.itacademy.aalexandrov.poker.web.converter;

import java.util.function.Function;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICountry;
import by.itacademy.aalexandrov.poker.service.ICountryService;
import by.itacademy.aalexandrov.poker.web.dto.CountryDTO;

@Component
public class CountryFromDTOConverter implements Function<CountryDTO, ICountry> {

	@Autowired
	private ICountryService countryService;
	
	@Override
	public ICountry apply(CountryDTO dto) {
		ICountry entity = countryService.createEntity();
		entity.setId(dto.getId());
		entity.setCountry(dto.getCountry());
		return entity;
	}

}
