package by.itacademy.aalexandrov.poker.dao.orm.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import by.itacademy.aalexandrov.poker.dao.api.CanvasjsChartDao;
import by.itacademy.aalexandrov.poker.dao.orm.CanvasjsChartData;

@Repository
public class CanvasjsChartDaoImpl implements CanvasjsChartDao {

	@Override
	public List<List<Map<Object, Object>>> getCanvasjsChartData() {
		return CanvasjsChartData.getCanvasjsDataList();
	}

}