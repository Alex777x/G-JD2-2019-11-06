package by.itacademy.aalexandrov.poker.web.converter;

import java.util.function.Function;

import org.springframework.stereotype.Component;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.INews;
import by.itacademy.aalexandrov.poker.web.dto.NewsDTO;

@Component
public class NewsToDTOConverter implements Function<INews, NewsDTO> {

	@Override
	public NewsDTO apply(INews entity) {
		NewsDTO dto = new NewsDTO();
		dto.setId(entity.getId());
		dto.setNewsTitle(entity.getNewsTitle());
		dto.setNewsText(entity.getNewsText());
		dto.setVersion(entity.getVersion());
		return dto;
	}

}
