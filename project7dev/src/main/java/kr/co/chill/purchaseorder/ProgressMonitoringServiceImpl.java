 package kr.co.chill.purchaseorder;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProgressMonitoringServiceImpl implements ProgressMonitoringService {
	
	@Autowired
	private ProgressMonitoringDAO progressMonitoringDAO;

	
//	전체조회(페이징X)
	@Override
	public List<ProgressMonitoringDTO> list() {
		// TODO Auto-generated method stub
		return progressMonitoringDAO.list();
	}
	@Override
	public List<ProgressMonitoringDTO> listSearch(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return progressMonitoringDAO.listSearch(map);
	}

	
	
//	전체조회(페이징)
	@Override
	public List<ProgressMonitoringDTO> listPaged(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return progressMonitoringDAO.listPaged(map);
	}
	@Override
	public List<ProgressMonitoringDTO> listSearchPaged(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return progressMonitoringDAO.listSearchPaged(map);
	}
	@Override
	public int listSearchCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return progressMonitoringDAO.listSearchCount(map);
	}
	
	
	
//	상세조회
	@Override
	public ProgressMonitoringDTO detailOrderInfo(String purc_order_code) {
		// TODO Auto-generated method stub
		return progressMonitoringDAO.detailOrderInfo(purc_order_code);
	}
	@Override
	public List<ProgressMonitoringDTO> detailSummaryList(String purc_order_code) {
		// TODO Auto-generated method stub
		return progressMonitoringDAO.detailSummaryList(purc_order_code);
	}
	@Override
	public List<ProgressMonitoringDTO> detailProgressList(String purc_order_code) {
		// TODO Auto-generated method stub
		return progressMonitoringDAO.detailProgressList(purc_order_code);
	}
	@Override
	public List<ProgressMonitoringDTO> detailProgressListByVer(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return progressMonitoringDAO.detailProgressListByVer(map);
	}
	
	
	
//	발주서 저장시 자동등록
	@Override
	public void preRegister(ProgressMonitoringDTO dto) {
		// TODO Auto-generated method stub
		progressMonitoringDAO.preRegister(dto);
	}



//	등록
	@Override
	public void register(ProgressMonitoringDTO dto) {
		// TODO Auto-generated method stub
		progressMonitoringDAO.register(dto);
	}
	@Override
	public String codemaker(String progress_monitoring_date) {
		String datePart = progress_monitoring_date.replace("-","");
		int count = progressMonitoringDAO.codemaker(progress_monitoring_date);
		String serial = String.format("%02d", count + 1);
		return "PM" + datePart + serial;
	}



//	삭제
	@Override
	public void delete(int progress_monitoring_no) {
		// TODO Auto-generated method stub
		progressMonitoringDAO.delete(progress_monitoring_no);
	}



}
