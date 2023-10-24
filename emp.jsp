<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<div id="container">
	<h1 class="menuName">직원 관리</h1>
	<div id="searchBox">
		<div class="searchInBox">
			<form name="searchBoxx">
				<input type="hidden" name="SORTEMPCD" value="${employee.SORTEMPCD }">
				<input type="hidden" name="SORTENAME" value="${employee.SORTENAME }">
				<input type="hidden" name="SORTJOB" value="${employee.SORTJOB }">
				<input type="hidden" name="SORTTEL" value="${employee.SORTTEL }">
				<input type="hidden" name="SORTDEPT" value="${employee.SORTDEPT }">
				<input type="hidden" name="SORTADDDATE" value="${employee.SORTADDDATE }">
				<input type="hidden" name="SORTAUTHORITY" value="${employee.SORTAUTHORITY }">
				
			
				<div class="search-sub-div">
					<div class="search-item-div">
						<div class="search-item-text">직원코드</div>
						<input type="search" name="EMPCD" value="${employee.EMPCD }">
					</div>
					<div class="search-item-div">
						<div class="search-item-text">직원명</div>
						<input type="search" name="ENAME" value="${employee.ENAME }">
					</div>
					<div class="search-item-div">
						<div class="search-item-text">등록일</div>
						<input type="date" name="ADDFROMDATE" value=${employee.ADDFROMDATE }>
						~<input type="date" name="ADDTODATE" value=${employee.ADDTODATE }>
					</div>
				</div>
				<div class="search-sub-div">
					<div class="search-item-div">
						<div class="search-item-text">직책</div>
						<input type="search" name="JOB" value="${employee.JOB }">
					</div>
					<div class="search-item-div">
						<div class="search-item-text">연락처</div>
						<input type="search" name="TEL" value="${employee.TEL }">
					</div>
					<div class="search-item-div">
						<div class="search-item-text">부서</div>
						<input type="search" name="DEPT" value="${employee.DEPT }">
					</div>
					<div class="search-item-div">
						<div class="search-item-text">승인권한</div>
						<select name="authority" class="search">
							<option value="null">모두</option>			
							<option value="Y">있음</option>
							<option value="N">없음</option>
						</select>
					</div>
				</div>
			</form>
			</div>
		</div>
		<div class="search-btn">
			<button id="searchBtn">검색</button>
			<button id="initBtn">초기화</button>
		</div>
		
		<div id="button-div">
		<button id="show" class="btn">직원 등록</button>
		<c:if test="${employee.del != 'Y'}">
			<button type="button" onclick="deleteAction()" class="btn">직원 삭제</button>
		</c:if>
		<c:if test="${employee.del == 'Y'}">
			<button type="button" onclick="restoreAction()" class="btn">직원 복원</button>
		</c:if>
		<button id="excelBtn"><img alt="" src="/distribution/resources/images/Excel.png" id="excelImg"></button>
		
		<div id="page">
			<form name="itemLimit">
				<select name="rowPerPage" id="limit">
					<option value="20" <c:if test="${employee.rowPerPage == 5 }">selected="selected"</c:if> >
						5개씩 보기
					</option>
					<option value="50" <c:if test="${employee.rowPerPage == 10 }">selected="selected"</c:if> >
						10개씩 보기
					</option>
					<option value="100" <c:if test="${employee.rowPerPage == 20 }">selected="selected"</c:if> >
						20개씩 보기
					</option>
					<option value="300" <c:if test="${employee.rowPerPage == 30 }">selected="selected"</c:if> >
						30개씩 보기
					</option>
				</select>
			</form>
		</div>
	</div>
	<div class="table" style="height: 600px;">
		<table class="list">
			<tr>
				<th class="fixed">
					<c:if test="${employee.del =='Y'}">
						<input type="checkbox" name="deletedCheckAll" id="th_deletedCheckAll">
					</c:if>
					<c:if test="${employee.del =='N' or employee.del == 'All' }">
						<input type="checkbox" name="checkAll" id="th_checkAll" class="red-check">
					</c:if>
				</th>
				<th class="fixed">순번</th>
				<th class="fixed" id="SORTEMPCD">직원코드</th>
				<th class="fixed" id="SORTENAME">직원명</th>
				<th class="fixed" id="SORTJOB">직책</th>
				<th class="fixed" id="SORTTEL">연락처</th>
				<th class="fixed" id="SORTDEPT">부서</th>
				<th class="fixed" id="SORTADDDATE">등록일</th>
				<th class="fixed" id="SORTAUTHORITY">승인권한</th>
				<th class="fixed">상태변경일</th>
			</tr>
			<c:forEach var="emp" items="${empList }">			
				<tr class="itemRow"
					<c:if test="${emp.del =='Y'}">style="background-color: #44444C;"</c:if>
				>
					<td>
						<c:if test="${emp.del =='Y'}">
							<input type="checkbox" name="deletedRow" value="${emp.EMPCD }" class="excel">
						</c:if>
						<c:if test="${emp.del =='N'}">
							<input type="checkbox" name="checkRow" value="${emp.EMPCD }" class="red-check excel">
						</c:if>
					</td>
					<td>${emp.rn }</td>
					<td>${emp.EMPCD }</td>
					<td class="editable">${emp.ENAME }</td>
					<td class="editable">${emp.JOB }</td>
					<td class="editable">${emp.TEL }</td>
					<td class="editable">${emp.DEPT }</td>
					<td>${emp.ADDDATE }</td>
					<td class="editable">${emp.AUTHORITY }</td>
					<c:if test="${emp.del == 'N'}">
							<c:if test="${emp.STATEDATE == null}">
								<td>${emp.STATEDATE }</td>
							</c:if>	
							<c:if test="${emp.STATEDATE != null}">
								<td>${emp.STATEDATE } (수정)</td>
							</c:if>	
						</c:if>
						<c:if test="${emp.del == 'Y'}">
							<td>${emp.STATEDATE } (삭제)</td>
						</c:if>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<div id="pageBtn">
		<form name="paging">
			<c:if test="${employee.currentPage != 1}">
				<div id="prev" class="paging-btn">◀</div>
			</c:if>
		 	<input type="number" name="currentPage" value="${employee.currentPage }" id="currentPage"> / ${employee.totalPage }
			<c:if test="${employee.currentPage != employee.totalPage}">
				<div id="next" class="paging-btn">▶</div>
			</c:if>
		</form>
	</div>
	
	<!-- 등록 창 팝업 -->
	<div class="background">
		<div class="window">
			<div class="popup" align="center">
				<button id="close">X</button>
				<form action="" name="frm">
				<br><h1 class="addSub"> 직원등록 </h1><br>
					<table id="insert-form">
						<tr>
							<th>부서</th>
							<td>
								<select name="DEPT" id="DEPT"  class="search">
									<option value=""></option>
									<option value="영업">영업</option>
									<option value="물류">물류</option>
									<option value="직원">직원										
								</select>
							</td>
						</tr>
						<tr>
							<th>직원코드</th>
							<td><input type="text" name="EMPCD" class="readonly" readonly="readonly"></td>
						</tr>
						<tr>
							<th>암호</th>
							<td><input type="PASSWORD" name="PASSWORD"></td>
						</tr>
						<tr>
							<th>직원명</th>
							<td><input type="text" name="ENAME"></td>
						</tr>
						<tr>
							<th>승인권한</th>
							<td>
								<select name="AUTHORITY" class="search">
									<option value=""></option>
									<option value="N">없음</option>
									<option value="Y">있음</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>직책</th>
							<td>
								<select name="JOB"  class="search">
									<option value=""></option>
									<option>사원
									<option>대리									
									<option>과장									
									<option>차장									
									<option>부장
									<option>사장
								</select>
							</td>
						</tr>
					</table>
				</form>
				<div class="insert-btn">
					<button id="addEmp" class="btn">등록</button>
				</div>
				
				
			</div>
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
	
	// 	검색초기화
	document.querySelector("#initBtn").addEventListener("click",  function(){callView('emp.do')});
