package by.itacademy.aalexandrov.poker.web.converter;

import java.util.function.Function;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICard;
import by.itacademy.aalexandrov.poker.service.ICardService;
import by.itacademy.aalexandrov.poker.web.dto.CardDTO;

@Component
public class CardFromDTOConverter implements Function<CardDTO, ICard> {

	@Autowired
	private ICardService cardService;

	@Override
	public ICard apply(CardDTO dto) {
		ICard entity = cardService.createEntity();
		entity.setId(dto.getId());
		entity.setSuit(dto.getSuit());
		entity.setRank(dto.getRank());
		entity.setFilename(dto.getFilename());
		return entity;
	}

}
