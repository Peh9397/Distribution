package com.green.distribution.dao;

import java.util.List;

import com.green.distribution.model.Pricing;

public interface PricingDao {

	int getTotal(Pricing pricing);

	List<Pricing> pricingList(Pricing pricing);

	List<Pricing> search(Pricing pricing);

	int pricingDelete(Pricing pricing);

	void pricingInsert(Pricing pricing);

	Pricing listForExcel(Pricing pricing);

	int overlapCheck(Pricing pricing);

	int pricingUpdate(Pricing pricing);

	Pricing pricingDetail(String startDate);

	int pricingRestore(Pricing pricing);

}
