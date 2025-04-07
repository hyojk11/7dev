package kr.co.chill.productionPlanning;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;

@Controller
public class ProductionPlaningController {
	
	@Inject
	ProductionPlanningService productionPlanningService;
	
}
