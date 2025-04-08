package kr.co.chill.issuing;

import java.util.ArrayList;
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
	public IssuingDTO productOne(int product_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace+".productOne", product_no);
	}

	@Override
	public List<IssuingDTO> materialstock(int product_no, int product_cnt) {
		// TODO Auto-generated method stub		
		List<IssuingDTO> materialstock = sqlSession.selectList(nameSpace+".materiallist", product_no);
		
		for(IssuingDTO i : materialstock) {
			int material_no = i.getMaterial_no();
			IssuingDTO mstorage = sqlSession.selectOne(nameSpace+".mstorageOne", material_no);
			
			i.setMstorage_no(mstorage.getMstorage_no());
			i.setMstorage_stock(mstorage.getMstorage_stock());
			i.setMstorage_code(mstorage.getMstorage_code());
			i.setMaterial_produce(product_cnt * i.getMaterial_quantity());
		}
		
		return materialstock;
	}

	@Override
	public List<InoutStorageDTO> storageIO(List<IssuingDTO> materialstock) {
		// TODO Auto-generated method stub
		List<InoutStorageDTO> storageIO = new ArrayList<InoutStorageDTO>();
		
		for(IssuingDTO i : materialstock) {
			sqlSession.insert(nameSpace+".materialOut", i);
			InoutStorageDTO oneIO = sqlSession.selectOne(nameSpace+".materialOutOne", i);
			
			int line_no = sqlSession.selectOne(nameSpace+".lineOne", oneIO);
			oneIO.setLine_no(line_no);
			oneIO.setMaterial_code(i.getMaterial_code());
			
			sqlSession.insert(nameSpace+".lineIn", oneIO);
			InoutStorageDTO oneLineOut = sqlSession.selectOne(nameSpace+".lineInOne", oneIO);
			
			oneIO.setLine_in_no(oneLineOut.getLine_in_no());
			oneIO.setLine_in_date(oneLineOut.getLine_in_date());
			oneIO.setLine_in_cnt(oneLineOut.getLine_in_cnt());
			
			storageIO.add(oneIO);
		}
		
		return storageIO;
	}
	
}
