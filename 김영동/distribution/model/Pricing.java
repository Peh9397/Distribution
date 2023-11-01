package com.green.distribution.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Pricing {
	private String buyerCd;
	private String productCd;
	private Date startDate;
	private Date endDate;
	private int price;
	private int discount;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
	private Date addDate;
	private String del;
	private Date stateDate;
	
	
	// join용
	private String bname;
	private String pname;
	
	// 최종 판매가
	private double finalPrice;
	
	// 검색용
    private int startPrice;
    private int endPrice;
    
	// 정렬용
	private int sortBuyerCd;
    private int sortBname;
	private int sortProductCd;
	private int sortPname;
	private int sortPrice;
	private int sortStartDate;
    private int sortEndDate;
    private int sortDiscount;
    private int sortFinalPrice;
    private int sortAddDate;
    private int sortStateDate;
    
    //페이징용
    private int currentPage;
   	private int rowPerPage;
   	private int total;
   	private int totalPage;
   	private int pagePerBlock = 10;
   	private int startPage;
   	private int endPage;
   	private int startRow;
   	private int endRow;
   	private String pageNum;
   	private int rn;
   	
   	public void pagingBean(int currentPage, int rowPerPage, int total) {
   		
   		this.currentPage = currentPage;
   		this.rowPerPage = rowPerPage; 
   		this.total = total;
   		
   		totalPage = (int)(Math.ceil((double)total/rowPerPage));
   		
   		startPage = currentPage - (currentPage - 1) % pagePerBlock;		
   		endPage = startPage + pagePerBlock - 1;
   		
   		if (endPage > totalPage) {
   			endPage = totalPage;
   		}
   	}
}
