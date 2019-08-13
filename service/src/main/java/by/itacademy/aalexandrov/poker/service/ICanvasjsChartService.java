package by.itacademy.aalexandrov.poker.service;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

public interface ICanvasjsChartService {

	@Transactional
	List<List<Map<Object, Object>>> getCanvasjsChartData();

	@Transactional
	Map<String, Integer> getCoefficient();

}