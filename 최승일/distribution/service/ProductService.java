package com.green.distribution.service;

import java.util.List;

import com.green.distribution.model.PagingBean;
import com.green.distribution.model.Product;

public interface ProductService {

	int getTotal(PagingBean pagingBean, Product product);

	List<Product> productList(PagingBean pagingBean, Product product);

	List<Product> list();
	
	List<Product> allList();

	int checkRowDelete(String productCd);

	Product insertselect(Product product);

	int insert(Product product);

	String selectCode(String category);

	Product updateselect(Product product);
	
	List<Product> activeList();

	int update(Product product);

	Product listForExcel(Product item);

}
