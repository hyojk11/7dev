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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class IssuingController {
	private static final Logger logger = LoggerFactory.getLogger(IssuingController.class);
	
	@Autowired IssuingService issuingService;
	
	@GetMapping(value = "issuing/testview_issuing")
	public String testview_issuing() {
		logger.info("issuing testview 이동");
		
		return "issuing/testview_issuing";
	}
	
	@GetMapping(value = "issuing/produce")
	public String produce(HttpSession session) {
		logger.info("prodece view 이동");
		
		// 제품 선택지 생성을 위한 제품 목록 불러오기 
		List<IssuingDTO> productlist = issuingService.productlist();
		
		session.setAttribute("productlist",productlist);
		
		return "issuing/produce";
	}
	
	@RequestMapping(value = "issuing/produce", method = RequestMethod.POST)
	public String produce_check(@RequestParam Map<String, Object> produce
			, Model model) {
		logger.info("창고 확인하기");
		
		int product_no = Integer.parseInt((String) produce.get("product_no"));
		int product_cnt = Integer.parseInt((String) produce.get("product_cnt"));
		
		// 선택한 제품의 제품 정보 불러오기
		IssuingDTO productOne = issuingService.productOne(product_no);
		// 선택한 제품에 사용되는 부품 종류, 부품창고 위치, 생산시 필요한 수량 불러오기
		List<IssuingDTO> materialstock = issuingService.materialstock(product_no, product_cnt);
		
		model.addAttribute("materialstock", materialstock);
		model.addAttribute("selected", productOne);
		model.addAttribute("product_cnt", product_cnt);
		
		return "issuing/produce_check";
	}
	
	@RequestMapping(value = "issuing/produce_process")
	public String produce_process(@RequestParam Map<String, Object> produce
			, RedirectAttributes redirrect) {
		logger.info("생산라인으로 부품 출고하기");
		
		int product_no = Integer.parseInt((String) produce.get("product_no"));
		int product_cnt = Integer.parseInt((String) produce.get("product_cnt"));
		
		// 제품 정보 불러온 후, 필요한 부품 정보 목록 불러오기
		IssuingDTO productOne = issuingService.productOne(product_no);
		List<IssuingDTO> materialstock = issuingService.materialstock(product_no, product_cnt);
		
		// 부품창고 출고 - 라인 입고 처리 후 목록 불러오기
		List<InoutStorageDTO> storageIO = issuingService.storageIO(materialstock);		
		
		// 주소가 바뀌는 redirect 사용했으니, model 대신 RedirectAttributes 사용
		redirrect.addFlashAttribute("storageIO", storageIO);
		redirrect.addFlashAttribute("selected", productOne);
		redirrect.addFlashAttribute("product_cnt", product_cnt);
		
		return "redirect:/issuing/produce_result";
	}
	
	@GetMapping(value = "issuing/produce_result")
	public String produce_result() {
		logger.info("produce_result view 이동");
		
		return "issuing/produce_result";
	}
	
	@GetMapping(value = "issuing/lineout")
	public String lineout(HttpSession session) {
		logger.info("lineout view 이동");
		
		// 제품 선택지 생성을 위한 제품 목록 불러오기 
		List<IssuingDTO> productlist = issuingService.productlist();
		
		session.setAttribute("productlist",productlist);
		
		return "issuing/lineout";
	}
	
	@RequestMapping(value = "issuing/lineout", method = RequestMethod.POST)
	public String lineout_check(@RequestParam Map<String, Object> lineout
			, Model model) {
		logger.info("라인 확인하기");
		
		int product_no = Integer.parseInt((String) lineout.get("product_no"));
		int product_cnt = Integer.parseInt((String) lineout.get("product_cnt"));
		
		// 선택한 제품의 제품 정보 불러오기
		IssuingDTO productOne = issuingService.productOne(product_no);
		// 선택한 제품에 사용되는 부품 종류, 부품라인 위치, 생산시 필요한 수량 불러오기
		List<IssuingDTO> linestock = issuingService.linestock(product_no, product_cnt);
		
		model.addAttribute("linestock", linestock);
		model.addAttribute("selected", productOne);
		model.addAttribute("product_cnt", product_cnt);
		
		return "issuing/lineout_check";
	}
	
	@RequestMapping(value = "issuing/lineout_process")
	public String lineout_process(@RequestParam Map<String, Object> lineout
			, RedirectAttributes redirrect) {
		logger.info("생산라인으로 부품 출고하기");
		
		int product_no = Integer.parseInt((String) lineout.get("product_no"));
		int product_cnt = Integer.parseInt((String) lineout.get("product_cnt"));
		
		// 제품 정보 불러온 후, 필요한 부품 정보 목록 불러오기
		IssuingDTO productOne = issuingService.productOne(product_no);
		List<IssuingDTO> linestock = issuingService.linestock(product_no, product_cnt);
		
		// 생산라인 출고 - 라인 출고 처리 후 목록 불러오기
		int[] product_info = {product_no, product_cnt};
		List<InoutLineDTO> lineIO = issuingService.lineIO(linestock, product_info);		
		
		// 주소가 바뀌는 redirect 사용했으니, model 대신 RedirectAttributes 사용
		redirrect.addFlashAttribute("lineIO", lineIO);
		redirrect.addFlashAttribute("selected", productOne);
		redirrect.addFlashAttribute("product_cnt", product_cnt);
		
		return "redirect:/issuing/lineout_result";
	}
	
	@GetMapping(value = "issuing/lineout_result")
	public String lineout_result() {
		logger.info("lineout_result view 이동");
		
		return "issuing/lineout_result";
	}


}