</script>

<script type="text/javascript">
	function addEmp() {
		const EMPCD = frm.EMPCD.value;
		const ENAME = frm.ENAME.value;
		const PASSWORD = frm.PASSWORD.value;
		const JOB = frm.JOB.value;
		const TEL = frm.TEL.value;
		const DEPT = frm.DEPT.value;
 		const AUTHORITY = frm.AUTHORITY.value;
		
		if (EMPCD == '' || ENAME == '' || PASSWORD == '' || JOB == '' || 
				TEL == '' || DEPT == '' || AUTHORITY == ''){
			alert('값을 입력해주세요.');
			if (EMPCD == '') {
				$("input[name='EMPCD']").addClass('red');
			} else {
 			    $("input[name='EMPCD']").removeClass('red');		
			}
			if (ENAME == '') {
				$("input[name='ENAME']").addClass('red');
			} else {
 			    $("input[name='ENAME']").removeClass('red');		
			}
			if (PASSWORD == '') {
				$("input[name='PASSWORD']").addClass('red');
			} else {
 			    $("input[name='PASSWORD']").removeClass('red');		
			}
			if (JOB == '') {
				$("select[name='JOB']").addClass('red');
			} else {
 			    $("select[name='JOB']").removeClass('red');		
			}
			if (TEL == '') {
				$("select[name='TEL']").addClass('red');
			} else {
 			    $("select[name='TEL']").removeClass('red');		
			}
			if (DEPT == '') {
				$("select[name='DEPT']").addClass('red');
			} else {
 			    $("select[name='DEPT']").removeClass('red');		
			}
			if (AUTHORITY == '') {
				$("select[name='AUTHORITY']").addClass('red');
			} else {
 			    $("select[name='AUTHORITY']").removeClass('red');		
			}
		} else {
			$.ajax({
			     method: 'post',
			     url: 'empInsert.do',
			     traditional: true,
			     data: {
			    	 EMPCD : frm.EMPCD.value,
			    	 ENAME : frm.ENAME.value,
			    	 PASSWORD : frm.PASSWORD.value,
			    	 JOB : frm.JOB.value,
			    	 TEL : frm.TEL.value,
			    	 DEPT : frm.DEPT.value,
			    	 AUTHORITY : frm.AUTHORITY.value		    	 
			     },
			     dataType: 'json',
			     success: function (result) {
			        if (result) {
						callView('emp.do');
			        } else {
			        	alert("실패");
			        }
				}
		   });
		}	
	}
	
	document.querySelector("#addEmp").addEventListener("click", addEmp);
