package com.green.distribution.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Employee {
	private String EMPCD;		// 직원코드
	private String ENAME;		// 직원명
	private String PASSWORD;	// 비밀번호
	private String DEPT;		// 부서
	private String JOB;			// 직책
	private String TEL;			// 연락처
	private String AUTHORITY;	// 승인권한
	private Date   ADDDATE;		// 등록일
	private String DEL;			// 삭제
	private String REMARK;		// 비고
	private Date   STATEDATE;	// 최종변경일
	
	// 등록일
	private Date ADDFROMDATE;   // 이 날짜부터 ~
    private Date ADDTODATE;	    // ~ 이 날짜까지
	
    // 직원 분류
    private int SORTEMPCD; 		// 직원 코드
	private int SORTENAME;		// 이름
	private int SORTJOB;		// 직책
	private int SORTDEPT;		// 부서
	private int SORTADDDATE;	// 등록일
	private int SORTAUTHORITY;	// 승인권한
    
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
