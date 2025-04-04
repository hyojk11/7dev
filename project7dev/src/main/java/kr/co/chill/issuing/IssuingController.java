package kr.co.chill.issuing;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class IssuingController {
	private static final Logger logger = LoggerFactory.getLogger(IssuingController.class);
	
	@Autowired IssuingService issuingService;
	
	@GetMapping(value = "issuing/produce")
	public String produce() {
		logger.info("prodece view 이동");
		
		return "produce";
	}
	
	@RequestMapping(value = "issuing/produce")
	public String produceProcess(@RequestParam Map<String, Object> produce) {
		logger.info("제품 생산 보내기");
		
		IssuingDTO issuingDTO = new IssuingDTO();
		
		return "redirect:/issuing/produce";
	}

}