</script>

<!-- 검색용 -->
<script type="text/javascript">
	function search() {
				
		const keyword = {
				EMPCD : searchBoxx.EMPCD.value,	
				ENAME : searchBoxx.ENAME.value,	
				JOB : searchBoxx.JOB.value,
				TEL : searchBoxx.TEL.value,
				DEPT : searchBoxx.DEPT.value,	
				ADDFROMDATE : searchBoxx.ADDFROMDATE.value,	
				ADDTODATE : searchBoxx.ADDTODATE.value,	
				AUTHORITY : searchBoxx.AUTHORITY.value,
				del : searchBoxx.del.value,
				
				SORTEMPCD : searchBoxx.SORTEMPCD.value,
				SORTENAME : searchBoxx.SORTENAME.value,
				SORTJOB : searchBoxx.SORTJOB.value,
				SORTTEL : searchBoxx.SORTTEL.value,
				SORTDEPT : searchBoxx.SORTDEPT.value,
				SORTADDDATE : searchBoxx.SORTADDDATE.value,
				SORTAUTHORITY : searchBoxx.SORTAUTHORITY.value,
				
				rowPerPage : itemLimit.rowPerPage.value,
				
				currentPage : paging.currentPage.value
		}
		console.log(keyword);
		
		$.ajax({
		     method: 'post',
		     url: 'empSearch.do',
		     traditional: true,
		     data: {
		    	keyword: JSON.stringify(keyword)
		     },
		     success: function (result) {
		    	 $('#content').children().remove();
				 $('#content').html(result);
			 }
	   });

	};

document.querySelector("#searchBtn").addEventListener("click", search);
</script>

