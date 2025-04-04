package kr.co.chill.issuing;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IssuingServiceImpl implements IssuingService{
	@Autowired
	private IssuingDAO issuingDAO;

}
