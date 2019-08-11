package by.itacademy.aalexandrov.poker.service;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

public interface CanvasjsChartService {

	@Transactional
	List<List<Map<Object, Object>>> getCanvasjsChartData();

}