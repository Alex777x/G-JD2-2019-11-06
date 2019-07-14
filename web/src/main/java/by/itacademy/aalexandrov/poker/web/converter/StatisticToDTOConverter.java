package by.itacademy.aalexandrov.poker.web.converter;

import java.util.function.Function;

import org.springframework.stereotype.Component;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IStatistic;
import by.itacademy.aalexandrov.poker.web.dto.StatisticDTO;

@Component
public class StatisticToDTOConverter implements Function<IStatistic, StatisticDTO> {

	@Override
	public StatisticDTO apply(IStatistic entity) {
		StatisticDTO dto = new StatisticDTO();
		dto.setId(entity.getId());
		dto.setSumGames(entity.getSumGames());
		dto.setWonGames(entity.getWonGames());
		return dto;
	}

}
