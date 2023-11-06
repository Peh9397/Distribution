<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.header {
	padding-top: 35px;
	vertical-align: middle;
	text-align: right;
}

.logoutdiv {
	font-size: 15px;
	font-weight: bold;
	color: #44444c;
}

.logout {
	width: 100px;
	background-color : #1b1b1b;
	border-radius: 7px;
	padding: 4px 16px;
	background-color: #1b1b1b;	
}

#logout {
	color: #ffffff;
	text-decoration: none;
}
</style>

</head>
<body>
	<div class="container">
		<div class="header" style=" align-items: right;">
			<span class="logoutdiv">
				<c:if test="${sessionScope.EMPCD != null }">
				${sessionScope.ENAME }( ${sessionScope.EMPCD } )
				<span class="logout">
						<a href="${path }/logout.do" id="logout">로그아웃</a>
					</span>
				</c:if>
			</span>
		</div>
	</div>
</body>
</html>