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
						<input type="hidden" name="sortBuyerCd" value="${pricing.buyerCd }">
						<input type="hidden" name="sortBname" value="${pricing.bname }">
						<input type="hidden" name="sortProductCd" value="${pricing.productCd }">
						<input type="hidden" name="sortPname" value="${pricing.pname }">
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
			<div id="page" align="right" style="margin-bottom: 10px;">
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
					<button id="show" class="btn">등록</button>
					<c:if test="${pricing.del != 'Y'}">
						<button type="button" onclick="deleteAction()" class="btn">삭제</button>
					</c:if>
					<button class="edit-start-btn" onclick="editStart()" style="display: block;">수정하기</button>
					<button class="edit-end-btn" onclick="editEnd()" style="display: none;">수정완료</button>
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
			$('#content').children().remove();
			$('#content').html(data);
		});
	}
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
			sortStartDate : searchBoxx.sortStartdate.value,
			sortEndDate : searchBoxx.sortEnddate.value,
			sortDiscount : searchBoxx.sortDiscount.value,
			sortFinalPrice : searchBoxx.sortFinalPrice.value,
			sortAddDate : searchBoxx.sortAdddate.value,
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
		    	 $('#content').children().remove();
				 $('#content').html(result);
			 },
			 error: function () {
				 alert('실패');
			 }
	   });

	};

	document.querySelector("#searchBtn").addEventListener("click", search);
	
	
	
	//	검색초기화
	document.querySelector("#initBtn").addEventListener("click",  function(){callView('pricingList.do')});
		
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
				startdate : thisRow.find('td:eq(7)').find('input').val(),
				enddate : thisRow.find('td:eq(8)').find('input').val()
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
                    a.attr("download", "test.xlsx");
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
	
	// 수정 
	function readOnlyOff() {
		$(".readonly").attr("disabled", false);
	}
	
	function readOnlyOn() {
		$(".readonly").attr("disabled", true);
	}
	
 	var editable = 0;
	
 	function editStart() {
 		document.querySelector('.edit-start-btn').style.display = 'none';
 		document.querySelector('.edit-finish-btn').style.display = 'block';
 		$('.priceList-div').css('background-color', '#d3dfea');
 		editable = 1;
 		readOnlyOff();
 		console.log(editable);
 	}
	
 	function editFinish() {
 		document.querySelector('.edit-start-btn').style.display = 'block';
 		document.querySelector('.edit-finish-btn').style.display = 'none';
 		$('.priceList-div').css('background-color', '#fff');
 		editable = 0;
 		readOnlyOn();
 		console.log(editable);
 	}
 	
	var previousValue = "";
	
</script>
</html>