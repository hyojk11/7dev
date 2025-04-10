 package kr.co.chill.purchaseorder;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProgressMonitoringServiceImpl implements ProgressMonitoringService {
	
	@Autowired
	private ProgressMonitoringDAO progressMonitoringDAO;

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

	@Override
	public ProgressMonitoringDTO detailOrderInfo(String purc_order_code) {
		// TODO Auto-generated method stub
		return progressMonitoringDAO.detailOrderInfo(purc_order_code);
	}

	@Override
	public List<ProgressMonitoringDTO> detailProgressList(String purc_order_code) {
		// TODO Auto-generated method stub
		return progressMonitoringDAO.detailProgressList(purc_order_code);
	}

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

	@Override
	public List<ProgressMonitoringDTO> detailSummaryList(String purc_order_code) {
		// TODO Auto-generated method stub
		return progressMonitoringDAO.detailSummaryList(purc_order_code);
	}

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

}
