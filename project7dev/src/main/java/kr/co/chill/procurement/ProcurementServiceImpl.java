package kr.co.chill.procurement;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ProcurementServiceImpl implements ProcurementService {
	
	@Inject
	ProcurementDAO procurementDAO;
	//전체조회
	@Override
	public List<ProcurementDTO> readMpp() throws Exception {
		// TODO Auto-generated method stub
		return procurementDAO.readMpp();
	}
	//선택조회
	@Override
	public ProcurementDTO readMppByMppNo(int mppNo) throws Exception {
		// TODO Auto-generated method stub
		return procurementDAO.readMppByMppNo(mppNo);
	}
	//등록
	@Override
	public void createMpp(ProcurementDTO procurementDTO) throws Exception {
		// TODO Auto-generated method stub
		procurementDAO.createMpp(procurementDTO);
	}
	//수정
	@Override
	public void updateMpp(ProcurementDTO procurementDTO) throws Exception {
		// TODO Auto-generated method stub
		procurementDAO.updateMpp(procurementDTO);
	}
	
}
