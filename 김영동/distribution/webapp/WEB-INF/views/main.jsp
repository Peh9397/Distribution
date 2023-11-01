<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ include file="head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	#lastList {
		margin-top: 50px;
		display: flex;
		flex-direction: column;
	}
	
	.approvalTitle {
		width: 80%;
		height: 300px;
		border-bottom: 1px solid #bfbfbf;
		cursor: pointer;
		margin: 20px;
	}
	
	.approvalList {
		width: 80%;
		border-bottom: 2px solid #bfbfbf;
	}
	
	.productTiTle {
		width: 50%;
		height: 300px;
		border-bottom: 1px solid #bfbfbf;
		cursor: pointer;
		margin: 20px;
	}
	
	.productList {
		width: 50%;
		border-bottom: 2px solid #bfbfbf;
	}
	
	.pricingTitle {
		width: 50%;
		height: 300px;
		border-bottom: 1px solid #bfbfbf;
		cursor: pointer;
		margin: 20px;
	}
	
	.pricingList {
		width: 50%;
		border-bottom: 2px solid #bfbfbf;
	}
</style>

</head>
<body>
	<div class="container">
		<div id="lastList">
			<div class="approvalTitle" style="font-weight: bold">승인대기목록
				<div class="approvalList"></div>
			</div>
			<!-- <div class="order">주문 목록</div> -->
			<div class="productTiTle" style="font-weight: bold">제품 최근 목록
				<div class="productList"></div>
			</div>
			<div class="pricingTitle" style="font-weight: bold">판매가 최근 목록
				<div class="pricingList"></div>
			</div>
		</div>
	</div>
</body>
</html>