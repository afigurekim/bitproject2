<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Page</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&amp;subset=korean" rel="stylesheet">
<link rel="stylesheet" style="text/css" href="css/main.css"/>
<link rel="stylesheet" style="text/css" href="css/mypage.css"/>
<style></style>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
</head>
<body>
	<%@ include file="template/header.jspf" %>

	<%@ include file="template/mypage.jspf" %>
	
	<p><strong><!-- 여기에 ID 또는 이름 -->님 로그인을 환영합니다!</strong></p>
	
	<p><strong>출석</strong></p>
		<form action="#">
			<input type="button" value="입실" />
			<input type="button" value="퇴실" />
		</form>
	<%@ include file="template/footer.jspf" %>
</body>
</html>