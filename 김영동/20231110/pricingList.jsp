<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	input:focus {
		outline: none;
	}
	
	#searchBox {
		display: flex;
		border: 1px solid #bfbfbf;
		padding: 10px;
	}
	
	.search-sub-div {
		display: inline-flex;
		justify-content: space-between;
		flex-direction: row;
	}
	
	.search-item-div {
		flex-grow: 1;
		margin-right: 10px;
	}
	
	#searchBtn, #initBtn {
		width: 85px;
		height: 45px;
		background-color: #1b1b1b;
		color: #ffffff;
		text-align: center;
		cursor: pointer;
		border-radius: 7px;
		border: none;
	}
	
	input[type="date"], #limit {
		cursor: pointer;
	}
	
	.btn {
		width: 50px;
		height: 25px;
		background-color: #44444c;
		color: #ffffff;
		text-align: center;
		cursor: pointer;
		border-radius: 7px;
		border: none;
		font-size: 11px;
	}
	
	.table {
		display: flex;
		justify-content: center;
		border: 1px solid #bfbfbf;
		padding: 10px;
		height: 50%;
	}
	
	table {
		width: 85%;
	}
	
	#excelBtn, #excelImg {
		width: 24px;
		border: none;
	}
	.background {
	  position: fixed;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100vh;
	  background-color: rgba(0, 0, 0, 0.3);
	  z-index: 1000;
	  
	  /* 숨기기 */
	  z-index: -1;
	  opacity: 0;
	}
	
	.window {
	  position: relative;
	  width: 100%;
	  height: 100%;
	}
	
	.popup {
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  transform: translate(-50%, -50%);
	  background-color: #ffffff;
	  box-shadow: 0 2px 7px rgba(0, 0, 0, 0.3);
	  
	  /* 임시 지정 */
	  width: 600px;
	  height: 720px;
	  
	  /* 초기에 약간 아래에 배치 */
	  transform: translate(-50%, -40%);
	}
	
	.show {
	  opacity: 1;
	  z-index: 1000;
	  transition: all .5s;
	}
	
	.show .popup {
	  transform: translate(-50%, -50%);
	  transition: all .5s;
	}
	
	#close {
		float: right;
		font-size: x-large;
	}
	
	#item {
		border: 1px solid;
	}
	
	
	.sumo {
		color : black;
	}
	li.opt {
		color : black;
	}
	
	
	.fixed {
		position: sticky;
		top: 0;
	}
	
	#insert-form{
		boder: 1px solid black;
	}
		
	.insert-btn {
		margin-bottom: 20px;
	    margin-top: 10px;
	    text-align: center;
	}
	
	.readonly {
		background-color: silver;
	}
	
	#excelBtn {
	    border-style: none;
    	background: #fcfaee
	}
	
	#excelImg {
		width: 30px;
   		margin-bottom: -9px;
   		cursor: pointer;
	}
	
	.addSub {
		font-family: 'GmarketSansMedium';
	}
</style>
<script type="text/javascript">
	function content(data) {
		var addr = data;
		
		var ajaxOption = {
			url : addr,
			async : true,
			type : "POST",
			dataType : "html",
			cache : false
		};
		
		$.ajax(ajaxOption).done(function (data) {
			$('#layoutBody').children().remove();
			$('#layoutBody').html(data);
		})
		
	}
</script>

<!-- 엑셀 제목날짜입력  -->
<jsp:useBean id="date1" class="java.util.Date"></jsp:useBean>


