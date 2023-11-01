package com.green.distribution.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.distribution.dao.PricingDao;
import com.green.distribution.model.Pricing;

@Service
public class PricingServiceImpl implements PricingService{

	@Autowired 
	private PricingDao prd;

	@Override
	public int getTotal(Pricing pricing) {
		return prd.getTotal(pricing);
	}

	@Override
	public List<Pricing> pricingList(Pricing pricing) {
		return prd.pricingList(pricing);
	}

	@Override
	public List<Pricing> search(Pricing pricing) {
		return prd.search(pricing);
	}

	@Override
	public int pricingDelete(Pricing pricing) {
		return prd.pricingDelete(pricing);
	}

	@Override
	public void pricingInsert(Pricing pricing) {
		prd.pricingInsert(pricing);
	}

	@Override
	public Pricing listForExcel(Pricing pricing) {
		return prd.listForExcel(pricing);
	}

}
