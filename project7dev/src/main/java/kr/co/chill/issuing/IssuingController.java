package kr.co.chill.issuing;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class IssuingController {
	private static final Logger logger = LoggerFactory.getLogger(IssuingController.class);
	
	@Autowired IssuingService issuingService;
	
	@GetMapping(value = "issuing/testview_issuing")
	public String testview_issuing() {
		logger.info("issuing testview 이동");
		
		return "testview_issuing";
	}
	
	@GetMapping(value = "issuing/produce")
	public String produce(HttpSession session) {
		logger.info("prodece view 이동");
		
		List<IssuingDTO> productlist = issuingService.productlist();
		
		session.setAttribute("productlist",productlist);
		
		return "produce";
	}
	
	@RequestMapping(value = "issuing/produce", method = RequestMethod.POST)
	public String produceProcess(@RequestParam Map<String, Object> produce
			, Model model) {
		logger.info("창고 확인하기");
		
		int product_no = Integer.parseInt((String) produce.get("product_no"));
		int product_cnt = Integer.parseInt((String) produce.get("product_cnt"));
		
		List<IssuingDTO> materialstock = issuingService.materialstock(product_no);
		
		model.addAttribute("materialstock", materialstock);
		model.addAttribute("product_cnt", product_cnt);
		
		return "produce_check";
	}
	
//	@GetMapping(value = "issuing/produce_check")
//	public String produce_check() {
//		logger.info("produce_check view 이동");
//		
//		return "produce_check";
//	}

}
