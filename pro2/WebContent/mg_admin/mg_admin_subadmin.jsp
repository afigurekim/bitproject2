<%@page import="com.bit.pro2.model.ProgramDto"%>
<%@page import="com.bit.pro2.model.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<!-- CSH
		 << 관리자 메뉴 >>
		 
		회원 승인	mg_admin_admission.jsp
		강의 관리	mg_admin_subadmin.jsp
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
		table{
			width: 600px;
			border-collapse: collapse;
			text-align: center;
			line-height: 28px;
		}
		table th, table td{
			border: 1px solid black;
		}
		table th{
			background-color: rgb(180,180,180);
		}
		table tr:HOVER{
			background-color: rgb(220,220,220);
		}
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
<%
	ArrayList<ProgramDto> list=(ArrayList<ProgramDto>)request.getAttribute("sublist");
%>
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

			<h1>[ 강의 관리 ]</h1>
			<form action="#" method="post">
				<table>
					<tr>
						<th>과정명</th>
						<th>강사</th>
						<th>강의실</th>
						<th>시작일</th>
						<th>종료일</th>
						<th>인원</th>
					</tr>
					<%
					for(int i=0; i<list.size(); i++){
						ProgramDto bean=list.get(i);
					%>
					<tr>
						<td><%= bean.getProgname()%></td>
						<td><%= bean.getProgteach() %></td>
						<td><%= bean.getProgroom() %></td>
						<td><%= bean.getDatestart() %></td>
						<td><%= bean.getDateend() %></td>
						<td><%= bean.getProgsize() %></td>
					</tr>
					<%} %>
				</table>
			</form>
			<div>
				<form action="mg_subcreate.bit" method="get">
					<br/>
					<button type="submit">강좌개설</button>
				</form>
			</div>
		</div>
	</div>

	<%@ include file="../template/footer.jspf" %>

</body>

</html>
