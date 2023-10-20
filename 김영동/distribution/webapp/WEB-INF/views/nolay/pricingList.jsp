<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="main-container">
		<div class="content">
			<div class="top-div">
				<div class="top-title">
					<h1>판매가격관리</h1>
				</div>
			</div>
			<!-- 검색 박스 -->
			<div class="search-div">
				<div class="search-sub-inbox">
					<form name="searchbox">

						<!-- 정렬용 -->
						<input type="hidden" name="sortBuyerCd" value="${pricing.buyerCd }">
						<input type="hidden" name="sortBname" value="${pricing.bName }">
						<input type="hidden" name="sortProductCd" value="${pricing.productCd }">
						<input type="hidden" name="sortPname" value="${pricing.pName }">
						<input type="hidden" name="sortPrice" value="${pricing.price }">
						<input type="hidden" name="sortStartDate" value="${pricing.startDate }">
						<input type="hidden" name="sortEndDate" value="${pricing.endDate }">
						<input type="hidden" name="sortDiscount" value="${pricing.discount }">
						<input type="hidden" name="sortFinalPrice" value="${pricing.finalPrice }">
						<input type="hidden" name="sortAddDate" value="${pricing.addDate }">
						<input type="hidden" name="sortStateDate" value="${pricing.stateDate }">

						<div class="search-sub-div">
							<div class="search-item-div">
								<div class="search-item-text">고객코드</div>
								<input type="search" name="buyerCd" value="${pricing.buyerCd }"
									list="buyerList" class="enter">
								<datalist id="buyerList">
									<c:forEach var="buyer" items="${buyerList }">
										<option value="${buyer.buyerCd }">${buyer.bname }</option>
									</c:forEach>
								</datalist>
							</div>
							<div class="search-item-div">
								<div class="search-item-text">상품코드</div>
								<input type="search" name="productCd" value="${pricing.productCd }"
									list="productList" class="enter">
								<datalist id="productList">
									<c:forEach var="product" items="${productList }">
										<option value="${product.productCd }">${product.pname }</option>
									</c:forEach>
								</datalist>
							</div>
							<div class="search-item-div">
								<div class="search-item-text">판매가</div>
								<input type="number" name="startPrice" value="${pricing.startPrice }" class="keyword price enter">
								~
								<input type="number" name="endPrice" value="${pricing.endPrice }" class="keyword price enter"><p>
							</div>
							<div class="search-item-div">
								<div class="search-item-text">계약시작일</div>
								<input type="date" name="startDate" value="${pricing.startDate }" class="keyword startDate">
							</div>
							<div class="search-item-div">
								<div class="search-item-text">계약종료일</div>
								<input type="date" name="endDate" value="${pricing.endDate }" class="keyword endDate">
							</div>
							<div class="search-item-div">
								<div class="search-item-text">할인율</div>
								<input type="number" name="discount" value="${pricing.discount }" class="keyword discount">
							</div>
							<div class="search-item-div">
								<div class="search-item-text">거래상태</div>
									<select name="del">
										<option value="n">거래중</option>
										<c:if test="${pricing.del == 'y' }">
											<option value="y" selected="selected">거래중</option>
										</c:if>
										<c:if test="${pricing.del != 'y' }">
											<option value="y">거래종료</option>
										</c:if>
									</select>
							</div>
						</div>
					</form>
				</div>
				<div class="search-btn">
					<button id="searchBtn">검색</button>
					<button id="initBtn">초기화</button>
				</div>
			</div>
			
			<!-- 판매가 등록 -->
			<div id="button-div">
				<button id="show" class="btn">등록</button>
				<c:if test="${pricing.del != 'y' }">
					<button type="button" onclick="deleteAction()" class="btn"></button>
				</c:if>
				<c:if test="${pricing.del == 'y' }">
					<button type="button" onclick="restoreAction()" class="btn"></button>
				</c:if>
				<button id="excelBtn"><img alt="" src="/distribution/resources/images/excel2.png" id="excelImg"></button>
			</div>
		</div>
	</div>
</body>
</html>