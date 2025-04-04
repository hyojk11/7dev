package kr.co.chill.issuing;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class IssuingDAOImpl implements IssuingDAO{
	@Autowired
	private SqlSession sqlSession;
	
}
