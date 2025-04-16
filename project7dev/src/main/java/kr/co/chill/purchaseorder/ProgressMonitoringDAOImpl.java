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

	@Override
	public List<ProgressMonitoringDTO> detailSummaryList(String purc_order_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("kr.co.chill.progressMonitoringMapper.detailSummaryList", purc_order_code);
	}

	@Override
	public void register(ProgressMonitoringDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.insert("kr.co.chill.progressMonitoringMapper.register", dto);
	}

	@Override
	public int codemaker(String progress_monitoring_date) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("kr.co.chill.progressMonitoringMapper.codemaker", progress_monitoring_date);
	}

	@Override
	public List<ProgressMonitoringDTO> detailProgressListByVer(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("kr.co.chill.progressMonitoringMapper.detailProgressListByVer", map);
	}

	@Override
	public String searchPoNo(int progress_monitoring_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("kr.co.chill.progressMonitoringMapper.searchPoNo", progress_monitoring_no);
	}

	@Override
	public void delete(int progress_monitoring_no) {
		// TODO Auto-generated method stub
		sqlSession.delete("kr.co.chill.progressMonitoringMapper.delete", progress_monitoring_no);
	}
	
	
}
