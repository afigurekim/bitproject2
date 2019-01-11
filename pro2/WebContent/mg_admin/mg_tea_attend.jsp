<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<!-- CSH
		<< 강사 메뉴 >>
		 
		출석 관리	mg_tea_attend.jsp
		성적 관리	mg_tea_score.jsp
		온라인상담	mg_tea_consult.jsp (보류)
	-->
	
<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>관리자 - 강사</title>

	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&amp;subset=korean" rel="stylesheet">
	<link rel="stylesheet" style="text/css" href="css/main.css" />
	<link rel="stylesheet" style="text/css" href="css/join.css" />

	<style>

	</style>
	
	<script type="text/javascript" src="./js/jquery-1.12.4.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#menu>ul>li').mouseover(function() {
				$(this).children('ol').stop().slideDown(100);
			}).mouseout(function() {
				$(this).children('ol').stop().slideUp(100);
			});
		});

	</script>
</head>

<body>

	<%@ include file="../template/header.jspf" %>

	<div id="divi">
		<div id="left">
			<div id="h">강사</div>

			<div id="pre"><a href="mg_attend.bit">출석 관리</a></div>
			<div id="pre"><a href="mg_score.bit">성적 관리</a></div>
			<!-- <div id="pre"><a href="#">온라인상담</a></div> -->
		</div>

		<div id="right">

			<h1>[ 출석 관리 ]</h1>

		</div>
	</div>

	<%@ include file="../template/footer.jspf" %>

</body>

</html>
