package kr.co.chill.user;

import java.util.Map;

public interface LoginDAO {
	
	Map<String, Object> login(Map<String, Object> map); //로그인조회
	int searchEmpNo(String user_id); //사원,관리자 구분위한 emp_no조회
	
}
