package kr.co.chill.quotation;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class QuotationServiceImpl implements QuotationService {
	
	@Inject
	QuotationDAO quotationDAO;
	
	
	
}
