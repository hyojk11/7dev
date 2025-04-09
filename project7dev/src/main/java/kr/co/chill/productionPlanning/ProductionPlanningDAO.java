package kr.co.chill.productionPlanning;

import java.util.List;
import java.util.Map;

public interface ProductionPlanningDAO {
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
