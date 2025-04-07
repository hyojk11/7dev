package kr.co.chill.purchaseorder;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PurchaseorderDAOImpl implements PurchaseorderDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<PurchaseorderDTO> list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("kr.co.chill.purchaseorderMapper.list");
	}
	
	
}
