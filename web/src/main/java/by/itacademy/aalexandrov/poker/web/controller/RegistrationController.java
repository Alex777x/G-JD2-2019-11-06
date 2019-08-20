package by.itacademy.aalexandrov.poker.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICountry;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITransaction;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.service.ICountryService;
import by.itacademy.aalexandrov.poker.service.ITransactionService;
import by.itacademy.aalexandrov.poker.service.IUserAccountService;
import by.itacademy.aalexandrov.poker.web.converter.UserAccountFromDTOConverter;
import by.itacademy.aalexandrov.poker.web.dto.UserAccountDTO;

@Controller
@RequestMapping(value = "/registration")
public class RegistrationController {
	@Autowired
	private ICountryService countryService;
	@Autowired
	private IUserAccountService userAccountService;
	@Autowired
	private UserAccountFromDTOConverter fromDtoConverter;
	@Autowired
	private ITransactionService transactionService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView showForm() {
		final Map<String, Object> hashMap = new HashMap<>();
		hashMap.put("formRegistrationUserAccount", new UserAccountDTO());
		loadCommonFormUserAccounts(hashMap);
		return new ModelAndView("registration", hashMap);
	}

	@RequestMapping(method = RequestMethod.POST)
	public Object save(
			@Valid @ModelAttribute("formRegistrationUserAccount") final UserAccountDTO formRegistrationUserAccount,
			final BindingResult result) {
		if (result.hasErrors()) {
			final Map<String, Object> hashMap = new HashMap<>();
			hashMap.put("formRegistrationUserAccount", formRegistrationUserAccount);
			loadCommonFormUserAccounts(hashMap);
			return new ModelAndView("registration", hashMap);
		} else {
			final IUserAccount entity = fromDtoConverter.apply(formRegistrationUserAccount);
			userAccountService.save(entity);

			ITransaction transaction = transactionService.createEntity();
			transaction.setUserAccount(entity);
			transaction.setAmount(1000);
			transaction.setComment("First bonus transaction");
			transactionService.save(transaction);

			return "redirect:/login";
		}
	}

	private void loadCommonFormUserAccounts(final Map<String, Object> hashMap) {
		final List<ICountry> countries = countryService.getAll();

		final Map<Integer, String> countriesMap = countries.stream()
				.collect(Collectors.toMap(ICountry::getId, ICountry::getCountry));
		hashMap.put("countriesChoices", countriesMap);
	}

}
