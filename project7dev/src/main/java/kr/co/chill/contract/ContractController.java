package kr.co.chill.contract;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;

@Controller
public class ContractController {
	
	@Inject
	ContractService contractService;
	
	
}
