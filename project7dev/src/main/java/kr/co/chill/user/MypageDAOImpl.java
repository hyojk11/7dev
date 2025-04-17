package kr.co.chill.user;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MypageDAOImpl implements MypageDAO {
	
	@Autowired
	private SqlSession sqlSession;

//	사원 상세조회
	@Override
	public UserDTO detailEmp(String user_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("kr.co.chill.userMapper.detailEmp", user_id);
	}
	
//	거래처 상세조회
	@Override
	public UserDTO detailSup(String user_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("kr.co.chill.userMapper.detailSup", user_id);
	}
	
//	아이디 중복조회
	@Override
	public int idCheck(String emp_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("kr.co.chill.userMapper.idCheck", emp_id);
	}

//	사원 개인정보수정
	@Override
	public void updateEmp(UserDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("kr.co.chill.userMapper.updateEmp", dto);
	}



}
