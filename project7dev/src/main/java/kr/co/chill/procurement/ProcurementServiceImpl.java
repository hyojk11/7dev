package kr.co.chill.procurement;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ProcurementServiceImpl implements ProcurementService {
	
	@Inject
	ProcurementDAO procurementDAO;
	
}
