package kr.co.chill.mrp;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class MrpServiceImpl implements MrpService {
	
	@Inject
	MrpDAO mrpDAO;
	//선택조회(상세보기)
	@Override
	public MrpDTO readMrpByMrpNo(int mrpNo) throws Exception {
		// TODO Auto-generated method stub
		return mrpDAO.readMrpByMrpNo(mrpNo);
	}
	//검색조회
	@Override
	public List<MrpDTO> searchMrp(Map<String, Object> searchMap) throws Exception {
		// TODO Auto-generated method stub
		return mrpDAO.searchMrp(searchMap);
	}
	//등록
	@Override
	public void createMrp(MrpDTO mrpDTO) throws Exception {
		// TODO Auto-generated method stub
		mrpDAO.createMrp(mrpDTO);
	}
	
	
}
