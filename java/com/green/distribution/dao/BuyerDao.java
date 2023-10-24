package com.green.distribution.dao;

import java.util.List;

import com.green.distribution.model.Buyer;

public interface BuyerDao {

	List<Buyer> list();

	int getTotal(Buyer buyer);

	List<Buyer> search(Buyer buyer);

	Buyer select(String bname);

	int insert(Buyer buyer);

	String selectCode(String autoCompleteCd);

	int delete(String buyerCd);

	List<Buyer> ndlist();

	int update(Buyer buyer);

	List<Buyer> dlist();

	void buyerRestore(String buyerCd);

	Buyer listForExcel(Buyer item);

}
