--고객코드--
select * from BUYER
drop table BUYER


insert into BUYER values ('CVS001', 'GS25', '0000000001', '강준병', '서울특별시 영등포구 대림로 214', '김영동', '02-0001-0001', 'dud@naver.com', sysdate, 'n', null, sysdate);
insert into BUYER values ('CVS002', 'CU', '0000000002', '강준병', '서울특별시 영등포구 대림로 481', '김찬양', '02-0002-0002', 'cks@naver.com', sysdate, 'n', null, sysdate);
insert into BUYER values ('CVS003', '세븐일레븐', '0000000003', '강준병', '서울특별시 영등포구 대림로 331 ', '박은혁', '02-0003-0003', 'dms@naver.com', sysdate, 'n', null, sysdate);
insert into BUYER values ('CVS004', '미니스톱', '0000000004', '강준병', '서울특별시 영등포구 대림로 121', '김찬혁', '02-0004-0004', 'tmd@naver.com', sysdate, 'n', null, sysdate);
insert into BUYER values ('FOD001', '오뚜기', '0000000006', '강준병', '파주시 파주읍 파주리 12', '영동김', '031-952-0001', 'did@naver.com', sysdate, 'n', null, sysdate);
insert into BUYER values ('FOD002', '삼양', '0000000007', '강준병', '파주시 파주읍 파주리 4', '찬양김', '031-952-0002', 'gur@naver.com', sysdate, 'n', null, sysdate);
insert into BUYER values ('FOD003', '농심', '0000000008', '강준병', '파주시 파주읍 파주리 318', '은혁박', '031-952-0003', 'dlf@naver.com', sysdate, 'n', null, sysdate);
insert into BUYER values ('FOD004', 'SPC삼립', '0000000009', '강준병', '파주시 파주읍 파주리 178', '승일최', '031-952-0004', 'rla@naver.com', sysdate, 'n', null, sysdate);
insert into BUYER values ('MAT001', '홈플러스', '0000000011', '강준병', '서울특별시 관악구 신림로 102', '최혁찬', '02-0006-0006', 'qkr@naver.com', sysdate, 'n', null, sysdate);
insert into BUYER values ('MAT002', '하나로마트', '0000000012', '강준병', '서울특별시 관악구 신림로 187', '김동영', '02-0007-0007', 'wh@naver.com', sysdate, 'n', null, sysdate);
insert into BUYER values ('MAT003', '트레이더스', '0000000013', '강준병', '서울특별시 관악구 신림로 9', '김양찬', '02-0008-0008', 'dks@naver.com', sysdate, 'n', null, sysdate);
insert into BUYER values ('MAT004', '코스트코', '0000000014', '강준병', '서울특별시 관악구 신림로 47', '박혁은', '02-0009-0009', 'qkq@naver.com', sysdate, 'n', null, sysdate);
insert into BUYER values ('ETC001', '다이소', '0000000016', '강준병', '서울특별시 송파구 올림픽로 30', '최일승', '02-0011-0011', 'rh@naver.com', sysdate, 'n', null, sysdate);
insert into BUYER values ('ETC002', '꼬끼오', '0000000017', '강준병', '서울특별시 송파구 올림픽로 20', '김승혁', '02-0012-0012', 'tlv@naver.com', sysdate, 'n', null, sysdate);
insert into BUYER values ('ETC003', '더제이마켓', '0000000018', '강준병', '서울특별시 송파구 올림픽로 50', '김일은', '02-0013-0013', 'ek@naver.com', sysdate, 'n', null, sysdate);
insert into BUYER values ('ETC004', '마트킹', '0000000019', '강준병', '서울특별시 송파구 올림픽로 70', '최승일', '02-0014-0014', 'sud@naver.com', sysdate, 'n', null, sysdate)




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
--직원
select * from EMPLOYEE;
drop table EMPLOYEE


insert into EMPLOYEE values ('SAL001', '김영동', '1234', '영업', '사원', '010-1111-1111', 'N', sysdate, 'N', '미정', null );
insert into EMPLOYEE values ('SAL002', '김찬양', '1234', '영업', '대리', '010-2222-2222', 'N', sysdate, 'N', '미정', null );
insert into EMPLOYEE values ('SAL003', '박은혁', '1234', '영업', '과장', '010-3333-3333', 'Y', sysdate, 'N', '미정', null );
insert into EMPLOYEE values ('SAL004', '최승일', '1234', '영업', '차장', '010-5555-5555', 'Y', sysdate, 'N', '미정', null );
insert into EMPLOYEE values ('SAL005', '김찬혁', '1234', '영업', '부장', '010-6666-6666', 'Y', sysdate, 'N', '미정', null );
insert into EMPLOYEE values ('DIS001', '영동김', '1234', '물류', '사원', '010-7777-7777', 'N', sysdate, 'N', '미정', null );
insert into EMPLOYEE values ('DIS002', '찬양김', '1234', '물류', '대리', '010-8888-8888', 'N', sysdate, 'N', '미정', null );
insert into EMPLOYEE values ('DIS003', '은혁박', '1234', '물류', '과장', '010-9999-9999', 'Y', sysdate, 'N', '미정', null );
insert into EMPLOYEE values ('DIS004', '승일최', '1234', '물류', '차장', '010-1010-1010', 'Y', sysdate, 'N', '미정', null );
insert into EMPLOYEE values ('DIS005', '최혁찬', '1234', '물류', '부장', '010-0101-0101', 'Y', sysdate, 'N', '미정', null );
insert into EMPLOYEE values ('EMP001', '김동영', '1234', '직원', '사원', '010-1111-2222', 'N', sysdate, 'N', '미정', null );
insert into EMPLOYEE values ('EMP002', '김양찬', '1234', '직원', '대리', '010-2222-3333', 'N', sysdate, 'N', '미정', null );
insert into EMPLOYEE values ('EMP003', '박혁은', '1234', '직원', '과장', '010-3333-4444', 'Y', sysdate, 'N', '미정', null );
insert into EMPLOYEE values ('EMP004', '최일승', '1234', '직원', '차장', '010-4444-5555', 'Y', sysdate, 'N', '미정', null );
insert into EMPLOYEE values ('EMP005', '김승혁', '1234', '직원', '부장', '010-5555-6666', 'Y', sysdate, 'N', '미정', null );
insert into EMPLOYEE values ('EMP006', '김일은', '1234', '직원', '사장', '010-6666-7777', 'Y', sysdate, 'N', '미정', null );