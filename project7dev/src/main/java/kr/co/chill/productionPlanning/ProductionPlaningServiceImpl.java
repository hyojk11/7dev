package kr.co.chill.productionPlanning;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ProductionPlaningServiceImpl implements ProductionPlanningService {
	
	@Inject
	ProductionPlanningDAO productionPlanningDAO;
	//전체조회
	@Override
	public List<ProductionPlanningDTO> readProductionPlanning() throws Exception {
		// TODO Auto-generated method stub
		return productionPlanningDAO.readProductionPlanning();
	}
	//선택조회(상세보기)
	@Override
	public ProductionPlanningDTO readProductionPlanningByPrplNo(int prplNo) throws Exception {
		// TODO Auto-generated method stub
		return productionPlanningDAO.readProductionPlanningByPrplNo(prplNo);
	}
	//제품코드로 검색조회
	@Override
	public List<ProductionPlanningDTO> searchProductionPlanning(Map<String, Object> searchMap) throws Exception {
		// TODO Auto-generated method stub
		return productionPlanningDAO.searchProductionPlanning(searchMap);
	}
	//등록
	@Override
	public void createProductionPlanning(ProductionPlanningDTO productionPlanningDTO) throws Exception {
		// TODO Auto-generated method stub
		productionPlanningDAO.createProductionPlanning(productionPlanningDTO);
	}
	//등록 시 사원번호로 사원정보 조회
	@Override
	public ProductionPlanningDTO getEmployeeByEmpNo(int empNo) throws Exception {
		// TODO Auto-generated method stub
		return productionPlanningDAO.getEmployeeByEmpNo(empNo);
	}
	//등록 시 창고번호로 창고조회
	@Override
	public ProductionPlanningDTO getPstorageByPstorageNo(int pstorageNo) throws Exception {
		// TODO Auto-generated method stub
		return productionPlanningDAO.getPstorageByPstorageNo(pstorageNo);
	}
	//수정
	@Override
	public void updateProductionPlanning(ProductionPlanningDTO productionPlanningDTO) throws Exception {
		// TODO Auto-generated method stub
		productionPlanningDAO.updateProductionPlanning(productionPlanningDTO);
	}
	//삭제
	@Override
	public void deleteProductionPlanning(int prplNo) throws Exception {
		// TODO Auto-generated method stub
		productionPlanningDAO.deleteProductionPlanning(prplNo);
	}
	
	
	
	
	@Override
	public List<ProductionPlanningDTO> listSearchPaged(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return productionPlanningDAO.listSearchPaged(map);
	}
	@Override
	public List<ProductionPlanningDTO> listSearch(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return productionPlanningDAO.listSearch(map);
	}
	@Override
	public int listSearchCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return productionPlanningDAO.listSearchCount(map);
	}
	@Override
	public List<ProductionPlanningDTO> searchProduct(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return productionPlanningDAO.searchProduct(map);
	}
	@Override
	public ProductionPlanningDTO searchStock(int product_no) throws Exception {
		// TODO Auto-generated method stub
		return productionPlanningDAO.searchStock(product_no);
	}
	@Override
	public String codemaker(String reg_date) {
		String datePart = reg_date.replace("-","");
		int count = productionPlanningDAO.codemaker(datePart);
		String serial = String.format("%02d", count + 1);
		return "PP" + datePart + serial;
	}
	
}
