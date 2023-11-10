package com.green.distribution.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.distribution.model.Pricing;

@Repository
public class PricingDaoImpl implements PricingDao{

	@Autowired 
	private SqlSessionTemplate sst;

	@Override
	public int getTotal(Pricing pricing) {
		return sst.selectOne("pricingns.getTotal", pricing);
	}

	@Override
	public List<Pricing> pricingList(Pricing pricing) {
		return sst.selectList("pricingns.pricingList", pricing);
	}

	@Override
	public List<Pricing> search(Pricing pricing) {
		return sst.selectList("pricingns.search", pricing);
	}

	@Override
	public int pricingDelete(Pricing pricing) {
		return sst.update("pricingns.pricingDelete", pricing);
	}

	@Override
	public void pricingInsert(Pricing pricing) {
		sst.insert("pricingns.pricingInsert", pricing);
	}

	@Override
	public Pricing listForExcel(Pricing pricing) {
		return sst.selectOne("pricingns.listForExcel", pricing);
	}

	@Override
	public int overlapCheck(Pricing pricing) {
		return sst.selectOne("pricingns.overlapCheck", pricing);
	}

	@Override
	public int pricingUpdate(Pricing pricing) {
		return sst.update("pricingns.pricingUpdate",pricing);
	}

	@Override
	public Pricing pricingDetail(String startDate) {
		return sst.selectOne("pricingns.pricingDetail", startDate);
	}

	@Override
	public int pricingRestore(Pricing pricing) {
		return sst.update("pricingns.restore", pricing);
	}

}
