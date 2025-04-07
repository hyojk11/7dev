package kr.co.chill.user;

import java.util.Map;

public interface LoginDAO {
	
	Map<String, Object> login(Map<String, Object> map); //로그인조회
	
}
