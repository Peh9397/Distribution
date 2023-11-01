package com.green.distribution.service;

import java.util.List;

import com.green.distribution.model.Pricing;

public interface PricingService {

	int getTotal(Pricing pricing);

	List<Pricing> pricingList(Pricing pricing);

	List<Pricing> search(Pricing pricing);

	int pricingDelete(Pricing pricing);

	void pricingInsert(Pricing pricing);

	Pricing listForExcel(Pricing pricing);

}
