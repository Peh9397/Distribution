<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<link rel="stylesheet" href="${path }/resources/icofont/icofont.min.css">
<link rel="stylesheet"
	href="${path }/resources/icofont2/icofont.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>

<style type="text/css">
.menuContainer {
	align-self: center;
	height: 100%;
}

.menuNm {
	color: #bfbfbf;
	text-align: left;
	width: 70%;
	cursor: pointer;
	margin-top: 20px;
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
	height: 25px;
}
</style>

</head>
<body>
	<div class="menuContainer">
		<div id="logo">
			<img style="width: 200px;"
				src="${path }/resources/images/distribution.png">
		</div>
		<div class="menuNm" onclick="/">
			<i class="icofont-package"></i> 상품 관리
		</div>
		<div class="menuNm" onclick="/">
			<i class="icofont-price"></i> 판매가 관리
		</div>
		<div class="menuNm" onclick="/">
			<img id="icon"
				src="/distribution/resources/images/handshake-deal.svg"> <i
				class="icofont-handshake-deal"></i> 구매자 관리
		</div>
		<div class="menuNm" onclick="/">
			<img id="icon" src="/distribution/resources/images/clip-board.svg">
			<i class="icofont-clip-board"></i> <i class="icofont-tasks"></i> 주문
			관리
		</div>
		<div class="menuNm" onclick="/">
			<img id="icon"
				src="/distribution/resources/images/chart-arrows-axis.svg"> <i
				class="icofont-chart-arrows-axis"></i> 주문 현황
		</div>
		<c:if test="${sessionScope.job == '팀장' }">
			<div class="menuNm" onclick="/">
				<i class="icofont-checked"></i> 주문 승인
			</div>
		</c:if>
		<div class="menuNm" onclick="${path }/nolay/emp.do">
			<i class="icofont-group"></i> 직원
		</div>
	</div>
</body>
</html>