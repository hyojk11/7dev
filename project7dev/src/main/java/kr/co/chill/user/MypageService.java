package kr.co.chill.user;

public interface MypageService {

	//사원 상세조회
	UserDTO detailEmp(String user_id);
	
	//거래처상세조회
	UserDTO detailSup(String user_id);
	
	//아이디 중복조회
	boolean idCheck(String emp_id);
	
	//사원 개인정보수정
	void updateEmp(UserDTO dto);
	
}
