<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.menuContainer {
	height: 100%;
}

.menuNm {
	color: #bfbfbf;
	text-align: left;
	width: 75%;
	cursor: pointer;
	margin-top: 20px;
	margin-left: 10px;
	font-size: 17px;
	font-weight: bold;
}

.menuNm:hover {
	color: #1b1b1b;
}

#logo {
	margin-top: 40px;
	margin-bottom: 30px;
}

#icon {
	height: 25px;
	color: #bfbfbf;
}

i {
	height: 30%;
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
	<div class="menuContainer">
		<div id="logo">
			<a href="${path }/main.do">
				<img style="width: 200px;" src="${path }/resources/images/distribution.png">
			</a>
		</div>
		<div class="container">
			<div class="menuNm" onclick="content('productList.do')">
				<i class="icofont-package icofont-md"></i> 상품 관리
			</div>
			<div class="menuNm" onclick="content('pricingList.do')">
				<i class="icofont-price icofont-md"></i> 판매가 관리
			</div>
			<div class="menuNm" onclick="content('buyer.do')">
				<i class="icofont-briefcase-1 icofont-md"></i> 구매자 관리
			</div>
			<div class="menuNm" onclick="content('orderList.do')">
				<i class="icofont-clip-board icofont-md icofont-md"></i>
				<i class="icofont-tasks icofont-md"></i> 주문 관리
			</div>
			<div class="menuNm" onclick="content('/')">
				<i class="icofont-presentation icofont-md"></i> 주문 현황
			</div>
			<c:if test="${sessionScope.JOB == '마스터' }">
				<div class="menuNm" onclick="content('/')">
					<i class="icofont-checked icofont-md"></i> 주문 승인
				</div>
			</c:if>
			<div class="menuNm" onclick="content('emp.do')">
				<i class="icofont-id-card icofont-md"></i> 직원
			</div>
		</div>
	</div>
</body>
</html>