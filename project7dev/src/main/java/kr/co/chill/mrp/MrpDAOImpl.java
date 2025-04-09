package kr.co.chill.mrp;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MrpDAOImpl implements MrpDAO {
	
	@Inject
	private SqlSession sqlSession;
	//선택조회(상세보기)
	@Override
	public MrpDTO readMrpByMrpNo(int mrpNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("kr.co.chill.mrpMapper.readMrpByMrpNo", mrpNo);
	}
	//검색조회
	@Override
	public List<MrpDTO> searchMrp(Map<String, Object> searchMap) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("kr.co.chill.mrpMapper.searchMrp", searchMap);
	}
	//등록
	@Override
	public void createMrp(MrpDTO mrpDTO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("kr.co.chill.mrpMapper.createMrp", mrpDTO);
	}
	
}
