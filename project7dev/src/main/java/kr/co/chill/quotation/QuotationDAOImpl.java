package kr.co.chill.quotation;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class QuotationDAOImpl implements QuotationDAO {
	
	@Inject
	private SqlSession sqlSession;

}
