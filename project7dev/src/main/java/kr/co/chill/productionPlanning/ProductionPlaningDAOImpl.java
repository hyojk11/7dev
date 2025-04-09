package kr.co.chill.productionPlanning;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ProductionPlaningDAOImpl implements ProductionPlanningDAO {
	
	@Inject
	private SqlSession sqlSession;
	//전체조회
	@Override
	public List<ProductionPlanningDTO> readProductionPlanning() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("kr.co.chill.productionPlanningMapper.readProductionPlanning");
	}
	//선택조회(상세보기)
	@Override
	public ProductionPlanningDTO readProductionPlanningByPrplNo(int prplNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("kr.co.chill.productionPlanningMapper.readProductionPlanningByPrplNo", prplNo);
	}
	//제품코드로 검색조회
	@Override
	public List<ProductionPlanningDTO> searchProductionPlanning(Map<String, Object> searchMap) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("kr.co.chill.productionPlanningMapper.searchProductionPlanning", searchMap);
	}
	//등록
	@Override
	public void createProductionPlanning(ProductionPlanningDTO productionPlanningDTO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("kr.co.chill.productionPlanningMapper.createProductionPlanning", productionPlanningDTO);
	}
	//등록 시 사원번호로 사원정보 조회
	@Override
	public ProductionPlanningDTO getEmployeeByEmpNo(int empNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("kr.co.chill.productionPlanningMapper.getEmployeeByEmpNo", empNo);
	}
	//등록 시 창고번호로 창고조회
	@Override
	public ProductionPlanningDTO getPstorageByPstorageNo(int pstorageNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("kr.co.chill.productionPlanningMapper.getPstorageByPstorageNo", pstorageNo);
	}
	//수정
	@Override
	public void updateProductionPlanning(ProductionPlanningDTO productionPlanningDTO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("kr.co.chill.productionPlanningMapper.updateProductionPlanning", productionPlanningDTO);
	}
	//삭제
	@Override
	public void deleteProductionPlanning(int prplNo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("kr.co.chill.productionPlanningMapper.deleteProductionPlanning", prplNo);
	}
	
}
