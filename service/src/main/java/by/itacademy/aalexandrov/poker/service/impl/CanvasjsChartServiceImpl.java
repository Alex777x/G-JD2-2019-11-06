package by.itacademy.aalexandrov.poker.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import by.itacademy.aalexandrov.poker.dao.api.ICanvasjsChartDao;
import by.itacademy.aalexandrov.poker.service.ICanvasjsChartService;

@Service
public class CanvasjsChartServiceImpl implements ICanvasjsChartService {

	@Autowired
	private ICanvasjsChartDao canvasjsChartDao;

	public void setCanvasjsChartDao(ICanvasjsChartDao canvasjsChartDao) {
		this.canvasjsChartDao = canvasjsChartDao;
	}

	@Override
	public List<List<Map<Object, Object>>> getCanvasjsChartData() {
		return canvasjsChartDao.getCanvasjsChartData();
	}

	@Override
	public Map<String, Integer> getCoefficient() {
		return canvasjsChartDao.getCoefficient();
	}

}