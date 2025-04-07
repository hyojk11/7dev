package kr.co.chill.mrp;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MrpDAOImpl implements MrpDAO {
	
	@Inject
	private SqlSession sqlSession;
	
}
