package by.itacademy.aalexandrov.poker.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.service.IUserAccountService;
import by.itacademy.aalexandrov.poker.web.converter.UserAccountFromDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.UserAccountToDTOConverter;
import by.itacademy.aalexandrov.poker.web.dto.UserAccountDTO;

@Controller
@RequestMapping(value = "/personalArea")
public class PersonalAreaController extends AbstractController {

	@Autowired
	private IUserAccountService userAccountService;

	@Autowired
	private UserAccountFromDTOConverter userAccountFromDtoConverter;

	@Autowired
	private UserAccountToDTOConverter userAccountToDtoConverter;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView index(final HttpServletRequest req) {

//		List<IUserAccount> entities = userAccountService.getFullInfo();
//		List<UserAccountDTO> dtos = entities.stream().map(userAccountToDtoConverter).collect(Collectors.toList());
//
//		Map<String, Object> model = new HashMap<>();
//		model.put("gridItems", dtos);
		return new ModelAndView("personalArea.index");
	}

	@RequestMapping(method = RequestMethod.POST)
	public Object updateNickName(@Valid @ModelAttribute("formChangeUserNickName") UserAccountDTO formChangeUserNickName,
			final BindingResult result) {
		if (result.hasErrors()) {
			final Map<String, Object> hashMap = new HashMap<>();
			hashMap.put("formChangeUserNickName", formChangeUserNickName);
			return new ModelAndView("personalArea.index", hashMap);
		} else {
			final IUserAccount entity = userAccountFromDtoConverter.apply(formChangeUserNickName);
			userAccountService.save(entity);
			return "redirect:/personalArea";
		}
	}
}
