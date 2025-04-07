package kr.co.chill.purchaseorder;

import java.util.List;

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

}
