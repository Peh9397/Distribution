package com.green.distribution.model;

import java.sql.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class Buyer {
	private String buyerCd; 		// 구매자 코드
	private String bname; 			// 회사명
	private String companyNo;		// 사업자 번호
	private String ceo;				// 대표자
	private String manager;			// 담당자
	private String address;			// 주소
	private String tel;				// 연락처
	private String email;			// 이메일
	private Date   addDate;			// 등록일
	private String del;				// 삭제
	private String remark;			// 비고
	private Date   statedate;		// 최종변경일

	private int rn;

    private int sortBuyerCd;	 	// 구매자 코드
    private int sortBname;			// 회사명
    private int sortManager;		// 담당자
    private int sortTel;			// 연락처
    private int sortEmail;			// 이메일
    private int sortAddress;		// 주소
    private int sortAdddate;		// 등록일
    private int sortStateDate;		// 최종변경일
    
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
	private String buyerCategory;
	
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