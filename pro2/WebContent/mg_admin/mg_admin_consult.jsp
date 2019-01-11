<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<!-- CSH
		 << 관리자 메뉴 >>
		 
		회원 승인	mg_admin_admission.jsp
		강의 개설	mg_admin_subcreate.jsp
		온라인상담	mg_admin_consult.jsp
		출석 관리	mg_admin_attend.jsp (보류)
		성적확인/수정	mg_admin_score.jsp (보류)
		광고 등록	 mg_admin_advert.jsp (보류) 
	-->
	
<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>관리자 - admin</title>

	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&amp;subset=korean" rel="stylesheet">
	<link rel="stylesheet" style="text/css" href="css/main.css" />
	<link rel="stylesheet" style="text/css" href="css/join.css" />

	<style>

	</style>
	
	<script type="text/javascript" src="./js/jquery-1.12.4.js"></script>
	<script type="text/javascript" src="./js/jquery.bxslider.js"></script>
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
			<div id="h">관리자</div>

			<div id="pre"><a href="mg_admission.bit">회원 승인</a></div>
			<div id="pre"><a href="mg_subadmin.bit">강의 관리</a></div>
			<div id="pre"><a href="mg_consult.bit">온라인상담</a></div>
			<!-- <div id="pre"><a href="#">출석 관리</a></div> -->
			<!-- <div id="pre"><a href="#">성적확인/수정</a></div> -->
			
		</div>

		<div id="right">

			<h1>[ 온라인상담 ]</h1>

		</div>
	</div>

	<%@ include file="../template/footer.jspf" %>

</body>

</html>
