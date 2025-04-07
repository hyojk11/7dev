package kr.co.chill.purchaseorder;

import java.util.List;
import java.util.Map;

public interface PurchaseorderDAO {
	
	List<PurchaseorderDTO> list();
	List<PurchaseorderDTO> listSearch(Map<String, Object> map);
	PurchaseorderDTO detailOrderInfo(String purc_order_code);
	List<PurchaseorderDTO> detailOrderList(String purc_order_code);
	
}
