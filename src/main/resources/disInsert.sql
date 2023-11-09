drop table PRICING;
drop table ORDER_PDT;
drop table ORDER_APP;
drop table PRODUCT;
drop table EMPLOYEE;
drop table BUYER;

select * from PRICING;
select * from ORDER_PDT;
select * from ORDER_APP;
select * from PRODUCT;
select * from EMPLOYEE;
select * from BUYER;


--임시입력(test용)
insert into EMPLOYEE values('D000','관리자','dis','관리팀','마스터','010-0000-0000','y','2023.10.24','N','관리자아이디',sysdate);
insert into EMPLOYEE values('D007','관리자','kyd','관리팀','마스터','010-0000-0000','y','2023.10.24','N','관리자아이디',sysdate);
delete from EMPLOYEE where EMPCD='D00000';
select * from EMPLOYEE where EMPCD='D000';


------상품
create table PRODUCT (
  PRODUCTCD --상품코드
  PNAME --상품명
  STOCK -- 재고
  UNIT --단위
  CATEGORY -- 분류
  ADDDATE --등록일
  'N' --삭제
  sysdate --최종변경일
 );
 
------구매자
create table BUYER ( 
  BUYERCD --구매자 코드
  BNAME --회사명
  COMPANYNO --사업자등록번호
  CEO --대표자
  ADDRESS --소재지
  MANAGER --담당자
  TEL --연락처
  EMAIL -- 이메일
  ADDDATE --등록일
  'N' -- 삭제
  REMARK --비고
  sysdate --최종변경일
 );
 
------판매가
create table PRICING (
  BUYERCD --구매자 코드
  PRODUCTCD --상품코드
  STARTDATE -- 시작일
  ENDDATE --종료일
  PRICE --판매가
  DISCOUNT --할인율
  ADDDATE --등록일
  'N' -- 삭제
  sysdate --최종변경일
);
------주문_상품
create table ORDER_PDT ( 
  ORDERNO --주문번호
  PRODUCTCD --상품코드
  PRICE -- 판매가
  ORDERQTY --주문수량
  AMOUNT -- 총액
  ORDERDATE -- 발주일
  REQUESTDATE --납품요청일
  ADDDATE -- 등록일
  REMARK --비고
  sysdate --최종변경일
);
------주문_승인
create table ORDER_APP ( 
  ORDERNO --주문번호
  BUYERCD --구매자 코드
  EMPCD --직원코드
  REASON -- 사유
  AMOUNT -- 총액
  APPDATE -- 승인일
  STATUS  --상태
  'N' --삭제
  sysdate --최종변경일
);

------ 직원
create table EMPLOYEE ( 
  EMPCD --직원코드
  ENAME -- 직원명
  PASSWORD -- 비밀번호
  DEPT -- 부서
  JOB --직책
  TEL -- 연락처
  AUTHORITY --승인권한
  ADDDATE --입사일
  'N' --삭제
  REMARK --비고
  sysdate -- 최종변경일
);