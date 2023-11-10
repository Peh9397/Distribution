drop table PRICING;
drop table ORDER_PDT;
drop table ORDER_APP;
drop table PRODUCT;
drop table EMPLOYEE;
drop table BUYER;



------상품
create table PRODUCT (
  PRODUCTCD varchar2(50) not null primary key, --상품코드
  PNAME varchar2(50) not null, --상품명
  STOCK number(10) not null, -- 재고
  UNIT varchar2(10) not null,--단위
  CATEGORY varchar2(10) not null,-- 분류
  ADDDATE date default sysdate not null, --등록일
  DEL char (1) default 'n' not null, --삭제
  STATEDATE date, --최종변경일
  
  constraint check_DEL check(DEL in ('n', 'y'))
);
------구매자
select * from BUYER

create table BUYER ( 
  BUYERCD varchar2(50) not null primary key, --구매자 코드
  BNAME varchar2(100) not null, --회사명
  COMPANYNO char(10), --사업자등록번호
  CEO VARCHAR2(40), --대표자
  ADDRESS varchar2(150) not null, --소재지
  MANAGER varchar2(20) not null, --담당자
  TEL varchar2(20) not null,--연락처
  EMAIL varchar2(50) not null,-- 이메일
  ADDDATE date default sysdate not null,--등록일
  DEL char(1) default 'n' not null, -- 삭제
  REMARK varchar2(100), --비고
  STATEDATE date, --최종변경일
  
  constraint check_DEL2 check(DEL in ('n', 'y'))
);

------ 직원
select * from EMPLOYEE;

create table EMPLOYEE ( 
  EMPLOYEECD   varchar2(50) 			not null primary key, -- 직원코드
  ENAME  varchar2(20)  	    	not null, 			  -- 직원명
  PASSWORD varchar2(20) 		not null, 			  -- 비밀번호
  DEPARTMENT varchar2(20) 			not null,			  -- 부서
  JOB varchar2(20) 				not null,			  -- 직책
  TEL varchar2(20) 				not null,			  -- 연락처
  AUTHORITY char(1) default 'N' not null,			  -- 승인권한
  ADDDATE date default sysdate 	not null,			  -- 입사일
  DEL char(1)  default 'N' 		not null,			  -- 삭제
  REMARK varchar2(100) ,							  -- 비고
  STATEDATE date, 									  -- 최종변경일
  
  constraint check_DEL5 check(DEL in ('N', 'Y')),
   constraint check_AUTHORITY check(AUTHORITY in ('N', 'Y'))
);
------판매가
create table PRICING (
  BUYERCD varchar2(50) not null, --구매자 코드
  PRODUCTCD varchar2(50) not null, --상품코드
  STARTDATE date not null , -- 시작일
  ENDDATE date not null , --종료일
  PRICE number(10) not null, --판매가
  DISCOUNT number(10) not null, --할인율
  ADDDATE date not null, --등록일
  DEL char(1) default 'n' not null, -- 삭제
  STATEDATE date not null, --최종변경일
  
    constraint check_DEL3 check(DEL in ('n', 'y')),
    constraint pk_pricing PRIMARY KEY(BUYERCD, PRODUCTCD, STARTDATE ,ENDDATE),
    constraint fk_pricing_BUYERCD foreign key (BUYERCD) references BUYER(BUYERCD),
    constraint fk_pricing_PRODUCTCD foreign key (PRODUCTCD) references PRODUCT(PRODUCTCD)
);
------주문_상품
create table ORDER_PDT ( 
  ORDERNO varchar2(50) not null primary key,  --주문번호
  PRODUCTCD varchar2(50) not null,  --상품코드
  PRICE number(10) not null, -- 판매가
  ORDERQTY number(10) not null, --주문수량
  AMOUNT number(10) not null, -- 총액
  ORDERDATE date not null, -- 발주일
  REQUESTDATE date not null,--납품요청일
  ADDDATE date not null,-- 등록일
  REMARK varchar2(100),  --비고
  STATEDATE date --최종변경일
);
------주문_승인
create table ORDER_APP ( 
  ORDERNO varchar2(50) not null, --주문번호
  BUYERCD varchar2(50) not null, --구매자 코드
  EMPCD varchar2(50) not null,--직원코드
  REASON varchar2(200) not null, -- 사유
  AMOUNT number(10) not null,-- 총액
  APPDATE date not null,-- 승인일
  STATUS  varchar2(30)DEFAULT '승인대기' not null,--상태
  DEL char(1) default 'n', --삭제
  STATEDATE date, --최종변경일
  constraint check_DEL4 check(DEL in ('N', 'Y'))
);