package kr.co.chill.user;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAOImpl implements LoginDAO {
	
	@Autowired
	private SqlSession sqlSession;

	//로그인 조회
	@Override
	public Map<String, Object> login(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("kr.co.chill.userMapper.login", map);
	}

}
