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
		// 제품 목록 불러오기
		return sqlSession.selectList(nameSpace+".productlist");
	}
	
	@Override
	public IssuingDTO productOne(int product_no) {
		// 선택한 제품 정보 불러오기
		return sqlSession.selectOne(nameSpace+".productOne", product_no);
	}

	@Override
	public List<IssuingDTO> materialstock(int product_no, int product_cnt) {
		// 부품 및 창고내 재고현황 불러오기
		// 1. 선택한 제품에 사용되는 부품 정보 리스트 불러오기
		List<IssuingDTO> materialstock = sqlSession.selectList(nameSpace+".materiallist", product_no);
		
		for(IssuingDTO i : materialstock) {
			// 2. 각 부품이 저장되어 있는 부품창고 정보 불러오기
			int material_no = i.getMaterial_no();
			IssuingDTO mstorage = sqlSession.selectOne(nameSpace+".mstorageOne", material_no);
			
			i.setMstorage_no(mstorage.getMstorage_no());
			i.setMstorage_snapshot_month(mstorage.getMstorage_snapshot_month());
			i.setMstorage_code(mstorage.getMstorage_code());
			
			// 3. 스냅샷을 기준으로 부품 입출고 내역을 불러오기
			List<Integer> materialSnapIn = sqlSession.selectList(nameSpace+".materialSnapIn", i); 
			List<Integer> materialSnapOut = sqlSession.selectList(nameSpace+".materialSnapOut", i);
			int realStock = mstorage.getMstorage_stock();
			
			// 4. 입출고 내역에 따라 부품창고 실제재고 수 저장하기
			for(int j : materialSnapIn) {
				realStock += j;
			}
			for(int j : materialSnapOut) {
				realStock -= j;
			}
			
			i.setMstorage_stock(realStock);
			i.setMaterial_produce(product_cnt * i.getMaterial_quantity());
		}
		
		return materialstock;
	}

	@Override
	public List<InoutStorageDTO> storageIO(List<IssuingDTO> materialstock) {
		// 제품 생산에 필요한 부품들 부품창고출고-라인입고 처리후 목록 저장하기
		List<InoutStorageDTO> storageIO = new ArrayList<InoutStorageDTO>();
		
		for(IssuingDTO i : materialstock) {
			// 1. 개별 부품창고 출고내역 저장하기
			sqlSession.insert(nameSpace+".materialOut", i);
			InoutStorageDTO oneIO = sqlSession.selectOne(nameSpace+".materialOutOne", i);
			
			// 2. 입고처리할 라인위치 불러오기
			int line_no = sqlSession.selectOne(nameSpace+".lineOne", oneIO);
			oneIO.setLine_no(line_no);
			oneIO.setMaterial_code(i.getMaterial_code());
			
			// 3. 개별 라인 입고내역 저장하기
			sqlSession.insert(nameSpace+".lineIn", oneIO);
			InoutStorageDTO oneLineOut = sqlSession.selectOne(nameSpace+".lineInOne", oneIO);
			
			oneIO.setLine_in_no(oneLineOut.getLine_in_no());
			oneIO.setLine_in_date(oneLineOut.getLine_in_date());
			oneIO.setLine_in_cnt(oneLineOut.getLine_in_cnt());
			
			// 4. 외래키 이용하여 부품이름, 부품창고코드, 라인코드 불러오기
			oneIO.setMaterial_name(sqlSession.selectOne(nameSpace+".materialName", oneIO));
			oneIO.setMstorage_code(sqlSession.selectOne(nameSpace+".mstorageCode", oneIO));
			oneIO.setLine_code(sqlSession.selectOne(nameSpace+".lineCode", oneIO));
			
			storageIO.add(oneIO);
		}
		
		return storageIO;
	}
	
}
