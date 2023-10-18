package com.green.distribution.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Employee {
	private String empCd;		// 직원코드
	private String eName;		// 직원명
	private String password;	// 비밀번호
	private String dept;		// 부서
	private String job;			// 직책
	private String tel;			// 연락처
	private String authority;	// 승인권한
	private Date   addDate;		// 등록일
	private String del;			// 삭제
	private String remark;		// 비고
	private Date   stateDate;	// 최종변경일
	
	// 등록일
	private Date addFromDate;   // 이 날짜부터 ~
    private Date addToDate;	    // ~ 이 날짜까지
	
    // 직원 분류
    private int sortEmpCd; 		// 직원 코드
	private int sortName;		// 이름
	private int sortJob;		// 직책
	private int sortDept;		// 부서
	private int sortAddDate;	// 등록일
	private int sortAuthority;	// 승인권한
    
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
