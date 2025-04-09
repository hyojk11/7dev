package kr.co.chill.quotation;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;

@Controller
public class QuotationController {
	
	@Inject
	QuotationService quotationService;
	
	

}
