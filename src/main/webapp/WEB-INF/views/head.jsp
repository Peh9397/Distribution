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
<link rel="stylesheet" href="${path }/resources/icofont2/icofont.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${path}/resources/icofont/icofont.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery.sumoselect/3.1.6/sumoselect.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.sumoselect/3.1.6/jquery.sumoselect.min.js"></script>


<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">
	var J300 =  $.noConflict(true);	
</script>
 <meta http-equiv="X-UA-Compatible" content="IE=edge">

<style>
body {
	font-family: 'NotoSansKR';
}

table {
	width: 85%;
}

.table th {
	background-color: #44444c;
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