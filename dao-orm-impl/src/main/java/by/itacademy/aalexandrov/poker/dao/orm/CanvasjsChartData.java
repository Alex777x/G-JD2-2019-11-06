package by.itacademy.aalexandrov.poker.dao.orm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import by.itacademy.aalexandrov.poker.dao.api.IUserAccountDao;

@Service
public class CanvasjsChartData {

	static Map<Object, Object> map = null;
	static List<List<Map<Object, Object>>> list = new ArrayList<List<Map<Object, Object>>>();
	static List<Map<Object, Object>> dataPoints1 = new ArrayList<Map<Object, Object>>();

	IUserAccountDao dao;
	Map<String, Integer> coefMap = dao.getCoefficient();

	Map<String, Integer> coefMapSorted = sort(coefMap);

	public Map<String, Integer> sort(Map<String, Integer> coefMap) {
		Map<String, Integer> coefMapSorted = coefMap;
		coefMapSorted.entrySet().stream().sorted(Map.Entry.<String, Integer>comparingByValue().reversed());
		return coefMapSorted;
	}

	static {
		map = new HashMap<Object, Object>();
		map.put("label", "User1");
		map.put("y", 3.2);
		dataPoints1.add(map);
		map = new HashMap<Object, Object>();
		map.put("label", "User14");
		map.put("y", 2.9);
		dataPoints1.add(map);
		map = new HashMap<Object, Object>();
		map.put("label", "User5");
		map.put("y", 5.2);
		dataPoints1.add(map);
		map = new HashMap<Object, Object>();
		map.put("label", "User77");
		map.put("y", 7.9);
		dataPoints1.add(map);
		map = new HashMap<Object, Object>();
		map.put("label", "User45");
		map.put("y", 8.6);
		dataPoints1.add(map);
		map = new HashMap<Object, Object>();
		map.put("label", "User3");
		map.put("y", 11.6);
		dataPoints1.add(map);
		map = new HashMap<Object, Object>();
		map.put("label", "User10");
		map.put("y", 17.1);
		dataPoints1.add(map);

		list.add(dataPoints1);
	}

	public static List<List<Map<Object, Object>>> getCanvasjsDataList() {
		return list;
	}
}