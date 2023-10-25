<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="header" style="text-align: right; margin-right: 50px;">
		<span class="eName">
			
		</span>
		<span class="logout"
			style="font-size: 15px; font-weight: bold; color: #44444c;">
			<c:if test="${sessionScope.EMPCD != null }">
				${sessionScope.ENAME }(${sessionScope.EMPCD })
				<a href="${path }/logout.do">logout</a>
			</c:if>
		</span>
	</div>

</body>
</html>