package kr.co.chill.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	private MypageDAO mypageDAO;

//	사원 상세조회
	@Override
	public UserDTO detailEmp(String user_id) {
		// TODO Auto-generated method stub
		return mypageDAO.detailEmp(user_id);
	}
	
//	거래처상세조회
	@Override
	public UserDTO detailSup(String user_id) {
		// TODO Auto-generated method stub
		return mypageDAO.detailSup(user_id);
	}

//	아이디 중복조회
	@Override
	public boolean idCheck(String emp_id) {
		// TODO Auto-generated method stub
		return mypageDAO.idCheck(emp_id) > 0;
	}

//	사원 개인정보수정
	@Override
	public void updateEmp(UserDTO dto) {
		// TODO Auto-generated method stub
		mypageDAO.updateEmp(dto);
	}



}
