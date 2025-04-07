package kr.co.chill.product;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;

@Controller
public class ProductController {
	
	@Inject
	ProductService productService;
	
	
}
