package kr.co.chill.user;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private LoginDAO loginDAO;
	
	//로그인 조회
	@Override
	public Map<String, Object> login(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return loginDAO.login(map);
	}

}
