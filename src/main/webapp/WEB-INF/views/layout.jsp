<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:insertAttribute name="title"></tiles:insertAttribute></title>

<script type="text/javascript" src="distribution/resources/js/jquery.js"></script>

<style type="text/css">
#layoutMenu {
	width: 200px;
	height: 100%;
	background-color: #44444c;
	position: fixed;
}

#layoutHeader {
	height: 100px;
	background-color: #e5e5e5;
}

#layoutFooter {
	height: 50px;
	background-color: #e5e5e5;
}
</style>

</head>
<body style="margin: 0;">
	<div>
		<div id="layoutMenu">
			<tiles:insertAttribute name="menu"></tiles:insertAttribute>
		</div>
		<div style="margin-left: 200px;">
			<div id="layoutHeader">
				<tiles:insertAttribute name="header"></tiles:insertAttribute>
			</div>
			<div id="layoutBody">
				<tiles:insertAttribute name="body"></tiles:insertAttribute>
			</div>
			<div id="layoutFooter">
				<tiles:insertAttribute name="footer"></tiles:insertAttribute>
			</div>
		</div>
	</div>
</body>
</html>