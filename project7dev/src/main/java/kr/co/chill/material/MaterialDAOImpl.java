package kr.co.chill.material;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MaterialDAOImpl implements MaterialDAO {
	
	@Inject
	private SqlSession sqlSession;
	
}
