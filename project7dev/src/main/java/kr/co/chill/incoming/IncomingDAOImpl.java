package kr.co.chill.incoming;

import java.util.List;

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
	public int inMaterial(IncomingDTO incomingDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int outMaterial(IncomingDTO incomingDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
}
