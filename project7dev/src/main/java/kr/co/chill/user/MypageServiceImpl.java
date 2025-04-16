package kr.co.chill.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	private MypageDAO mypageDAO;

	@Override
	public UserDTO detailEmp(String user_id) {
		// TODO Auto-generated method stub
		return mypageDAO.detailEmp(user_id);
	}

	@Override
	public boolean idCheck(String emp_id) {
		// TODO Auto-generated method stub
		return mypageDAO.idCheck(emp_id) > 0;
	}

	@Override
	public void updateEmp(UserDTO dto) {
		// TODO Auto-generated method stub
		mypageDAO.updateEmp(dto);
	}

}
