package kr.co.chill.purchaseorder;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PurchaseorderDAOImpl implements PurchaseorderDAO {
	
	@Autowired
	private SqlSession sqlSession;

	
//	페이징 리스트
	@Override
	public List<PurchaseorderDTO> listPaged(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("kr.co.chill.purchaseorderMapper.listPaged", map);
	}
	@Override
	public List<PurchaseorderDTO> listSearchPaged(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("kr.co.chill.purchaseorderMapper.listSearchPaged", map);
	}
	@Override
	public int listSearchCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("kr.co.chill.purchaseorderMapper.listSearchCount", map);
	}
	
	
	
//	페이징x 리스트(엑셀출력용)
	@Override
	public List<PurchaseorderDTO> list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("kr.co.chill.purchaseorderMapper.list");
	}
	@Override
	public List<PurchaseorderDTO> listSearch(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("kr.co.chill.purchaseorderMapper.listSearch", map);
	}
	
	
	
//	상세조회
	@Override
	public PurchaseorderDTO detailOrderInfo(String purc_order_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("kr.co.chill.purchaseorderMapper.detailOrderInfo", purc_order_code);
	}
	@Override
	public List<PurchaseorderDTO> detailOrderList(String purc_order_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("kr.co.chill.purchaseorderMapper.detailOrderList", purc_order_code);
	}



//	등록
	@Override
	public void register(PurchaseorderDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.insert("kr.co.chill.purchaseorderMapper.register", dto);
	}
	@Override
	public int codemaker() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("kr.co.chill.purchaseorderMapper.codemaker");
	}
	
	
}
