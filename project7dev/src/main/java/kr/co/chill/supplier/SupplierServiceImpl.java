package kr.co.chill.supplier;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class SupplierServiceImpl implements SupplierService {
	
	@Inject
	SupplierDAO supplierDAO;
	
	
}
