package kr.co.chill.procurement;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;

@Controller
public class ProcurementController {
	
	@Inject
	ProcurementService procurementService;
	
}
