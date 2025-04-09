package kr.co.chill.material;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class MaterialServiceImpl implements MaterialService {
	
	@Inject
	MaterialDAO materialDAO;
	//전체조회
	@Override
	public List<MaterialDTO> readMaterial() throws Exception {
		// TODO Auto-generated method stub
		return materialDAO.readMaterial();
	}
	//검색조회
	@Override
	public List<MaterialDTO> searchMaterial(Map<String, Object> searchMap) throws Exception {
		// TODO Auto-generated method stub
		return materialDAO.searchMaterial(searchMap);
	}
	//부품코드로 부품조회
	@Override
	public List<MaterialDTO> getMaterialByMaterialCode(Map<String, Object> searchMap) throws Exception {
		// TODO Auto-generated method stub
		return materialDAO.getMaterialByMaterialCode(searchMap);
	}
	//등록
	@Override
	public void createMaterial(MaterialDTO materialDTO) throws Exception {
		// TODO Auto-generated method stub
		materialDAO.createMaterial(materialDTO);
	}
	//수정: 사용되는 제품(BOM작성 시)
	@Override
	public void updateMaterialProductRef(Map<String, Object> updateMap) throws Exception {
		// TODO Auto-generated method stub
		materialDAO.updateMaterialProductRef(updateMap);
	}
	//수정: 계약서 작성 시 
	@Override
	public void updateMaterialContract(MaterialDTO materialDTO) throws Exception {
		// TODO Auto-generated method stub
		materialDAO.updateMaterialContract(materialDTO);
	}
	//전체수정
	@Override
	public void updateMaterial(MaterialDTO materialDTO) throws Exception {
		// TODO Auto-generated method stub
		materialDAO.updateMaterial(materialDTO);
	}
	//삭제
	@Override
	public void deleteMaterial(int materialNo) throws Exception {
		// TODO Auto-generated method stub
		materialDAO.deleteMaterial(materialNo);
	}
	
}
