package by.itacademy.aalexandrov.poker.web.converter;

import java.util.function.Function;

import org.springframework.stereotype.Component;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICard;
import by.itacademy.aalexandrov.poker.web.dto.CardDTO;

@Component
public class CardToDTOConverter implements Function<ICard, CardDTO> {

	@Override
	public CardDTO apply(ICard entity) {
		CardDTO dto = new CardDTO();
		dto.setId(entity.getId());
		dto.setSuit(entity.getSuit());
		dto.setRank(entity.getRank());
		dto.setFilename(entity.getFilename());
		dto.setCreated(entity.getCreated());
		dto.setUpdated(entity.getUpdated());
		return dto;
	}

}
