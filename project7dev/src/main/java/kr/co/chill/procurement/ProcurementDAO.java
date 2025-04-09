package kr.co.chill.procurement;

import java.util.List;

public interface ProcurementDAO {
	//전체조회
	List<ProcurementDTO> readMpp() throws Exception;
	//선택조회
	ProcurementDTO readMppByMppNo(int mppNo) throws Exception;
	//등록
	void createMpp(ProcurementDTO procurementDTO) throws Exception;
	//수정
	void updateMpp(ProcurementDTO procurementDTO) throws Exception;

}
