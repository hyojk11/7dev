package kr.co.chill.purchaseorder;

import java.util.List;
import java.util.Map;

public interface PurchaseorderDAO {
	
	//페이징 리스트
	List<PurchaseorderDTO> listPaged(Map<String, Object> map);
	List<PurchaseorderDTO> listSearchPaged(Map<String, Object> map);
	int listSearchCount(Map<String, Object> map);
	
	//페이징x 리스트(엑셀출력용)
	List<PurchaseorderDTO> list();
	List<PurchaseorderDTO> listSearch(Map<String, Object> map);
	
	//상세조회
	PurchaseorderDTO detailOrderInfo(String purc_order_code);
	List<PurchaseorderDTO> detailOrderList(String purc_order_code);
	
	//등록
	void register(PurchaseorderDTO dto);
	int codemaker();
	
}
