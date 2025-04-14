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
			InoutStorageDTO oneLineIn = sqlSession.selectOne(nameSpace+".lineInOne", oneIO);
			
			oneIO.setLine_in_no(oneLineIn.getLine_in_no());
			oneIO.setLine_in_date(oneLineIn.getLine_in_date());
			oneIO.setLine_in_cnt(oneLineIn.getLine_in_cnt());
			
			// 4. 외래키 이용하여 부품이름, 부품창고코드, 라인코드 불러오기
			oneIO.setMaterial_name(sqlSession.selectOne(nameSpace+".materialName", oneIO));
			oneIO.setMstorage_code(sqlSession.selectOne(nameSpace+".mstorageCode", oneIO));
			oneIO.setLine_code(sqlSession.selectOne(nameSpace+".lineCode", oneIO));
			
			storageIO.add(oneIO);
		}
		
		return storageIO;
	}

	@Override
	public List<IssuingDTO> linestock(int product_no, int product_cnt) {
		// 부품 및 라인내 재고현황 불러오기
		// 1. 선택한 제품에 사용되는 부품 정보로 라인 재고 리스트 불러오기
		List<IssuingDTO> linestock = sqlSession.selectList(nameSpace+".linelist", product_no);
		
		for(IssuingDTO i : linestock) {
			// 2. 입출고에 따라 실제재고 저장하기
			i.setProduct_no(product_no);
			List<Integer>lineSnapIn = sqlSession.selectList(nameSpace+".lineSnapIn", i); 
			List<Integer> lineSnapOut = sqlSession.selectList(nameSpace+".lineSnapOut", i);
			int realStock = i.getLine_stock();
			
			for(int j : lineSnapIn) {
				realStock += j;
			}
			for(int j : lineSnapOut) {
				j = i.getMaterial_quantity() * j;
				realStock -= j;
			}
			
			i.setLine_stock(realStock);
			
			// 3. 제품 생산에 필요한 총 부품수 저장하기
			i.setMaterial_produce(product_cnt * i.getMaterial_quantity());
		}
		
		return linestock;
	}

	@Override
	public List<InoutLineDTO> lineIO(List<IssuingDTO> linestock, int[] product_info) {
		// 제품 생산에 필요한 부품들 부품창고출고-라인입고 처리후 목록 저장하기
		List<InoutLineDTO> lineIO = new ArrayList<InoutLineDTO>();
		int outCnt = 0;
		
		for(IssuingDTO i : linestock) {
			// 1. 라인 출고내역 저장하기
			i.setProduct_no(product_info[0]);
			i.setProduct_cnt(product_info[1]);
			sqlSession.insert(nameSpace+".lineOut", i);
			InoutLineDTO oneIO = sqlSession.selectOne(nameSpace+".lineOutOne", i);
			
			// 2. 입고처리할 제품창고위치 불러오기
			int pstorage_no = sqlSession.selectOne(nameSpace+".pstorageOne", oneIO);
			oneIO.setPstorage_no(pstorage_no);
			
			if(outCnt < 1) {
				// 3. 제품 창고 입고내역 저장하기
				sqlSession.insert(nameSpace+".productIn", oneIO);
				InoutLineDTO oneProductIn = sqlSession.selectOne(nameSpace+".productInOne", oneIO);
				
				oneIO.setProduct_in_no(oneProductIn.getProduct_in_no());
				oneIO.setProduct_in_date(oneProductIn.getProduct_in_date());
				oneIO.setProduct_in_cnt(oneProductIn.getProduct_in_cnt());
				
				outCnt++;
			}
			// 4. 외래키 이용하여 제품이름, 제품코드, 라인코드 제품창고코드 불러오기
			InoutLineDTO details = sqlSession.selectOne(nameSpace+".lineIODetail", oneIO);
			
			oneIO.setProduct_name(details.getProduct_name());
			oneIO.setProduct_code(details.getProduct_code());
			oneIO.setLine_code(details.getLine_code());
			oneIO.setPstorage_code(details.getPstorage_code());
			
			lineIO.add(oneIO);
		}
		
		return lineIO;
	}
	
}
