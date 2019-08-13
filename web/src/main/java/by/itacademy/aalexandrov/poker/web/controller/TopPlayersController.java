package by.itacademy.aalexandrov.poker.web.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import by.itacademy.aalexandrov.poker.service.ICanvasjsChartService;

@Controller
@RequestMapping(value = "/topPlayers")
public class TopPlayersController extends AbstractController {

	@Autowired
	private ICanvasjsChartService canvasjsChartService;

	@RequestMapping(method = RequestMethod.GET)
	public String springMVC(ModelMap modelMap) {
		List<List<Map<Object, Object>>> canvasjsDataList = canvasjsChartService.getCanvasjsChartData();
		modelMap.addAttribute("dataPointsList", canvasjsDataList);
		return "topPlayers.list";
	}

}
