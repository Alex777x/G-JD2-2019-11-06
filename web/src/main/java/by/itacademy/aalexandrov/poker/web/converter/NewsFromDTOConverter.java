package by.itacademy.aalexandrov.poker.web.converter;

import java.util.function.Function;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.INews;
import by.itacademy.aalexandrov.poker.service.INewsService;
import by.itacademy.aalexandrov.poker.web.dto.NewsDTO;

@Component
public class NewsFromDTOConverter implements Function<NewsDTO, INews> {

	@Autowired
	private INewsService newsService;

	@Override
	public INews apply(NewsDTO dto) {
		INews entity = newsService.createEntity();
		entity.setNewsTitle(dto.getNewsTitle());
		entity.setNewsText(dto.getNewsText());
		entity.setVersion(dto.getVersion());
		entity.setId(dto.getId());
		return entity;
	}

}