</head>
<body>
	<div class="container">
		<div class="content">
			<div class="top-div">
				<div class="top-title">
					<h1>판매가격관리</h1>
				</div>
			</div>
			<!-- 검색 박스 -->
			<div id="searchBox">
				<div class="searchInBox">
					<form name="searchBoxx">
						<!-- 정렬용 -->
						<input type="hidden" name="sortBuyerCd" value="${pricing.sortBuyerCd }">
						<input type="hidden" name="sortBname" value="${pricing.sortBname }">
						<input type="hidden" name="sortProductCd" value="${pricing.sortProductCd }">
						<input type="hidden" name="sortPname" value="${pricing.sortPname }">
						<input type="hidden" name="sortPrice" value="${pricing.sortPrice }">
						<input type="hidden" name="sortStartDate" value="${pricing.sortStartDate }">
						<input type="hidden" name="sortEndDate" value="${pricing.sortEndDate }">
						<input type="hidden" name="sortDiscount" value="${pricing.sortDiscount }">
						<input type="hidden" name="sortFinalPrice" value="${pricing.sortFinalPrice }">
						<input type="hidden" name="sortAddDate" value="${pricing.sortAddDate }">
						<input type="hidden" name="sortStateDate" value="${pricing.sortStateDate }">

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
								<input type="text" name="startPrice"
									value="${pricing.startPrice }" class="keyword price enter" maxlength="6">
								~ <input type="text" name="endPrice"
									value="${pricing.endPrice }" class="keyword price enter" maxlength="6">
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
								<input type="text" name="discount"
									value="${pricing.discount }" class="keyword discount" maxlength="2">
							</div>
							<div class="search-item-div">
								<div class="search-item-text">거래상태</div>
								<select name="del">
									<option value="n">거래중</option>
									<c:if test="${pricing.del == 'y' }">
										<option value="y" selected="selected">거래종료</option>
									</c:if>
									<c:if test="${pricing.del != 'y' }">
										<option value="y">거래종료</option>
									</c:if>
									<c:if test="${pricing.del == 'All' }">
										<option value="All" selected="selected">모두</option>
									</c:if>
									<c:if test="${pricing.del != 'All' }">
										<option value="All">모두</option>
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
			<div id="page" align="right" style="margin-bottom: 10px;">
				<form name="itemLimit">
					<select name="rowPerPage" id="limit">
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
			
			<div class="priceList-div">
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
					<tr>
						<td align="center" colspan="13">검색 결과가 없습니다</td>
					</tr>
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
								<td>${pricing.bname }</td>
								<td><input type="hidden" value="${pricing.productCd }">${pricing.productCd }</td>
								<td>${pricing.pname }</td>
								<td class="editable"><fmt:formatNumber value="${pricing.price }" pattern="#,###.##"/></td>
								<td><input type="hidden" value="${pricing.startDate }">${pricing.startDate }</td>
								<td><input type="hidden" value="${pricing.endDate }">${pricing.endDate }</td>
								<td class="editable">${pricing.discount }</td>
								<td><fmt:formatNumber value="${pricing.finalPrice }" pattern="#,###.##"/>
								<td>${pricing.addDate }</td>
								<c:if test="${pricing.del == 'n' }">
									<c:if test="${pricing.stateDate == null }">
										<td>${pricing.stateDate }</td>
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
											<option value="${buyer.buyerCd }">${buyer.bname }</option>
										</c:forEach>
									</datalist>
								</td>
								<th>상품코드</th>
								<td>
									<input type="search" name="productCd" value="${pricing.productCd }" list="productList">
									<datalist id="productList">
										<c:forEach var="pricing" items="${productList }">
											<option value="${pricing.productCd }">${pricing.pname }</option>
										</c:forEach>
									</datalist>
								</td>
							</tr>
							<tr>
								<th>판매가</th>
									<td><input type="text" name="price" maxlength="6"></td>
									<th>할인율</th>
									<td><input type="text" name="discount" maxlength="2"></td>
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
						<div id="addItemDiv" class="table" style="height: 300px;">
							<table id="addItemTable" class="list" style="height: 30px;">
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
						</div>
						<div class="insert-btn">
							<button id="pricingInsert" class="btn" onclick="">등록</button>
						</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 판매가 등록 -->
			<div id="button-div">
				<div class="bottom-btn-div">
					<button id="show" class="btn">등록</button>
					<c:if test="${pricing.del != 'y'}">
						<button type="button" onclick="deleteAction()" class="btn">삭제</button>
					</c:if>
					<c:if test="${pricing.del == 'y'}">
						<button type="button" onclick="restoreAction()" class="btn">복원</button>
					</c:if>
					<div align="right">
						<button id="excelBtn"><img alt="" src="/distribution/resources/images/excel.png" id="excelImg"></button>
					</div>
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
			$('#layoutBody').children().remove();
			$('#layoutBody').html(data);		
		});
	}
	
	// 등록창에 판매가리스트 추가
	function changeTable() {
		const buyerCd = pricing.buyerCd.value;
		const productCd = pricing.productCd.value;
		const price = pricing.price.value;
		const startDate = pricing.startDate.value;
		const endDate = pricing.endDate.value;
		const discount = pricing.discount.value;
		
		
		if (buyerCd == '' || productCd == '' || price == '' || 
				startDate == '' || endDate == '' || discount == ''){
			alert('값을 채워넣어주세요');
			
			if (buyerCd == '') {
				$("input[name='buyerCd']").addClass('red');
			} else {
				$("input[name='buyerCd']").removeClass('red');
			}
			if (productCd == '') {
				$("input[name='productCd']").addClass('red');
			} else {
				$("input[name='productCd']").removeClass('red');
			}
			if (price == '') {
				$("input[name='price']").addClass('red');
			} else {
				$("input[name='price']").removeClass('red');
			}
			if (discount == '') {
				$("input[name='discount']").addClass('red');
			} else {
				$("input[name='discount']").removeClass('red');
			}
			if (startDate == '') {
				$("input[name='startDate']").addClass('red');
			} else {
				$("input[name='startDate']").removeClass('red');
			}
			if (endDate == '') {
				$("input[name='endDate']").addClass('red');
			} else {
				$("input[name='endDate']").removeClass('red');
			}			
		}
		else {
			$.ajax({
			     method: 'post',
			     url: 'overlapCheck.do',
			     traditional: true,
			     data: {
			    	 buyerCd: buyerCd,
			    	 productCd: productCd,
			    	 startDate: startDate,
			    	 endDate: endDate
			     },
			     dataType: 'json',
			     success: function (result) {
			        if (result == 0) {
						$('#addItemTable').append(
								"<tr>" +
									"<td>" + buyerCd + "</td>" +
									"<td>" + productCd + "</td>" +
									"<td>" + price + "</td>" +
									"<td>" + startDate + "</td>" +
									"<td>" + endDate + "</td>" +
									"<td>" + discount + "</td>" +
									"<td><button onclick='deleteItem(this)'>삭제</button></td>" +
								"</tr>"
						);
						pricing.price.value = '';
						pricing.startDate.value = '';
						pricing.endDate.value = '';
						pricing.discount.value = '';
			        } else {
			        	alert("계약일이 중복되었습니다");
			        }
				}
		   });
		}
	}

	document.querySelector("#addItem").addEventListener("click", changeTable);
	
	//등록창 리스트에서 삭제
	function deleteItem(e) {
		e.parentNode.parentNode.parentNode.removeChild(e.parentNode.parentNode);
	}
	//등록창 리스트 전체 등록
	function pricingInsert() {
		const table = document.querySelector('#addItemTable');
		const rows = table.getElementsByTagName("tr");
		const tableLength = table.rows.length-1;
		console.log(rows);
		
		const items = new Array(tableLength);
		
		for (let i = 0; i < tableLength; i++) {
			let cells = rows[i+1].getElementsByTagName("td");
			
			items[i] = { 
				buyerCd: cells[0].firstChild.data,
				productCd: cells[1].firstChild.data,
				price: cells[2].firstChild.data,
				startDate: cells[3].firstChild.data,
				endDate: cells[4].firstChild.data,
				discount: cells[5].firstChild.data
			};
			console.log('성공');
			console.log(items[i]);
		};
		
		console.log(items);
		
		$.ajax({
		     method: 'post',
		     url: 'pricingInsert.do',
		     traditional: true,
		     data: {
		    	 items: JSON.stringify(items)
		     },
		     dataType: 'json',
		     success: function (result) {
		        if (result) {
					callView('pricingList.do');
					alert("등록 성공");
		        } else {
		        	alert("데이터를 추가해 주세요");
		        }
			}
	   });
	}

	document.querySelector("#pricingInsert").addEventListener("click", pricingInsert);
	</script>
	
	<c:if test="${pricing.del =='n' or pricing.del == 'All' }">
	<script type="text/javascript">
