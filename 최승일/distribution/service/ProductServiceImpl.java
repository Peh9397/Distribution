package com.green.distribution.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.distribution.dao.ProductDao;
import com.green.distribution.model.PagingBean;
import com.green.distribution.model.Product;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDao pd;

	@Override
	public int getTotal(PagingBean pagingBean, Product product) {
		return pd.getTotal(pagingBean,product);
	}

	@Override
	public List<Product> productList(PagingBean pagingBean, Product product) {
		return pd.productList(pagingBean, product);
	}

	@Override
	public List<Product> allList() {
		
		return pd.allList();
	}

	@Override
	public int checkRowDelete(String productCd) {
		return pd.checkRowDelete(productCd);
	}

	@Override
	public Product insertselect(Product product) {
		return pd.insertselect(product);
	}

	@Override
	public int insert(Product product) {
		return pd.insert(product);
	}

	@Override
	public String selectCode(String category) {
		return pd.selectCode(category);
	}

	@Override
	public Product updateselect(Product product) {
		return pd.updateselect(product);
	}

	@Override
	public int update(Product product) {
		return pd.update(product);
	}

	@Override
	public Product listForExcel(Product item) {
		return pd.listForExcel(item);
	}
}
