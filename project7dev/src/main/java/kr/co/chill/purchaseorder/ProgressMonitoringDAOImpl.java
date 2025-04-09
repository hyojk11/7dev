package kr.co.chill.purchaseorder;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProgressMonitoringDAOImpl implements ProgressMonitoringDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ProgressMonitoringDTO> list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("kr.co.chill.progressMonitoringMapper.list");
	}

	@Override
	public List<ProgressMonitoringDTO> listSearch(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("kr.co.chill.progressMonitoringMapper.listSearch", map);
	}

	@Override
	public ProgressMonitoringDTO detailOrderInfo(String purc_order_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("kr.co.chill.progressMonitoringMapper.detailOrderInfo", purc_order_code);
	}

	@Override
	public List<ProgressMonitoringDTO> detailProgressList(String purc_order_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("kr.co.chill.progressMonitoringMapper.detailProgressList", purc_order_code);
	}

	@Override
	public List<ProgressMonitoringDTO> listPaged(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("kr.co.chill.progressMonitoringMapper.listPaged", map);
	}

	@Override
	public List<ProgressMonitoringDTO> listSearchPaged(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("kr.co.chill.progressMonitoringMapper.listSearchPaged", map);
	}

	@Override
	public int listSearchCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("kr.co.chill.progressMonitoringMapper.listSearchCount", map);
	}
	
	
}
