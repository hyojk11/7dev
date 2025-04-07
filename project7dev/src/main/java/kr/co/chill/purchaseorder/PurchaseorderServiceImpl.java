package kr.co.chill.purchaseorder;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PurchaseorderServiceImpl implements PurchaseorderService {
	
	@Autowired
	private PurchaseorderDAO purchaseorderDAO;

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

}
