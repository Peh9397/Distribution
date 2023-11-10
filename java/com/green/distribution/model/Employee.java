package com.green.distribution.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Employee {
	private String employeeCd; // 직원코드
	private String ename; // 직원명
	private String password; // 비밀번호
	private String department; // 부서
	private String job; // 직책
	private String tel; // 연락처
	private String authority; // 승인권한
	private Date adddate; // 등록일
	private String del; // 삭제
	private String remark; // 비고
	private Date statedate; // 최종변경일

	// 등록일
	private Date addFromDate; // 이 날짜부터 ~
	private Date addToDate; // ~ 이 날짜까지

	// 직원 분류
	private int sortEmployeeCd; // 직원 코드
	private int sortEname; // 이름
	private int sortJob;   // 직책
	private int sortTel;   // 전화번호
	private int sortDepartment;  // 부서
	private int sortAdddate; // 등록일
	private int sortAuthority; // 승인권한

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
	
	private String search;
	private String keyword;
	
	public void pagingBean(int currentPage, int rowPerPage, int total) {

		this.currentPage = currentPage;
		this.rowPerPage = rowPerPage;
		this.total = total;

		totalPage = (int) (Math.ceil((double) total / rowPerPage));

		startPage = currentPage - (currentPage - 1) % pagePerBlock;
		endPage = startPage + pagePerBlock - 1;

		if (endPage > totalPage) {
			endPage = totalPage;
		}
	}
}