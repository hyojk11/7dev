package kr.co.chill.supplier;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class SupplierDAOImpl implements SupplierDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	
}
