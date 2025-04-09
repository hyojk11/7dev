package kr.co.chill.purchaseorder;

import java.util.List;
import java.util.Map;

public interface ProgressMonitoringService {
	
	List<ProgressMonitoringDTO> list();
	List<ProgressMonitoringDTO> listPaged(Map<String, Object> map);
	
	List<ProgressMonitoringDTO> listSearch(Map<String, Object> map);
	List<ProgressMonitoringDTO> listSearchPaged(Map<String, Object> map);
	
	int listSearchCount(Map<String, Object> map);

	ProgressMonitoringDTO detailOrderInfo(String purc_order_code);
	List<ProgressMonitoringDTO> detailProgressList(String purc_order_code);

}
