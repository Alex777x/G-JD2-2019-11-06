package by.itacademy.aalexandrov.poker.dao.api;

import java.util.List;
import java.util.Map;

public interface ICanvasjsChartDao {

	List<List<Map<Object, Object>>> getCanvasjsChartData();

	Map<String, Integer> getCoefficient();

}