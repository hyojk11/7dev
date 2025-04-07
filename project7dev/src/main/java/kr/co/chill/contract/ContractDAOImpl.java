package kr.co.chill.contract;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ContractDAOImpl implements ContractDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	
	
}
