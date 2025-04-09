package kr.co.chill.incoming;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IncomingServiceImpl implements IncomingService{
	
	@Autowired
	private IncomingDAO incomingDAO;

	@Override
	public List<IncomingDTO> material_storage(IncomingDTO incomingDTO) {
		// TODO Auto-generated method stub
		return incomingDAO.material_storage(incomingDTO);
	}
	
	@Override
	public List<IncomingDTO> expected(IncomingDTO incomingDTO) {
		// TODO Auto-generated method stub
		return incomingDAO.expected(incomingDTO);
	}
	
	@Override
	public int MaterialIn(List<Integer> materialNOList) {
		int result = 0;
		
		for(Integer materialNO : materialNOList) {
			IncomingDTO incomingDTO = new IncomingDTO();
			incomingDTO.setMaterial_material_no(materialNO);
			incomingDTO.setState(1);
			result += incomingDAO.MaterialIn(incomingDTO);
			
		}
		return result;
	}

	@Override
	public int outMaterial(IncomingDTO incomingDTO) {
		// TODO Auto-generated method stub
		return incomingDAO.outMaterial(incomingDTO);
	}

	


	

	
}
