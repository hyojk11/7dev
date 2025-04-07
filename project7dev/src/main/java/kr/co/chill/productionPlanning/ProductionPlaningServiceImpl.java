package kr.co.chill.productionPlanning;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ProductionPlaningServiceImpl implements ProductionPlanningService {
	
	@Inject
	ProductionPlanningDAO productionPlanningDAO;
	
	
}
