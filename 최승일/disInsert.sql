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
insert into EMPLOYEE values('D000','관리자','dis','관리팀','마스터','010-0000-0000','y','2023.10.24','n','관리자아이디',sysdate);
insert into EMPLOYEE values('D001','김사원','1111','영업팀','사원','010-0000-0000','y','2023.10.24','N','관리자아이디',sysdate);
insert into EMPLOYEE values('D002','박사원','2222','영업팀','사원','010-0000-0000','y','2023.10.24','N','관리자아이디',sysdate);
insert into EMPLOYEE values('D003','최사원','3333','영업팀','사원','010-0000-0000','y','2023.10.24','N','관리자아이디',sysdate);
insert into EMPLOYEE values('D007','관리자','kyd','관리팀','마스터','010-0000-0000','y','2023.10.24','N','관리자아이디',sysdate);
insert into PRODUCT values('SN0005', '참우깡', 290,'개', '스낵', '2023.10.24', 'n', sysdate);
delete from EMPLOYEE where EMPCD='D00000';
select * from EMPLOYEE where EMPCD='D000';


------상품
insert into PRODUCT values('SN0005', '참우깡', 290,'개', '스낵', '2023.10.24', 'n', sysdate);

--임시입력(test용 상품)
--라면
insert into PRODUCT values('RA0003', '열내면', 6, '봉지','라면', sysdate, 'n', null);
insert into PRODUCT values('RA0004', '깨라면', 10, '봉지','라면', sysdate, 'n', null);
insert into PRODUCT values('RA0005', '쓴라면', 4, '봉지','라면', sysdate, 'n', null);
insert into PRODUCT values('RA0006', '통게라면', 3, '봉지','라면', sysdate, 'n', null);
insert into PRODUCT values('RA0007', '아프면', 7, '봉지','라면', sysdate, 'n', null);
insert into PRODUCT values('RA0008', '쫄이면', 9, '봉지','라면', sysdate, 'n', null);
--스낵
insert into PRODUCT values('SN0001', '알새칩', 6, '개','스낵', sysdate, 'n', null);
insert into PRODUCT values('SN0002', '새우가', 10, '개','스낵', sysdate, 'n', null);
insert into PRODUCT values('SN0003', '뒷동산', 4, '개','스낵', sysdate, 'n', null);
insert into PRODUCT values('SN0004', '빈추', 3, '개','스낵', sysdate, 'n', null);
insert into PRODUCT values('SN0006', '첨', 9, '개','스낵', sysdate, 'n', null);
insert into PRODUCT values('SN0007', '버터넛', 19, '개','스낵', sysdate, 'n', null);
insert into PRODUCT values('SN0008', '오레요', 7, '개','스낵', sysdate, 'n', null);

--음료
insert into Product values('DR0001','포카리',20,'개','음료',sysdate,'n',null);
insert into Product values('DR0002','맛카리',25,'개','음료',sysdate,'n',null);
insert into Product values('DR0003','아이셔',10,'개','음료',sysdate,'n',null);
insert into Product values('DR0004','딸기음료',200,'개','음료',sysdate,'n',null);
insert into Product values('DR0005','수박음료',70,'개','음료',sysdate,'n',null);
insert into Product values('DR0006','짱카리',90,'개','음료',sysdate,'n',null);
insert into Product values('DR0007','파워에이드',100,'개','음료',sysdate,'n',null);
insert into Product values('DR0008','맛없는음료',30,'개','음료',sysdate,'n',null);

create table PRODUCT (
  PRODUCTCD --상품코드
  PNAME --상품명
  STOCK -- 재고
  UNIT --단위
  CATEGORY -- 분류
  ADDDATE --등록일
  'n' --삭제
  sysdate --최종변경일
 );
 
------구매자
--임시입력(test용 구매자)
insert into buyer values('FOD001','GS01','5100712036','파프로','경기 파주시 탄현면 새오리로56','김매니저','010-0000-0000','GS01@GS.COM',sysdate,'y','',null);
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
  'n' -- 삭제
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
  'n' -- 삭제
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
  'n' --삭제
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
  'n' --삭제
  REMARK --비고
  sysdate -- 최종변경일
);