package kr.co.chill.supplier;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;

@Controller
public class SupplierController {
	
	@Inject
	SupplierService supplierService;
	
	
}
