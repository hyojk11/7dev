package kr.co.chill.purchaseorder;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PurchaseorderController {
	
	@Autowired
	private PurchaseorderService purchaseorderService;
	
	@GetMapping(value="purc_order/list")
	public ModelAndView list() {
		List<PurchaseorderDTO> list = purchaseorderService.list();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("purc_order/list");
		
		return mav;
	}

}
