package by.itacademy.aalexandrov.poker.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IChat;
import by.itacademy.aalexandrov.poker.dao.api.filter.ChatFilter;
import by.itacademy.aalexandrov.poker.service.IChatService;
import by.itacademy.aalexandrov.poker.web.converter.ChatToDTOConverter;
import by.itacademy.aalexandrov.poker.web.dto.ChatDTO;

@Controller
@RequestMapping(value = "/chat")
public class ChatController {

	private IChatService chatService;

	private ChatToDTOConverter toDtoConverter;

	@Autowired
	public ChatController(IChatService chatService, ChatToDTOConverter toDtoConverter) {
		super();
		this.chatService = chatService;
		this.toDtoConverter = toDtoConverter;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView index(final HttpServletRequest req) {

		final ChatFilter filter = new ChatFilter();

		final List<IChat> entities = chatService.find(filter);
		List<ChatDTO> dtos = entities.stream().map(toDtoConverter).collect(Collectors.toList());

		final Map<String, Object> models = new HashMap<>();
		models.put("gridItems", dtos);
		return new ModelAndView("chat.list", models);
	}

}
