package com.green.distribution.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.distribution.service.BuyerService;
import com.green.distribution.service.PricingService;
import com.green.distribution.service.ProductService;

@Controller
public class PricingController {
//	/*
//	 * @Autowired private PricingService pv;
//	 * 
//	 * @Autowired private BuyerService bs;
//	 * 
//	 * @Autowired private ProductService ps;
//	 */
	@RequestMapping("nolay/pricingList")
	public void pricingList() {}
}
