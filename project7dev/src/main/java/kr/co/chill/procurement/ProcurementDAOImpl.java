package kr.co.chill.procurement;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ProcurementDAOImpl implements ProcurementDAO {
	
	@Inject
	private SqlSession sqlSession;
	
}
