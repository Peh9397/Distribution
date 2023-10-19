package com.green.distribution;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.distribution.service.OrderApprovalService;
import com.green.distribution.service.OrderProductService;
import com.green.distribution.service.PricingService;
import com.green.distribution.service.ProductService;

@Controller
public class HomeController {
	
//	@Autowired
//	private OrderApprovalService oas;
//	
//	@Autowired
//	private OrderProductService ops;
//	
//	@Autowired
//	private PricingService ps;
//	
//	@Autowired
//	private ProductService pds;
	
	@RequestMapping("main")
	public String main() {
		return "main/main";
	}
	
	@GetMapping("nolay/emp")
	public void emp() {
		
	}
}
