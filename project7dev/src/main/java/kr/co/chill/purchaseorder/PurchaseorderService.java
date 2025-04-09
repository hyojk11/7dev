package kr.co.chill.purchaseorder;

import java.util.List;
import java.util.Map;

public interface PurchaseorderService {
	
	List<PurchaseorderDTO> list();
	List<PurchaseorderDTO> listPaged(Map<String, Object> map);
	
	List<PurchaseorderDTO> listSearch(Map<String, Object> map);
	List<PurchaseorderDTO> listSearchPaged(Map<String, Object> map);
	
	int listSearchCount(Map<String, Object> map);

	PurchaseorderDTO detailOrderInfo(String purc_order_code);
	List<PurchaseorderDTO> detailOrderList(String purc_order_code);

}
