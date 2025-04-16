package kr.co.chill.user;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MypageDAOImpl implements MypageDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public UserDTO detailEmp(String user_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("kr.co.chill.userMapper.detailEmp", user_id);
	}

	@Override
	public int idCheck(String emp_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("kr.co.chill.userMapper.idCheck", emp_id);
	}

	@Override
	public void updateEmp(UserDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("kr.co.chill.userMapper.updateEmp", dto);
	}

}
