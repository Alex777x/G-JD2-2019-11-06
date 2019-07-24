package by.itacademy.aalexandrov.poker.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITransaction;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.dao.api.filter.TransactionFilter;
import by.itacademy.aalexandrov.poker.service.ITransactionService;
import by.itacademy.aalexandrov.poker.service.IUserAccountService;
import by.itacademy.aalexandrov.poker.web.converter.TransactionFromDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.TransactionToDTOConverter;
import by.itacademy.aalexandrov.poker.web.dto.TransactionDTO;
import by.itacademy.aalexandrov.poker.web.dto.grid.GridStateDTO;

@Controller
@RequestMapping(value = "/transaction")
public class TransactionController extends AbstractController {

	private ITransactionService transactionService;

	private TransactionToDTOConverter toDtoConverter;

	private TransactionFromDTOConverter fromDtoConverter;

	private IUserAccountService userAccountService;

	@Autowired
	public TransactionController(ITransactionService transactionService, TransactionToDTOConverter toDtoConverter,
			TransactionFromDTOConverter fromDtoConverter, IUserAccountService userAccountService) {
		super();
		this.transactionService = transactionService;
		this.toDtoConverter = toDtoConverter;
		this.fromDtoConverter = fromDtoConverter;
		this.userAccountService = userAccountService;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView index(final HttpServletRequest req,
			@RequestParam(name = "page", required = false) final Integer pageNumber,
			@RequestParam(name = "sort", required = false) final String sortColumn) {

		final GridStateDTO gridState = getListDTO(req);
		gridState.setPage(pageNumber);
		gridState.setSort(sortColumn, "id");

		final TransactionFilter filter = new TransactionFilter();
		prepareFilter(gridState, filter);

		final List<ITransaction> entities = transactionService.find(filter);
		List<TransactionDTO> dtos = entities.stream().map(toDtoConverter).collect(Collectors.toList());
		gridState.setTotalCount(transactionService.getCount(filter));

		final Map<String, Object> transactions = new HashMap<>();
		transactions.put("gridItems", dtos);
		return new ModelAndView("transaction.list", transactions);
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView showForm() {
		final Map<String, Object> hashMap = new HashMap<>();
		hashMap.put("formTransaction", new TransactionDTO());
		loadCommonFormTransactions(hashMap);
		return new ModelAndView("transaction.edit", hashMap);
	}

	@RequestMapping(method = RequestMethod.POST)
	public Object save(@Valid @ModelAttribute("formTransaction") final TransactionDTO formTransaction,
			final BindingResult result) {
		if (result.hasErrors()) {
			final Map<String, Object> hashMap = new HashMap<>();
			hashMap.put("formTransaction", formTransaction);
			loadCommonFormTransactions(hashMap);
			return new ModelAndView("transaction.edit", hashMap);
		} else {
			final ITransaction entity = fromDtoConverter.apply(formTransaction);
			transactionService.save(entity);
			return "redirect:/transaction";
		}

	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public ModelAndView viewDetails(@PathVariable(name = "id", required = true) final Integer id) {
		final ITransaction dbModel = transactionService.get(id);
		final TransactionDTO dto = toDtoConverter.apply(dbModel);
		final Map<String, Object> hashMap = new HashMap<>();
		hashMap.put("formTransaction", dto);
		hashMap.put("readonly", true);
		loadCommonFormTransactions(hashMap);
		return new ModelAndView("transaction.edit", hashMap);
	}
	
	@RequestMapping(value = "/{id}/edit", method = RequestMethod.GET)
	public ModelAndView edit(@PathVariable(name = "id", required = true) final Integer id) {
		final TransactionDTO dto = toDtoConverter.apply(transactionService.get(id));

		final Map<String, Object> hashMap = new HashMap<>();
		hashMap.put("formTransaction", dto);
		loadCommonFormTransactions(hashMap);

		return new ModelAndView("transaction.edit", hashMap);
	}
	
	@RequestMapping(value = "/{id}/delete", method = RequestMethod.GET)
	public String delete(@PathVariable(name = "id", required = true) final Integer id) {
		transactionService.delete(id);
		return "redirect:/transaction";
	}
	
	private void loadCommonFormTransactions(final Map<String, Object> hashMap) {
		final List<IUserAccount> userAccounts = userAccountService.getAll();

		final Map<Integer, String> userAccountsMap = userAccounts.stream()
				.collect(Collectors.toMap(IUserAccount::getId, IUserAccount::getNickname));
		hashMap.put("userAccountsChoices", userAccountsMap);
	}

}
