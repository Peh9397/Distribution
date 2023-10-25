package com.green.distribution.model;

import java.sql.Date;

import lombok.Data;
import scala.Int;
@Data
public class Product {
	private String productCd; // --상품코드 
	private String  pName; //--상품명
	private int stock;  //-- 재고
	private String  unit; //--단위
	private String  category; //-- 분류
	private Date  addDate; //--등록일
	private String  del; // --삭제
	private Date statedate; //--최종변경일
	
	//  search용 등록일
	private Date addDate2;
  
	//정렬용
	private int sortProductCd;
	private int sortPname;
	private int sortStock;
	private int sortUnit;
	private int sortCategory;
	private int sortAdddate;
	private int sortStatedate;
	private int sortDel;
  
	private int rn; //순번
}
