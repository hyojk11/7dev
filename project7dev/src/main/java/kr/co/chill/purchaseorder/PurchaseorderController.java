package kr.co.chill.purchaseorder;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PurchaseorderController {
	
	@Autowired
	private PurchaseorderService purchaseorderService;
	
	//구매발주 리스트 페이지 이동
	@GetMapping(value="purc_order/list")
	public ModelAndView list() {
		List<PurchaseorderDTO> list = purchaseorderService.list();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("purc_order/list");
		
		return mav;
	}
	
	//구매발주 리스트 검색처리
	@GetMapping(value="purc_order/list_search")
	public ModelAndView list_search(@RequestParam String searchType
			, @RequestParam String keyword) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		
		List<PurchaseorderDTO> list = purchaseorderService.listSearch(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("purc_order/list");
		return mav;
	}
	
	
	//구매발주서 상세보기 페이지 이동
	@GetMapping(value="purc_order/detail")
	public ModelAndView detail(@RequestParam("purc_order_code")String purc_order_code) {
		
		PurchaseorderDTO dto = purchaseorderService.detailOrderInfo(purc_order_code);
		List<PurchaseorderDTO> list = purchaseorderService.detailOrderList(purc_order_code);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto);
		mav.addObject("list", list);
		mav.setViewName("purc_order/detail");
		
		return mav;
	}

}
