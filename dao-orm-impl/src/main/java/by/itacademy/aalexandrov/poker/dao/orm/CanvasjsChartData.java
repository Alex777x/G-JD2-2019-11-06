package by.itacademy.aalexandrov.poker.dao.orm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CanvasjsChartData {

	static Map<Object, Object> map = null;
	static List<List<Map<Object, Object>>> list = new ArrayList<List<Map<Object, Object>>>();
	static List<Map<Object, Object>> dataPoints1 = new ArrayList<Map<Object, Object>>();

//	static IUserAccountDao dao;
//	static Map<String, Integer> coefMap = dao.getCoefficient();

//	static Map<String, Integer> coefMapSorted = sort();
//
//	public static Map<String, Integer> sort() {
//		Map<String, Integer> sorted = coefMap.entrySet().stream()
//				.sorted(Collections.reverseOrder(Map.Entry.comparingByValue()))
//				.collect(toMap(Map.Entry::getKey, Map.Entry::getValue, (e1, e2) -> e2, LinkedHashMap::new));
//		return sorted;
//	}

	static {
		map = new HashMap<Object, Object>();
		map.put("label", "User8");
		map.put("y", 3.2);
		dataPoints1.add(map);
		map = new HashMap<Object, Object>();
		map.put("label", "User1");
		map.put("y", 2.9);
		dataPoints1.add(map);
		map = new HashMap<Object, Object>();
		map.put("label", "User5");
		map.put("y", 5.2);
		dataPoints1.add(map);
		map = new HashMap<Object, Object>();
		map.put("label", "User3");
		map.put("y", 7.9);
		dataPoints1.add(map);
		map = new HashMap<Object, Object>();
		map.put("label", "User4");
		map.put("y", 8.6);
		dataPoints1.add(map);
		map = new HashMap<Object, Object>();
		map.put("label", "User2");
		map.put("y", 11.6);
		dataPoints1.add(map);
		map = new HashMap<Object, Object>();
		map.put("label", "User6");
		map.put("y", 17.1);
		dataPoints1.add(map);

		list.add(dataPoints1);
	}

	public static List<List<Map<Object, Object>>> getCanvasjsDataList() {
		return list;
	}
}