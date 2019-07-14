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

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITransaction;
import by.itacademy.aalexandrov.poker.dao.api.filter.TransactionFilter;
import by.itacademy.aalexandrov.poker.service.ITransactionService;
import by.itacademy.aalexandrov.poker.web.converter.TransactionToDTOConverter;
import by.itacademy.aalexandrov.poker.web.dto.TransactionDTO;

@Controller
@RequestMapping(value = "/transaction")
public class TransactionController {

	private ITransactionService transactionService;

	private TransactionToDTOConverter toDtoConverter;

	@Autowired
	public TransactionController(ITransactionService transactionService, TransactionToDTOConverter toDtoConverter) {
		super();
		this.transactionService = transactionService;
		this.toDtoConverter = toDtoConverter;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView index(final HttpServletRequest req) {

		final TransactionFilter filter = new TransactionFilter();

		final List<ITransaction> entities = transactionService.find(filter);
		List<TransactionDTO> dtos = entities.stream().map(toDtoConverter).collect(Collectors.toList());

		final Map<String, Object> models = new HashMap<>();
		models.put("gridItems", dtos);
		return new ModelAndView("transaction.list", models);
	}

}
