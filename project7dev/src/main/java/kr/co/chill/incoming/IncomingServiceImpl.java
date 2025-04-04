package kr.co.chill.incoming;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IncomingServiceImpl implements IncomingService{
	
	@Autowired
	private IncomingDAO incomingDAO;
	
}
