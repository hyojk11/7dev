package kr.co.chill.procurement;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ProcurementDAOImpl implements ProcurementDAO {
	
	@Inject
	private SqlSession sqlSession;
	//전체조회
	@Override
	public List<ProcurementDTO> readMpp() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("kr.co.chill.mrpMapper.readMap");
	}
	//선택조회
	@Override
	public ProcurementDTO readMppByMppNo(int mppNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("kr.co.chill.mrpMapper.readMppByMppNo", mppNo);
	}
	//등록
	@Override
	public void createMpp(ProcurementDTO procurementDTO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("kr.co.chill.mrpMapper.createMpp", procurementDTO);
	}
	//수정
	@Override
	public void updateMpp(ProcurementDTO procurementDTO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("kr.co.chill.mrpMapper.updateMpp", procurementDTO);
	}
	
}
