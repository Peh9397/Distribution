<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<title>판매가</title>
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
								<input type="search" name="productCd"
									value="${pricing.productCd }" list="productList" class="enter">
								<datalist id="productList">
									<c:forEach var="product" items="${productList }">
										<option value="${product.productCd }">${product.pname }</option>
									</c:forEach>
								</datalist>
							</div>
							<div class="search-item-div">
								<div class="search-item-text">판매가</div>
								<input type="number" name="startPrice"
									value="${pricing.startPrice }" class="keyword price enter">
								~ <input type="number" name="endPrice"
									value="${pricing.endPrice }" class="keyword price enter">
								<p>
							</div>
							<div class="search-item-div">
								<div class="search-item-text">계약시작일</div>
								<input type="date" name="startDate"
									value="${pricing.startDate }" class="keyword startDate">
							</div>
							<div class="search-item-div">
								<div class="search-item-text">계약종료일</div>
								<input type="date" name="endDate" value="${pricing.endDate }"
									class="keyword endDate">
							</div>
							<div class="search-item-div">
								<div class="search-item-text">할인율</div>
								<input type="number" name="discount"
									value="${pricing.discount }" class="keyword discount">
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

			<!-- 페이지갯수설정  -->
			<div id="page">
				<form name="itemLimit">
					<select name="rowPerpage" id="limit">
						<option value="10"
							<c:if test="${pricing.rowPerPage == 10 }">selected="selected"</c:if>>
							10개씩보기</option>
						<option value="20"
							<c:if test="${pricing.rowPerPage == 20 }">selected="selected"</c:if>>
							20개씩보기</option>
						<option value="50"
							<c:if test="${pricing.rowPerPage == 50 }">selected="selected"</c:if>>
							50개씩보기</option>
						<option value="100"
							<c:if test="${pricing.rowPerPage == 100 }">selected="selected"</c:if>>
							100개씩보기</option>
					</select>
				</form>
			</div>

			<!-- 리스트 박스 -->
			<div class="table">
				<table class="table">
					<tr>
						<th class="fixed">
							<c:if test="${pricing.del == 'y' }">
								<input type="checkbox" name="deletedCheckAll" id="th_deletedCheckAll">
							</c:if>
							<c:if test="${pricing.del != 'y' }">
								<input type="checkbox" name="checkAll" id="th_checkAll">
							</c:if>
						</th>
						<th class="fixed">번호</th>
						<th class="fixed" id="sortBuyerCd">고객코드</th>
						<th class="fixed" id="sortBname">고객명</th>
						<th class="fixed" id="sortProductCd">상품코드</th>
						<th class="fixed" id="sortPname">상품명</th>
						<th class="fixed" id="sortPrice">판매가</th>
						<th class="fixed" id="sortStartDate">계약시작일</th>
						<th class="fixed" id="sortEndDate">계약종료일</th>
						<th class="fixed" id="sortDiscount">할인율(%)</th>
						<th class="fixed" id="sortFinalPrice">최종판매가</th>
						<th class="fixed" id="sortAddDate">등록일</th>
						<th class="fixed" id="sortStateDate">상태변경일</th>
					</tr>
					<c:if test="${empty pricingList }">
						검색 결과가 없습니다
					</c:if>
					<c:if test="${not empty pricingList }">
						<c:forEach var="pricing" items="${pricingList }" varStatus="status">
							<tr class="itemRow">
								<td>
									<c:if test="${pricing.del == 'y' }">
										<input type="checkbox" name="deletedRow"
											value="${pricing.buyerCd }&${pricing.productCd}&${pricing.startDate }&${pricing.endDate }">
									</c:if>
									<c:if test="${pricing.del == 'n' }">
										<input type="checkbox" name="checkRow"
											value="${pricing.buyerCd }&${pricing.productCd}&${pricing.startDate }&${pricing.endDate }">
									</c:if>
								</td>
								<td>${pricing.rn }</td>
								<td><input type="hidden" value="${pricing.buyerCd }">${pricing.buyerCd }</td>
								<td>${pricing.bName }</td>
								<td><input type="hidden" value="${pricing.productCd }">${pricing.productCd }</td>
								<td>${pricing.pName }</td>
								<td class="editable"><fmt:formatNumber value="${pricing.price }" pattern="#,###.##"/></td>
								<td><input type="hidden" value="${pricing.startDate }">${pricing.startDate }</td>
								<td><input type="hidden" value="${pricing.endDate }">${pricing.endDate }</td>
								<td class="editable">${pricing.discount }</td>
								<td><fmt:formatNumber value="${pricing.finalPrice }" pattern="#,###.##"/>
								<td>${pricing.addDate }</td>
								<c:if test="${pricing.del == 'n' }">
									<c:if test="${pricing.stateDate == null }">
										<td>(${pricing.stateDate }</td>
									</c:if>
									<c:if test="${pricing.stateDate != null }">
										<td>(수정) ${pricing.stateDate }</td>
									</c:if>
								</c:if>
								<c:if test="${pricing.del == 'y' }">
									<td>(삭제) ${pricing.stateDate }</td>
								</c:if>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
			
			<!-- 등록 창 팝업 -->
			<div class="background">
				<div class="window">
					<div class="popup" align="center">
						<button id="close">X</button>
						<div class="writeForm">
						<form action="" name="pricing">
						<br><h1 class="addSub">판매가 등록</h1><br>
						<table>
							<tr>
								<th>고객코드</th>
								<td>	
									<input type="search" name="buyerCd" value="${pricing.buyerCd }" list="buyerList">
									<datalist id="buyerList">
										<c:forEach var="buyer" items="${buyerList }">
											<option value="${buyer.buyerCd }">${buyer.bName }</option>
										</c:forEach>
									</datalist>
								</td>
								<th>상품코드</th>
								<td>
									<input type="search" name="productCd" value="${pricing.productCd }" list="productList">
									<datalist id="productList">
										<c:forEach var="pricing" items="${productList }">
											<option value="${pricing.productCd }">${pricing.pName }</option>
										</c:forEach>
									</datalist>
								</td>
							</tr>
							<tr>
								<th>판매가</th>
									<td><input type="number" name="price"></td>
									<th>할인율</th>
									<td><input type="number" name="discount"></td>
							</tr>
							<tr>
								<th>계약시작일</th>
									<td><input type="date" name="startDate"></td>
								<th>계약종료일</th>
									<td><input type="date" name="endDate"></td>
							</tr>
						</table>						
						</form>
						
						<div class="insert-btn">
							<button id="addItem" class="btn">추가</button>
						</div>
						<div id="addItemDiv" class="table" style="height: 200px;">
							<table id="addItemTable" class="list">
								<tr>
									<th>고객코드</th>
									<th>상품코드</th>
									<th>판매가</th>
									<th>계약시작일</th>
									<th>계약종료일</th>
									<th>할인율</th>
									<th>삭제</th>
								</tr>
							</table>
							<br><br><br><br><br><br><br>
						</div>
						<div class="insert-btn">
							<button id="pricingInsert" class="btn">등록</button>
						</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 판매가 등록 -->
			<div id="button-div">
				<div class="bottom-btn-div">
					<button class="new-input-btn" onclick="newInputView()">등록하기</button>
					<button class="del-btn" onclick="check()">삭제하기</button>
					<button class="edit-start-btn" onclick="editStart()" style="display: block;">수정하기</button>
					<button class="edit-end-btn" onclick="editEnd()" style="display: none;">수정완료</button>
				</div>
			</div>
			
			<!-- 페이지넘김  -->
			<div id="pageBtn">
				<c:if test="${pricing.currentPage !=1 }">
					<h5 id="prev">◀</h5>
				</c:if>
				&nbsp;&nbsp;
				<form name="paging">
					<input type="number" name="currentPage" value="${pricing.currentPage }"
						id="currentPage">/ ${pricing.totalPage }
				</form>
				&nbsp;&nbsp;
				<c:if test="${pricing.currentPage != pricing.totalPage }">
					<h5 id="next">▶</h5>
				</c:if>
			</div>
			
		</div>
	</div>
</body>
<script type="text/javascript">
	// 등록 팝업 열기 닫기
	function show() {
		document.querySelector(".background").className = "background show";
	}
	
	function close() {
		document.querySelector(".background").className = "background";
	}
	
	document.querySelector("#show").addEventListener("click", show);
	document.querySelector("#close").addEventListener("click", close);
	
	// 콜뷰
	function callView(request) {
		var addr = request;
	
		var ajaxOption = {
			url : request,
			async : true,
			type : "POST",
			dataType : "html",
			cache : false
		};
	
		$.ajax(ajaxOption).done(function(data) {
			$('#content').children().remove();
			$('#content').html(data);
		});
	}
	
	
</script>
</html>