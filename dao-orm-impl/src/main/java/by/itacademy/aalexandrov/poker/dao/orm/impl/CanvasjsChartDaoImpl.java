package by.itacademy.aalexandrov.poker.dao.orm.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import by.itacademy.aalexandrov.poker.dao.api.ICanvasjsChartDao;
import by.itacademy.aalexandrov.poker.dao.orm.CanvasjsChartData;

@Repository
public class CanvasjsChartDaoImpl implements ICanvasjsChartDao {

	@Override
	public List<List<Map<Object, Object>>> getCanvasjsChartData() {
		return CanvasjsChartData.getCanvasjsDataList();
	}

	@Override
	public Map<String, Integer> getCoefficient() {
		// TODO Auto-generated method stub
		return null;
	}

}