package kr.co.chill.issuing;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class IssuingDAOImpl implements IssuingDAO{
	@Autowired
	private SqlSession sqlSession;
	
	private String nameSpace = "kr.co.chill.issuingMapper";

	@Override
	public List<IssuingDTO> productlist() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace+".productlist");
	}

	@Override
	public List<IssuingDTO> materialstock(int product_no) {
		// TODO Auto-generated method stub
		
		List<IssuingDTO> materialstock = sqlSession.selectList(nameSpace+".materiallist", product_no);
		for(IssuingDTO i : materialstock) {
			int material_no = i.getMaterial_no();
			IssuingDTO mstorage = sqlSession.selectOne(nameSpace+".mstorageOne", material_no);
			i.setMstorage_no(mstorage.getMstorage_no());
			i.setMstorage_stock(mstorage.getMstorage_stock());
			i.setMstorage_code(mstorage.getMstorage_code());
		}
		
		return materialstock;
	}
	
}
