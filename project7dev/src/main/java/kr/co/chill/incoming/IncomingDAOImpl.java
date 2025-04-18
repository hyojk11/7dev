package kr.co.chill.incoming;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class IncomingDAOImpl implements IncomingDAO{

	@Autowired
	private SqlSession session;
	
	

	@Override
	public List<IncomingDTO> material_storage(IncomingDTO incomingDTO) {
		// TODO Auto-generated method stub
		return session.selectList("kr.co.chill.incomingMapper.selectAll", incomingDTO);
	}


	@Override
	public List<IncomingDTO> expected(IncomingDTO incomingDTO) {
		// TODO Auto-generated method stub
		return session.selectList("kr.co.chill.incomingMapper.selectExp", incomingDTO);
	}


	@Override
	public int checkMaterialStorage(IncomingDTO incomingDTO) {
		System.out.println("DAO로 넘어온 자재정보:" + incomingDTO);
		return session.selectOne("kr.co.chill.incomingMapper.checkMaterialInStorage", incomingDTO);
	}


	@Override
	public int insertMaterialStorage(IncomingDTO incomingDTO) {
		// TODO Auto-generated method stub
		return session.insert("kr.co.chill.incomingMapper.insertMaterialStorage", incomingDTO);
	}


	@Override
	public int updateMaterialStorage(IncomingDTO incomingDTO) {
		// TODO Auto-generated method stub
		return session.update("kr.co.chill.incomingMapper.updateMaterialStorage", incomingDTO);
	}


	@Override
	public int updateMaterialState(IncomingDTO incomingDTO) {
		// TODO Auto-generated method stub
		return session.update("kr.co.chill.incomingMapper.updateMaterialState", incomingDTO);
	}

	
	//material_handling 의 필요한 기능

	  @Override
	    public List<IncomingDTO> searchMaterials(Map<String, Object> params) {
	        return session.selectList("kr.co.chill.incomingMapper.searchMaterials", params);
	    }

	    @Override
	    public void updatePurchaseOrderStatus(List<Integer> purcOrderNos) {
	        session.update("kr.co.chill.incomingMapper.updatePurchaseOrderStatus", purcOrderNos);
	    }
	    
	 // 거래명세서
	@Override
	public List<Trans_paperDTO> tp_list() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("kr.co.chill.incomingMapper.tp_list");
	}

		
	// 거래명세서 상세보기
	@Override
	public Trans_paperDTO tp_detail(int trans_paper_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("kr.co.chill.incomingMapper.tp_detail", trans_paper_no );
	}


	// 현황관리
	@Override
	public List<StatusDTO> status_list(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return session.selectList("kr.co.chill.incomingMapper.status_list", paramMap);
	}
    
	
	

}
