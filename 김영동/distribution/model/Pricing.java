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
	private String bName;
	private String pName;
	
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
    private int sortStatusDate;
}
