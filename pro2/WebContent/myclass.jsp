<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수강신청</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&amp;subset=korean" rel="stylesheet">
<link rel="stylesheet" style="text/css" href="css/main.css"/>
<link rel="stylesheet" style="text/css" href="css/mypage.css"/>
<style></style>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
</head>
<body>
	<%@ include file="template/header.jspf" %>

	<%@ include file="template/mypage.jspf" %>
	
	<p><strong>수강신청</strong></p>
	
	<form action="#">
		과정
		<select>
			<option value="ban1">1반 과정명</option>
			<option value="ban2">2반 과정명</option>
			<option value="ban3">3반 과정명</option>
		</select><br />
		교육기간
		<select>
			<option value="date1">2019-01-01 ~ 2019-03-31</option>
			<option value="date2">2019-02-01 ~ 2019-04-30</option>
			<option value="date3">2019-03-01 ~ 2019-05-31</option>
		</select><br />
		<input type="submit" value="신청"/>
	</form>
	<%@ include file="template/footer.jspf" %>
</body>
</html>