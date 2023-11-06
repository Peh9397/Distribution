package com.green.distribution.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.distribution.model.Buyer;
@Repository
public class BuyerDaoImpl implements BuyerDao {
	@Autowired
	private SqlSessionTemplate sst;
	
	@Override
	public List<Buyer> list() {
		return sst.selectList("buyerns.list");
	}

	@Override
	public int getTotal(Buyer buyer) {
		return sst.selectOne("buyerns.getTotal", buyer);
	}

	@Override
	public List<Buyer> search(Buyer buyer) {
		System.out.println("buyerCd="+buyer.getBuyerCd());
		System.out.println("manager="+buyer.getManager());
		System.out.println("tel="+buyer.getTel());
		System.out.println("del="+buyer.getDel());
		System.out.println("email="+buyer.getEmail());
		System.out.println("address="+buyer.getAddress());
		return sst.selectList("buyerns.search", buyer);
	}

	@Override
	public Buyer select(String bname) {
		return sst.selectOne("buyerns.select", bname);
	}

	@Override
	public int insert(Buyer buyer) {
		return sst.insert("buyerns.insert", buyer);
	}

	@Override
	public String selectCode(String autoCompleteCd) {
		return sst.selectOne("buyerns.selectCode",autoCompleteCd);
	}

	@Override
	public int delete(String buyerCd) {
		return sst.delete("buyerns.delete",buyerCd);
	}

	@Override
	public List<Buyer> ndlist() {
		return sst.selectList("buyerns.ndlist");
	}

	@Override
	public int update(Buyer buyer) {
		return sst.update("buyerns.update",buyer);
	}

	@Override
	public List<Buyer> dlist() {
		return sst.selectList("buyerns.dlist");
	}

	@Override
	public void buyerRestore(String buyerCd) {
		sst.update("buyerns.buyerRestore", buyerCd);
	}

	@Override
	public Buyer listForExcel(Buyer item) {
		return sst.selectOne("buyerns.listForExcel", item);
	}

}
