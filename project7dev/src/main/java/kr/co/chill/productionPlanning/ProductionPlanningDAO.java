package kr.co.chill.productionPlanning;

import java.util.List;
import java.util.Map;

public interface ProductionPlanningDAO {
	
	//전체조회 + 페이징 + 검색
	List<ProductionPlanningDTO> listSearchPaged(Map<String, Object> map) throws Exception;
	//전체조회 + 검색 (엑셀출력용)
	List<ProductionPlanningDTO> listSearch(Map<String, Object> map) throws Exception;
	//검색리스트 갯수 (페이징용)
	int listSearchCount(Map<String, Object> map);
	
	//제품검색조회 (생산계획 등록용)
	List<ProductionPlanningDTO> searchProduct(Map<String, Object> map) throws Exception;
	//창고재고조회
	ProductionPlanningDTO searchStock (int product_no) throws Exception;
	
	//코드메이커
	int codemaker(String reg_date);
	//창고코드메이커
	int codemakerPstorage();
	//창고등록
	void registerPstorage(ProductionPlanningDTO productionPlanningDTO) throws Exception;
	
	
	
	//전체조회
	List<ProductionPlanningDTO> readProductionPlanning() throws Exception;
	//선택조회(상세보기)
	ProductionPlanningDTO readProductionPlanningByPrplNo(int prplNo) throws Exception;
	//제품코드로 검색조회
	List<ProductionPlanningDTO> searchProductionPlanning(Map<String, Object> searchMap) throws Exception;
	//등록
	void createProductionPlanning(ProductionPlanningDTO productionPlanningDTO) throws Exception;
	//등록 시 사원번호로 사원정보 조회
	ProductionPlanningDTO getEmployeeByEmpNo(int empNo) throws Exception;
	//등록 시 창고번호로 창고조회
	ProductionPlanningDTO getPstorageByPstorageNo(int pstorageNo) throws Exception;
	//수정
	void updateProductionPlanning(ProductionPlanningDTO productionPlanningDTO) throws Exception;
	//삭제
	void deleteProductionPlanning(int prplNo) throws Exception;

}
