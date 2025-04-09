package kr.co.chill.supplier;

import java.util.List;
import java.util.Map;

public interface SupplierService {
	//전체조회
	List<SupplierDTO> readSupplier() throws Exception;
	//선택조회(상세보기)
	List<SupplierDTO> readSupplierBySupNo(int supNo) throws Exception;
	//거래처정보 검색조회
	List<SupplierDTO> searchSupplier(Map<String, Object> searchMap) throws Exception;
	//신규등록
	void createSupplier(SupplierDTO supplierDTO) throws Exception;
	//수정
	void updateSupplier(SupplierDTO supplierDTO) throws Exception;
	//삭제
	void deleteSupplier(int supNo) throws Exception;

}
