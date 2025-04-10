package kr.co.chill.purchaseorder;

import java.util.List;
import java.util.Map;

public interface ProgressMonitoringDAO {
	
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
	
	//등록
	void register(ProgressMonitoringDTO dto);
	int codemaker(String progress_monitoring_date);
	
}
