package by.itacademy.aalexandrov.poker.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import by.itacademy.aalexandrov.poker.dao.api.entity.table.IUserAccount;
import by.itacademy.aalexandrov.poker.service.IUserAccountService;
import by.itacademy.aalexandrov.poker.web.converter.UserAccountToDTOConverter;
import by.itacademy.aalexandrov.poker.web.dto.UserAccountDTO;

@Controller
@RequestMapping(value = "/topPlayers")
public class TopPlayersController extends AbstractController {

	@Autowired
	private IUserAccountService userAccountService;
	@Autowired
	private UserAccountToDTOConverter toDtoConverter;

	@RequestMapping(method = RequestMethod.GET)
	public String springMVC(ModelMap modelMap) {
		Map<Object, Object> map = null;
		List<List<Map<Object, Object>>> list = new ArrayList<List<Map<Object, Object>>>();
		List<Map<Object, Object>> dataPoints1 = new ArrayList<Map<Object, Object>>();

		final List<IUserAccount> entities = userAccountService.getFullInfo();
		final List<UserAccountDTO> dtos = entities.stream().map(toDtoConverter).collect(Collectors.toList());

		Map<String, Integer> coefMap = new HashMap<String, Integer>();
		for (UserAccountDTO userAccountDTO : dtos) {
			String nickName = userAccountDTO.getNickname();
			int s = userAccountDTO.getSumGames();
			int w = userAccountDTO.getWonGames();
			int n = 0;
			try {
				n = s / w;
			} catch (Exception e) {
				System.out.println(e);
			}

			int coef = 0;
			try {
				coef = 100 / n;
			} catch (Exception e) {
				System.out.println(e);
			}

			coefMap.put(nickName, coef);
		}

		Map<String, Integer> coefMapSorted = coefMap.entrySet().stream()
				.sorted(Map.Entry.<String, Integer>comparingByValue().reversed()).collect(Collectors.toMap(
						Map.Entry::getKey, Map.Entry::getValue, (oldValue, newValue) -> oldValue, LinkedHashMap::new));

		String[] keys = new String[coefMapSorted.size()];
		Integer[] values = new Integer[coefMapSorted.size()];

		int index = 0;
		for (Map.Entry<String, Integer> mapEntry : coefMapSorted.entrySet()) {
			keys[index] = mapEntry.getKey();
			values[index] = mapEntry.getValue();
			index++;
		}

		map = new HashMap<Object, Object>();
		map.put("label", keys[9]);
		map.put("y", values[9]);
		dataPoints1.add(map);
		map = new HashMap<Object, Object>();
		map.put("label", keys[8]);
		map.put("y", values[8]);
		dataPoints1.add(map);
		map = new HashMap<Object, Object>();
		map.put("label", keys[7]);
		map.put("y", values[7]);
		dataPoints1.add(map);
		map = new HashMap<Object, Object>();
		map.put("label", keys[6]);
		map.put("y", values[6]);
		dataPoints1.add(map);
		map = new HashMap<Object, Object>();
		map.put("label", keys[5]);
		map.put("y", values[5]);
		dataPoints1.add(map);
		map = new HashMap<Object, Object>();
		map.put("label", keys[4]);
		map.put("y", values[4]);
		dataPoints1.add(map);
		map = new HashMap<Object, Object>();
		map.put("label", keys[3]);
		map.put("y", values[3]);
		dataPoints1.add(map);
		map = new HashMap<Object, Object>();
		map.put("label", keys[2]);
		map.put("y", values[2]);
		dataPoints1.add(map);
		map = new HashMap<Object, Object>();
		map.put("label", keys[1]);
		map.put("y", values[1]);
		dataPoints1.add(map);
		map = new HashMap<Object, Object>();
		map.put("label", keys[0]);
		map.put("y", values[0]);
		dataPoints1.add(map);

		list.add(dataPoints1);

		modelMap.addAttribute("dataPointsList", list);
		return "topPlayers.list";
	}

}