// 	체크박스 모두선택
	function checkAll(){
	    if( $("#th_checkAll").is(':checked') ){
	      $("input[name=checkRow]").prop("checked", true);
	    }else{
	      $("input[name=checkRow]").prop("checked", false);
	    }
	}
	document.querySelector("#th_checkAll").addEventListener("click", checkAll);
	</script>
</c:if>
	
	<script type="text/javascript">
	// 체크박스 선택시 삭제
	function deleteAction(){
		  var checkRow = new Array();
		  $( "input[name='checkRow']:checked" ).each (function (){
		    checkRow.push($(this).val());
		  });
		  
		  console.log(checkRow);
		  
		  if(checkRow == ''){
		    alert("삭제할 대상을 선택하세요.");
		    return false;
		  }
		  $.ajax({
			    url : "pricingDelete.do",
			    type : "post",
			    traditional : true,
			    data : { checkRows : checkRow },
			    
			    success : function(result){
			    	if(result ==1){
			    		callView('pricingList.do');
			    		alert("삭제완료");
			    		
			    	}else
			    		alert("삭제실패");
					console.log(result);
			    }
		  });
	};
	</script>
	
	
	<!-- 	삭제 항목 복원 -->
		<c:if test="${pricing.del =='y'}">
			<script type="text/javascript">
				function delCheckAll(){
				    if( $("#th_deletedCheckAll").is(':checked') ){
				      $("input[name=deletedRow]").prop("checked", true);
				    }else{
				      $("input[name=deletedRow]").prop("checked", false);
				    }
				}
			
				document.querySelector("#th_deletedCheckAll").addEventListener("click", delCheckAll);
			</script>
		</c:if>
		<script type="text/javascript">
		
		
		function restoreAction(){
			  var checkRow = new Array();
			  $( "input[name='deletedRow']:checked" ).each (function (){
			    checkRow.push($(this).val());
			  });
			  
			  if(checkRow == ''){
			    alert("복원할 대상을 선택하세요.");
			    return false;
			  }
			  $.ajax({
				    url : "pricingRestore.do",
				    type : "post",
				    traditional : true,
				    data : { checkRows : checkRow },
				    
				    success : function(result){
				    	if(result ==1){
				    		alert("복원완료");
				    		search();
				    		
				    	}else
				    		alert("복원실패");
				    }
			  });
		};
		</script>
		
		
		<script type="text/javascript">
	
	
	//	검색
 	function search() {
		
		const keyword = {
			buyerCd : searchBoxx.buyerCd.value,	
			productCd : searchBoxx.productCd.value,	
			startPrice : searchBoxx.startPrice.value,	
			endPrice : searchBoxx.endPrice.value,	
			startDate : searchBoxx.startDate.value,
			endDate : searchBoxx.endDate.value,
			discount : searchBoxx.discount.value,
			del : searchBoxx.del.value,
			
			sortBuyerCd : searchBoxx.sortBuyerCd.value,
			sortBname : searchBoxx.sortBname.value,
			sortProductCd : searchBoxx.sortProductCd.value,
			sortPname : searchBoxx.sortPname.value,
			sortPrice : searchBoxx.sortPrice.value,
			sortStartDate : searchBoxx.sortStartDate.value,
			sortEndDate : searchBoxx.sortEndDate.value,
			sortDiscount : searchBoxx.sortDiscount.value,
			sortFinalPrice : searchBoxx.sortFinalPrice.value,
			sortAddDate : searchBoxx.sortAddDate.value,
			sortStateDate : searchBoxx.sortStateDate.value,
			
			rowPerPage : itemLimit.rowPerPage.value,
			currentPage : paging.currentPage.value
		}
		console.log(keyword);
		
		$.ajax({
		     method: 'post',
		     url: 'pricingSearch.do',
		     traditional: true,
		     data: {
		    	keyword: JSON.stringify(keyword)
		     },
		     success: function (result) {
		    	 $('#layoutBody').children().remove();
				 $('#layoutBody').html(result);
				 //'#content'
			 },
			 error: function () {
				 alert('실패');
			 }
	   });

	};

	
	document.querySelector("#searchBtn").addEventListener("click", search);
	
		
	//	검색초기화
	document.querySelector("#initBtn").addEventListener("click",  function(){
		searchBoxx.buyerCd.value='',
		searchBoxx.productCd.value='',
		searchBoxx.startPrice.value=0,
		searchBoxx.endPrice.value=0,
		searchBoxx.startDate.value='',
		searchBoxx.endDate.value='',
		searchBoxx.discount.value=0,
		searchBoxx.del.value='n';
		
	});
		
	//	정렬
	function initSort() {
		searchBoxx.sortBuyerCd.value = 0;
		searchBoxx.sortBname.value = 0;
		searchBoxx.sortProductCd.value = 0;
		searchBoxx.sortPname.value = 0;
		searchBoxx.sortPrice.value = 0;
		searchBoxx.sortStartDate.value = 0;
		searchBoxx.sortEndDate.value = 0;
		searchBoxx.sortDiscount.value = 0;
		searchBoxx.sortFinalPrice.value = 0;
		searchBoxx.sortAddDate.value = 0;
		searchBoxx.sortStateDate.value = 0;
	}

	$('#sortBuyerCd').on('click', function() {
		if (searchBoxx.sortBuyerCd.value == 0 || searchBoxx.sortBuyerCd.value == 2) {
			initSort();
			searchBoxx.sortBuyerCd.value = 1;			
		} else if (searchBoxx.sortBuyerCd.value == 1) {
			initSort();
			searchBoxx.sortBuyerCd.value = 2;
		}		
		search();
	});
	$('#sortBname').on('click', function() {
		if (searchBoxx.sortBname.value == 0 || searchBoxx.sortBname.value == 2) {
			initSort();
			searchBoxx.sortBname.value = 1;			
		} else if (searchBoxx.sortBname.value == 1) {
			initSort();
			searchBoxx.sortBname.value = 2;
		}		
		search();
	});
	$('#sortProductCd').on('click', function() {
		if (searchBoxx.sortProductCd.value == 0 || searchBoxx.sortProductCd.value == 2) {
			initSort();
			searchBoxx.sortProductCd.value = 1;			
		} else if (searchBoxx.sortProductCd.value == 1) {
			initSort();
			searchBoxx.sortProductCd.value = 2;
		}		
		search();
	});
	$('#sortPname').on('click', function() {
		if (searchBoxx.sortPname.value == 0 || searchBoxx.sortPname.value == 2) {
			initSort();
			searchBoxx.sortPname.value = 1;			
		} else if (searchBoxx.sortPname.value == 1) {
			initSort();
			searchBoxx.sortPname.value = 2;
		}		
		search();
	});
	$('#sortPrice').on('click', function() {
		if (searchBoxx.sortPrice.value == 0 || searchBoxx.sortPrice.value == 2) {
			initSort();
			searchBoxx.sortPrice.value = 1;		
		} else if (searchBoxx.sortPrice.value == 1) {
			initSort();
			searchBoxx.sortPrice.value = 2;
		}		
		search();
	});
	$('#sortStartDate').on('click', function() {
		if (searchBoxx.sortStartDate.value == 0 || searchBoxx.sortStartDate.value == 2) {
			initSort();
			searchBoxx.sortStartDate.value = 1;			
		} else if (searchBoxx.sortStartDate.value == 1) {
			initSort();
			searchBoxx.sortStartDate.value = 2;
		}		
		search();
	});
	$('#sortEndDate').on('click', function() {
		if (searchBoxx.sortEndDate.value == 0 || searchBoxx.sortEndDate.value == 2) {
			initSort();
			searchBoxx.sortEndDate.value = 1;			
		} else if (searchBoxx.sortEndDate.value == 1) {
			initSort();
			searchBoxx.sortEndDate.value = 2;
		}		
		search();
	});
	$('#sortDiscount').on('click', function() {
		if (searchBoxx.sortDiscount.value == 0 || searchBoxx.sortDiscount.value == 2) {
			initSort();
			searchBoxx.sortDiscount.value = 1;			
		} else if (searchBoxx.sortDiscount.value == 1) {
			initSort();
			searchBoxx.sortDiscount.value = 2;
		}		
		search();
	});
	$('#sortFinalPrice').on('click', function() {
		if (searchBoxx.sortFinalPrice.value == 0 || searchBoxx.sortFinalPrice.value == 2) {
			initSort();
			searchBoxx.sortFinalPrice.value = 1;			
		} else if (searchBoxx.sortFinalPrice.value == 1) {
			initSort();
			searchBoxx.sortFinalPrice.value = 2;
		}		
		search();
	});
	$('#sortAddDate').on('click', function() {
		if (searchBoxx.sortAddDate.value == 0 || searchBoxx.sortAddDate.value == 2) {
			initSort();
			searchBoxx.sortAddDate.value = 1;			
		} else if (searchBoxx.sortAddDate.value == 1) {
			initSort();
			searchBoxx.sortAddDate.value = 2;
		}		
		search();
	});
	$('#sortStateDate').on('click', function() {
		if (searchBoxx.sortStateDate.value == 0 || searchBoxx.sortStateDate.value == 2) {
			initSort();
			searchBoxx.sortStateDate.value = 1;			
		} else if (searchBoxx.sortStateDate.value == 1) {
			initSort();
			searchBoxx.sortStateDate.value = 2;
		}		
		search();
	});	
	//		페이지 버튼, 페이지 당 요소 갯수
	$('#prev').on('click', function() {
		paging.currentPage.value--;
		if (paging.currentPage.value < 1) {
			paging.currentPage.value = 1;
		}
		search();
	});
	$('#next').on('click', function() {
		paging.currentPage.value++;
		
		if (paging.currentPage.value > ${pricing.totalPage }) {
			paging.currentPage.value = ${pricing.totalPage };
			}
		search(); 
	});
	
	$('#limit').on('change', function() {
		paging.currentPage.value = 1;
		search();
	});
	
	$('#currentPage').keydown(function(key) {
		if(key.keyCode == 13) {
			key.preventDefault();
			
			if (paging.currentPage.value < 1) {
				paging.currentPage.value = 1;
			}
			
			if (paging.currentPage.value > ${pricing.totalPage}) {
				paging.currentPage.value = ${pricing.totalPage};
			}
			
			search();
		}
	});
	//		엑셀 입출력
	function excel() {
		
		let checkRow = new Array();
		
		$( "input[name='checkRow']:checked" ).each (function (){
			 let thisRow = $(this).closest('tr');
			  
			 const pricing = {
				buyerCd : thisRow.find('td:eq(2)').find('input').val(),
				productCd : thisRow.find('td:eq(4)').find('input').val(),
				startDate : thisRow.find('td:eq(7)').find('input').val(),
				endDate : thisRow.find('td:eq(8)').find('input').val()
			 }

			 checkRow.push(pricing);
		
		});
		
		  
		 console.log(checkRow);
		 
		 J300.ajax({
			  url : 'pricingExcelDown.do',
			  method : 'post',
			  traditional : true,
			  data : {
				  pricings : JSON.stringify(checkRow)
			  },
			  xhr: function () {
                  var xhr = new XMLHttpRequest();
                  xhr.onreadystatechange = function () {
                      if (xhr.readyState == 2) {
                          if (xhr.status == 200) {
                              xhr.responseType = "blob";
                          } else {
                              xhr.responseType = "text";
                          }
                      }
                  };
                  return xhr;
			    },
			  success : function(data) {
				  console.log(data);
				//alert("엑셀다운완료?");
				//Convert the Byte Data to BLOB object.
                var blob = new Blob([data], { type: "application/octetstream" });

                //Check the Browser type and download the File.
                var isIE = false || !!document.documentMode;
                if (isIE) {
                    window.navigator.msSaveBlob(blob, fileName);
                } else {
                    var url = window.URL || window.webkitURL;
                    link = url.createObjectURL(blob);
                    var a = $("<a />");
                    a.attr("download", "Pricing_<fmt:formatDate value='${date1 }' pattern='yyyyMMdd'/>.xlsx");
                    a.attr("href", link);
                    $("body").append(a);
                    a[0].click();
                    $("body").remove(a);
                }
			}, error: function (xhr, status, error) {
				console.log("error");
			} 
		 });
		  
	}

	document.querySelector("#excelBtn").addEventListener("click", excel);
	
