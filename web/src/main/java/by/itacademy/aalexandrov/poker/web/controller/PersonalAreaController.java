package by.itacademy.aalexandrov.poker.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.ITransaction;
import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.service.ITransactionService;
import by.itacademy.aalexandrov.poker.service.IUserAccountService;
import by.itacademy.aalexandrov.poker.web.converter.TransactionToDTOConverter;
import by.itacademy.aalexandrov.poker.web.converter.UserAccountToDTOConverter;
import by.itacademy.aalexandrov.poker.web.dto.TransactionDTO;
import by.itacademy.aalexandrov.poker.web.dto.UserAccountDTO;
import by.itacademy.aalexandrov.poker.web.security.AuthHelper;

@Controller
@RequestMapping(value = "/personalArea")
public class PersonalAreaController extends AbstractController {

	@Autowired
	private IUserAccountService userAccountService;

	@Autowired
	private UserAccountToDTOConverter userAccountToDtoConverter;

	@Autowired
	private ITransactionService transactionService;

	@Autowired
	private TransactionToDTOConverter transactionToDtoConverter;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView index(final HttpServletRequest req) {
		int id = AuthHelper.getLoggedUserId();

		IUserAccount entity = userAccountService.getFullInfo(id);
		UserAccountDTO dtos = userAccountToDtoConverter.apply(entity);

		Map<String, Object> model = new HashMap<>();
		model.put("userAccount", dtos);
		return new ModelAndView("personalArea.index", model);
	}

	@RequestMapping(value = "/updateNickname", method = RequestMethod.POST)
	public ResponseEntity<UserAccountDTO> updateUserAccount(
			@RequestParam(name = "message", required = true) final String message,
			@RequestParam(name = "id", required = true) final Integer id) {
		userAccountService.updateNickName(id, message);

		UserAccountDTO dto = userAccountToDtoConverter.apply(userAccountService.getFullInfo(id));

		return new ResponseEntity<UserAccountDTO>(dto, HttpStatus.OK);
	}

	@RequestMapping(value = "/updateBalance", method = RequestMethod.GET)
	public ResponseEntity<TransactionDTO> updateBalance(
			@RequestParam(name = "summ", required = true) final Integer summ) {
		int id = AuthHelper.getLoggedUserId();
		IUserAccount entity = userAccountService.getFullInfo(id);
		ITransaction transaction = transactionService.createEntity();
		transaction.setUserAccount(entity);
		transaction.setAmount(summ);
		transaction.setComment("Add from personal area");
		transactionService.save(transaction);
		TransactionDTO dto = transactionToDtoConverter.apply(transactionService.getFullInfo(transaction.getId()));

		return new ResponseEntity<TransactionDTO>(dto, HttpStatus.OK);
	}

//	@RequestMapping(value = "/upload", method = RequestMethod.POST)
//	public void handleUpload(@RequestParam("file") MultipartFile file) throws IOException {
//		if (!file.isEmpty()) {
//			byte[] bytes = file.getBytes(); // alternatively, file.getInputStream();
//			// application logic
//		}
//	}
}
