package kr.co.chill.issuing;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IssuingServiceImpl implements IssuingService{
	@Autowired
	private IssuingDAO issuingDAO;

	@Override
	public List<IssuingDTO> productlist() {
		// TODO Auto-generated method stub
		return issuingDAO.productlist();
	}

	@Override
	public List<IssuingDTO> materialstock(int product_no, int product_cnt) {
		// TODO Auto-generated method stub
		return issuingDAO.materialstock(product_no, product_cnt);
	}

	@Override
	public IssuingDTO productOne(int product_no) {
		// TODO Auto-generated method stub
		return issuingDAO.productOne(product_no);
	}

	@Override
	public List<InoutStorageDTO> storageIO(List<IssuingDTO> materialstock) {
		// TODO Auto-generated method stub
		return issuingDAO.storageIO(materialstock);
	}

}