// 	테이블 더블클릭하여 수정
	$(document).ready(function() {
		let initValue=""; //초기에 있던 값을 전역변수로 선언(수정하다가 커서가 다른곳 클릭하면 원래값으로 돌아가게)
        $(document).on("dblclick", ".editable", function() { //editable 클래스를 더블클릭했을때 함수실행
        	initValue=$(this).text(); //원래 있던 값을 value로 해서 input에 텍스트로 보여줘
            var input="<input type='text' class='input-data' value='"+initValue+"' class='form-control' id='focus' style='width: 45px;'>";
            $(this).removeClass("editable")
            $(this).html(input);
            $('#focus').focus();
            
            $(".input-data").keypress(function(e) { //위의 해당 input-data 클래스의 키눌렀을떄 함수 실행
                var key=e.which;
            
                if(key==13) { //13은 enter키를 의미.테이블이 click을 받아 active 상태가 됐을때 enter눌러주면 그 값을 가지고 td로 
                    var value=$(this).val();
                    var td=$(this).parent("td");
                    td.html(value);
                    td.addClass("editable"); 
                
                    // 테이블의 Row 클릭시 값 가져오기
    	            $(".list tr").keypress(function(){    
    	
    		            const str = ""
    		            const tdArr = new Array(); // 배열 선언
    		             
    		             // 현재 클릭된 Row(<tr>)
    		            const tr = $(this);
    		            const tdd = tr.children();
    		             
    		             // tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
    		             console.log("클릭한 Row의 모든 데이터 : "+tr.text());
    		             
    		             // 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
    		             tdd.each(function(i){
	    		             tdArr.push(tdd.eq(i).text());
    		             });
    		             
    		             console.log("배열에 담긴 값 : "+tdArr);
    		             
    		             // td.eq(index)를 통해 값을 가져올 수도 있다.
    		             buyerCd = tdd.eq(2).text();
    		             productCd = tdd.eq(4).text();
    		             price = tdd.eq(6).text();
    		             startDate = tdd.eq(7).text();
    		             endDate = tdd.eq(8).text();
    		             discount = tdd.eq(9).text();
    		             
		    			     	console.log(discount);
		                $.ajax({ //포스트 방식으로 아래의 주소에 데이터 전송
		    			     method: 'post', 
		    			     url: 'pricingUpdate.do', 
		    			     traditional: true,
		    			     data: { //서버로 데이터를 전송할때  키와 벨류로 전달. BuyerController로 buyer객체에 담겨서 보내짐
		    			    	 buyerCd: buyerCd,
		    			    	 productCd: productCd,
		    			    	 price: price,
		    			    	 startDate: startDate,
		    			    	 endDate: endDate,
		    			    	 discount: discount
		    			     },
		    			     success: function (result) { //성공했을떄 호출할 콜백을 지정 
		    			    	 console.log(result);
		    			        if (result) {
		    			        	callView('pricingList.do');
		    						alert("수정성공");
		    			        } else {
		    			        	alert("수정실패");
		    			        }
		    				}
		    		   	});
    	            });
               	}
            });
        });

        $(document).on("blur", ".input-data", function() { //그 칸에서 포커스out 되면 발생하는 함수
            
            var td=$(this).parent("td"); // 해당 td를 td에 저장
            $(this).remove();
            td.html(initValue);
            td.addClass("editable")
            });
   });
	
 	</script>
 	</html>