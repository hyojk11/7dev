package kr.co.chill.contract;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ContractServiceImpl implements ContractService {
	
	@Inject
	ContractDAO contractDAO;
	
	
	
	
}
