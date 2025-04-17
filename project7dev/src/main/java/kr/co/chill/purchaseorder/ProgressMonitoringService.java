package kr.co.chill.purchaseorder;

import java.util.List;
import java.util.Map;

public interface ProgressMonitoringService {
	
	//전체조회(페이징X)
	List<ProgressMonitoringDTO> list();
	List<ProgressMonitoringDTO> listSearch(Map<String, Object> map);
	
	//전체조회(페이징)
	List<ProgressMonitoringDTO> listPaged(Map<String, Object> map);
	List<ProgressMonitoringDTO> listSearchPaged(Map<String, Object> map);
	int listSearchCount(Map<String, Object> map);

	//상세조회
	ProgressMonitoringDTO detailOrderInfo(String purc_order_code);
	List<ProgressMonitoringDTO> detailSummaryList(String purc_order_code);
	List<ProgressMonitoringDTO> detailProgressList(String purc_order_code);
	List<ProgressMonitoringDTO> detailProgressListByVer(Map<String, Object> map);
	
	//발주서 저장시 자동등록
	void preRegister(ProgressMonitoringDTO dto);
	
	//등록
	void register(ProgressMonitoringDTO dto);
	String codemaker(String progress_monitoring_date);
	
	//삭제
	void delete(int progress_monitoring_no);
	
}
