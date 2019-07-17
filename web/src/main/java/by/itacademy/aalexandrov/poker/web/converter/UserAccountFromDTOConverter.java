package by.itacademy.aalexandrov.poker.web.converter;

import java.util.function.Function;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ICountry;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IStatistic;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITransaction;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.service.ICountryService;
import by.itacademy.aalexandrov.poker.service.IStatisticService;
import by.itacademy.aalexandrov.poker.service.ITransactionService;
import by.itacademy.aalexandrov.poker.service.IUserAccountService;
import by.itacademy.aalexandrov.poker.web.dto.UserAccountDTO;

@Component
public class UserAccountFromDTOConverter implements Function<UserAccountDTO, IUserAccount> {

	@Autowired
	private IUserAccountService userAccountService;

	@Autowired
	private ICountryService countryService;

	@Autowired
	private IStatisticService statisticService;

	@Autowired
	private ITransactionService transactionService;

	@Override
	public IUserAccount apply(UserAccountDTO dto) {
		IUserAccount entity = userAccountService.createEntity();
		entity.setId(dto.getId());
		entity.setNickname(dto.getNickname());
		entity.setPassword(dto.getPassword());
		entity.setEmail(dto.getEmail());
		entity.setFoto(dto.getFoto());

		ICountry country = countryService.createEntity();
		country.setId(dto.getCountry());
		entity.setCountry(country);

		IStatistic statistic = statisticService.createEntity();
		statistic.setId(dto.getStatistic());
		entity.setStatistic(statistic);

		entity.setUserRole(dto.getUserRole());
		entity.setUserStatus(dto.getUserStatus());

		ITransaction transaction = transactionService.createEntity();
		transaction.setId(dto.getTransaction());
		entity.setTransaction(transaction);
		return entity;
	}

}
