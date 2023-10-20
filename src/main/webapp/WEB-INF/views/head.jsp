<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<meta name="viewport" content="width=device-width, initialscale=1">
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<script src="${path}/resources/js/jquery.js"></script>
<link rel="stylesheet" href="${path }/resources/icofont/icofont.min.css">
<link rel="stylesheet"
	href="${path }/resources/icofont2/icofont.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/icofont/icofont.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

<style>
.table th {
	background-color: green;
	color: white;
	text-align: center;
	font-weight: bold;
	vertical-align: middle;
}

td {
	text-align: center;
}

.err {
	color: red;
	font-weight: bold;
}
</style>