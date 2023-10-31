package com.green.distribution.dao;

import java.util.List;

import com.green.distribution.model.PagingBean;
import com.green.distribution.model.Product;

public interface ProductDao {

	int getTotal(PagingBean pagingBean, Product product);

	List<Product> productList(PagingBean pagingBean, Product product);

	List<Product> allList();

	int checkRowDelete(String productCd);

	Product insertselect(Product product);

	int insert(Product product);

	String selectCode(String category);

	Product updateselect(Product product);

	int update(Product product);

	Product listForExcel(Product item);

	List<Product> list();

	List<Product> activeList();

}
