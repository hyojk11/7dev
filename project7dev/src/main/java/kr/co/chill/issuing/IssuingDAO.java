package kr.co.chill.issuing;

import java.util.List;

public interface IssuingDAO {

	List<IssuingDTO> productlist();

	List<IssuingDTO> materialstock(int product_no);

}
