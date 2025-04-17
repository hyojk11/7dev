package kr.co.chill.purchaseorder;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PurchaseorderServiceImpl implements PurchaseorderService {
	
	@Autowired
	private PurchaseorderDAO purchaseorderDAO;

	
//	페이징 리스트
	@Override
	public List<PurchaseorderDTO> listPaged(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return purchaseorderDAO.listPaged(map);
	}
	@Override
	public List<PurchaseorderDTO> listSearchPaged(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return purchaseorderDAO.listSearchPaged(map);
	}
	@Override
	public int listSearchCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return purchaseorderDAO.listSearchCount(map);
	}
	
	
	
//	페이징x 리스트(엑셀출력용)
	@Override
	public List<PurchaseorderDTO> list() {
		// TODO Auto-generated method stub
		return purchaseorderDAO.list();
	}
	@Override
	public List<PurchaseorderDTO> listSearch(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return purchaseorderDAO.listSearch(map);
	}

	
	
//	상세조회
	@Override
	public PurchaseorderDTO detailOrderInfo(String purc_order_code) {
		// TODO Auto-generated method stub
		return purchaseorderDAO.detailOrderInfo(purc_order_code);
	}
	@Override
	public List<PurchaseorderDTO> detailOrderList(String purc_order_code) {
		// TODO Auto-generated method stub
		return purchaseorderDAO.detailOrderList(purc_order_code);
	}



//	등록
	@Override
	public void register(PurchaseorderDTO dto) {
		// TODO Auto-generated method stub
		purchaseorderDAO.register(dto);
	}
	@Override
	public String codemaker() {
		String today = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
		int count = purchaseorderDAO.codemaker();
		String serial = String.format("%02d", count + 1);
		return "PO" + today + serial;
	}

	
}
