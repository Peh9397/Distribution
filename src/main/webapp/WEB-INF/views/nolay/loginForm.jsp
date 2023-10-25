<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Distribute</title>

<style type="text/css">
/* 입력창 라인 숨기기 */
input:focus {
	outline: none;
}

.login {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 96%;
}

.loginForm {
	width: 270px;
	height: 315px;
	background-color: #44444c;
}

.loginInput {
	width: 200px;
	height: 40px;
	background-color: #ffffff;
	color: #44444c;
	text-align: center;
	margin-bottom: 10px;
	border-radius: 7px;
	font-size: 14px;
	border: none;
}

.logo {
	margin-top: 45px;
	margin-bottom: 25px;
	width: 200px;
}

.loginInputBtn {
	width: 200px;
	height: 40px;
	background-color: #1b1b1b;
	color: #ffffff;
	text-align: center;
	cursor: pointer;
	border-radius: 7px;
	border: none;
}
</style>
</head>
<body>
	<div class="login">
		<div class="loginForm" align="center">
			<form action="${path }/login.do" method="post">
				<div class="loginBox">
					<img src="${path }/resources/images/distribution.png" class="logo">
					<div>
						<input class="loginInput" type="text" name="EMPCD"
							required="required" autofocus="autofocus" placeholder="직원코드">
					</div>
					<div>
						<input class="loginInput" type="password" name="PASSWORD"
							required="required" placeholder="비밀번호">
					</div>
					<div>
						<input class="loginInputBtn" id="loginBtn" type="submit"
							value="로그인">
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="footer" style="background-color: #e5e5e5; height: 38px;">
		<div style="font-size: 12px; color: #44444c; text-align: center;">
			Copyright@ 2023 Distribution. All Rights Reserved.
		</div>
	</div>
</body>
</html>