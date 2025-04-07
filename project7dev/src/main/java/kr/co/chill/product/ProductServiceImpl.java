package kr.co.chill.product;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Inject
	ProductDAO productDAO;
	
	
	
}