<!-- 테이블 요소 더블클릭 하면 수정 가능 input으로 변경 -->
<script type="text/javascript">
$(document).ready(function() {
	
	let initValue=""; //초기에 있던 값을 전역변수로 선언(수정하다가 커서가 다른곳 클릭하면 원래값으로 돌아가게). 새로불러오면서 다시 설정하므로 변수 설정위치도 중요
	
    $(document).on("dblclick", ".editable", function() { //editable 클래스를 더블클릭했을때 함수실행
     	 initValue=$(this).text(); //원래 있던 값을 value로 해서 input에 텍스트로 보여줘
         var input="<input type='text' class='input-data' value='"+initValue+"' class='form-control' id='focus' style='width: 45px;'>";
         $(this).removeClass("editable")
         $(this).html(input);
         $('#focus').focus();
         
         $(".input-data").keypress(function(e) { //위의 해당 input-data 클래스의 키눌렀을떄 함수 실행
             var key=e.which;
         
             if(key==13) { //13은 enter키를 의미.테이블이 click을 받아 active 상태가 됐을때 enter눌러주면 그 값을 가지고 td로 
                 var value=$(this).val(); // 새로 입력한 값을 value에 
                 var td=$(this).parent("td"); 
                 td.html(value);
                 td.addClass("editable");
             
                 // 테이블의 Row 클릭시 값 가져오기
 	            $("#list tr").keypress(function(){    
 	
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
 		             EMPCD = tdd.eq(2).text();
 		             ENAME = tdd.eq(3).text();
 		             JOB   = tdd.eq(4).text();
 		             TEL   = tdd.eq(5).text();
 		       	     DEPT  = tdd.eq(6).text();
 		     	     AUTHORITY = tdd.eq(7).text();
 	             
               $.ajax({ //포스트 방식으로 아래의 주소에 데이터 전송
   			     method: 'post', 
   			     url: 'empUpdate.do', 
   			     traditional: true,
   			     data: { //서버로 데이터를 전송할때  키와 벨류로 전달. BuyerController로 buyer객체에 담겨서 보내짐
   			    	EMPCD: EMPCD,
   			    	ENAME: ENAME,
   			    	JOB: JOB,
   			    	TEL: TEL,
   			    	DEPT: DEPT,
   			    	AUTHORITY: AUTHORITY
   			     },
   			     success: function (result) { //성공했을떄 호출할 콜백을 지정
   			    	 console.log(result);
   			        if (result) {
   						alert("수정성공");
   						search(); // 수정후에도 검색된 페이지 유지하게
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
         alert(initValue);
         var td=$(this).parent("td"); // 해당 td를 td에 저장
         $(this).remove();
         td.html(initValue);
         td.addClass("editable")
         });
});
</script>

<!-- 페이지 버튼 / 페이지 당 요소 갯수 -->
<script type="text/javascript">
	$('#prev').on('click', function() {
		paging.currentPage.value--;
		if (paging.currentPage.value < 1) {
			paging.currentPage.value = 1;
		}
		search();
	});
	$('#next').on('click', function() {
		paging.currentPage.value++;
		
		if (paging.currentPage.value > ${employee.totalPage }) {
			paging.currentPage.value = ${employee.totalPage };
		}
		search();
	});
	
	$('#limit').on('change', function() {
		paging.currentPage.value=1;
		search();
	});
	
	$('#currentPage').keydown(function(key) {
		if(key.keyCode == 13) {
			key.preventDefault();			
			
			if (paging.currentPage.value < 1) {
				paging.currentPage.value = 1;
			}
			
			if (paging.currentPage.value > ${employee.totalPage }) {
				paging.currentPage.value = ${employee.totalPage }; // 오류
			}
			
			search();
		}
	});
</script>

<!-- 정렬 -->
<script type="text/javascript">
	function initSort() {
		searchBoxx.SORTEMPCD.value = 0;
		searchBoxx.SORTENAME.value = 0;
		searchBoxx.SORTJOB.value = 0;
		searchBoxx.SORTTEL.value = 0;
		searchBoxx.SORTDEPT.value = 0;
		searchBoxx.SORTADDDATE.value = 0;
		searchBoxx.SORTAUTHORITY.value = 0;
	}

	$('#SORTEMPCD').on('click', function() {
		if (searchBoxx.SORTEMPCD.value == 0 || searchBoxx.SORTEMPCD.value == 2) {
			initSort();
			searchBoxx.SORTEMPCD.value = 1;			
		} else if (searchBoxx.SORTEMPCD.value == 1) {
			initSort();
			searchBoxx.SORTEMPCD.value = 2;
		}		
		search();
	});
	$('#SORTJOB').on('click', function() {
		if (searchBoxx.SORTJOB.value == 0 || searchBoxx.SORTJOB.value == 2) {
			initSort();
			searchBoxx.SORTJOB.value = 1;			
		} else if (searchBoxx.SORTJOB.value == 1) {
			initSort();
			searchBoxx.SORTJOB.value = 2;
		}		
		search();
	});
	$('#SORTTEL').on('click', function() {
		if (searchBoxx.SORTTEL.value == 0 || searchBoxx.SORTTEL.value == 2) {
			initSort();
			searchBoxx.SORTTEL.value = 1;			
		} else if (searchBoxx.SORTTEL.value == 1) {
			initSort();
			searchBoxx.SORTTEL.value = 2;
		}		
		search();
	});
	$('#SORTENAME').on('click', function() {
		if (searchBoxx.SORTENAME.value == 0 || searchBoxx.SORTENAME.value == 2) {
			initSort();
			searchBoxx.SORTENAME.value = 1;		
		} else if (searchBoxx.SORTENAME.value == 1) {
			initSort();
			searchBoxx.SORTENAME.value = 2;
		}		
		search();
	});
	$('#SORTDEPT').on('click', function() {
		if (searchBoxx.SORTDEPT.value == 0 || searchBoxx.SORTDEPT.value == 2) {
			initSort();
			searchBoxx.SORTDEPT.value = 1;			
		} else if (searchBoxx.SORTDEPT.value == 1) {
			initSort();
			searchBoxx.SORTDEPT.value = 2;
		}		
		search();
	});
	$('#SORTADDDATE').on('click', function() {
		if (searchBoxx.SORTADDDATE.value == 0 || searchBoxx.SORTADDDATE.value == 2) {
			initSort();
			searchBoxx.SORTADDDATE.value = 1;			
		} else if (searchBoxx.SORTADDDATE.value == 1) {
			initSort();
			searchBoxx.SORTADDDATE.value = 2;
		}		
		search();
	});
	$('#SORTAUTHORITY').on('click', function() {
		if (searchBoxx.SORTAUTHORITY.value == 0 || searchBoxx.SORTAUTHORITY.value == 2) {
			initSort();
			searchBoxx.SORTAUTHORITY.value = 1;			
		} else if (searchBoxx.SORTAUTHORITY.value == 1) {
			initSort();
			searchBoxx.SORTAUTHORITY.value = 2;
		}		
		search();
	});
</script>

<!-- 전체 선택 / 삭제  -->
<c:if test="${employee.del =='N' or employee.del == 'All' }">
	<script type="text/javascript">
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
	
	function deleteAction(){
		  var checkRow = new Array();
		  $( "input[name='checkRow']:checked" ).each (function (){
		    checkRow.push($(this).val()) ;
		  });
		  
		  if(checkRow == ''){
		    alert("삭제할 대상을 선택하세요.");
		    return false;
		  }
		  $.ajax({
			    url : "employeeDelete.do",
			    type : "post",
			    traditional : true,
			    data : { checkRows : checkRow },
			    
			    success : function(result){
			    	if(result){
			    		alert("삭제완료");
			    		search();
			    		
			    	}else
			    		alert("삭제실패");
			    }
		  });
	};
</script>

<!-- 삭제 항목 복원  -->
<c:if test="${employee.del =='Y'}">
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
		    url : "employeeRestore.do",
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
	$('#department').on("change", function() {
		let count = 0;
		$.ajax({
		     method: 'post', 
		     url: 'getSALCount.do', 
		     traditional: true,
		     async: false,
		     data: {
		    	 DEPT: frm.DEPT.value
		     },
		     success: function (result) {
		    	 count = result;
		    	 console.log(count);
			}
	   	});
		if (frm.DEPT.value == '영업'){
			console.log('SAL' + count);
			frm.EMPCD.value = 'SAL' + count;
		}
		if (frm.DEPT.value == '관리'){
			console.log('MNG' + count);
			frm.EMPCD.value = 'MNG' + count;
		}
	});
</script>

<script>
	function excel() {
		
		let checkRow = new Array();
		
		$( ".excel:checked" ).each (function (){
			 let thisRow = $(this).closest('tr');
			  
			 const item = {
					 EMPCD : thisRow.find('td:eq(0)').find('input').val()
			 }

			 checkRow.push(item);
		
		});
		
		  
		 console.log(checkRow);
		 
		 J300.ajax({
			  url : 'empExcelDown.do',
			  method : 'post',
			  traditional : true,
			  data : {
				  items : JSON.stringify(checkRow)
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
	
	
</script>

<!-- 스모셀렉트 -->
<script type="text/javascript">
$(document).ready(function() {
	$('.sumo').SumoSelect({
		search: true,
		searchText: '검색어 입력',
	});
	$('select.AUTHORITY')[0].sumo.selectItem("${buyer.AUTHORITY }");
	
	$('select.JOB')[0].sumo.selectItem("${buyer.JOB }");
	
	$('select.TEL')[0].sumo.selectItem("${buyer.TEL }");
	
	$('select.DEPT')[0].sumo.selectItem("${buyer.DEPT }");
	

	
});
</script>

<!-- 날짜 최소 / 최대 제한 주기 -->
<script type="text/javascript">
	$('input[name="ADDFROMDATE"]').on('change', function(){
		const minDate= $(this).val();
		$('input[name="ADDTODATE"]').attr('min',minDate);
	});
	$('input[name="ADDTODATE"]').on('change', function(){
		const maxDate= $(this).val();
		$('input[name="ADDFROMDATE"]').attr('max',maxDate);
	});
</script>
</html>