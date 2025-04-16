package kr.co.chill.purchaseorder;

import java.util.List;
import java.util.Map;

public interface ProgressMonitoringService {
	
	//전체조회(페이징X)
	List<ProgressMonitoringDTO> list();
	List<ProgressMonitoringDTO> listPaged(Map<String, Object> map);
	
	//전체조회(페이징)
	List<ProgressMonitoringDTO> listSearch(Map<String, Object> map);
	List<ProgressMonitoringDTO> listSearchPaged(Map<String, Object> map);
	int listSearchCount(Map<String, Object> map);

	//상세조회
	ProgressMonitoringDTO detailOrderInfo(String purc_order_code);
	List<ProgressMonitoringDTO> detailSummaryList(String purc_order_code);
	List<ProgressMonitoringDTO> detailProgressList(String purc_order_code);
	List<ProgressMonitoringDTO> detailProgressListByVer(Map<String, Object> map);
	
	//등록
	void register(ProgressMonitoringDTO dto);
	String codemaker(String progress_monitoring_date);
	
	//삭제 후 상세페이지 재이동 위한 발주코드조회
	String searchPoNo(int progress_monitoring_no);
	//삭제
	void delete(int progress_monitoring_no);
	
}
