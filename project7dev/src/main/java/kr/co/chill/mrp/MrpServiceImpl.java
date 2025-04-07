package kr.co.chill.mrp;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class MrpServiceImpl implements MrpService {
	
	@Inject
	MrpDAO mrpDAO;
	
	
}
