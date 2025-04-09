package kr.co.chill.mrp;

import java.util.List;
import java.util.Map;

public interface MrpDAO {
	//선택조회(상세보기)
	MrpDTO readMrpByMrpNo(int mrpNo) throws Exception;
	//검색조회
	List<MrpDTO> searchMrp(Map<String, Object> searchMap) throws Exception;
	//등록
	void createMrp(MrpDTO mrpDTO) throws Exception;

}
