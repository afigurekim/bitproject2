<%@page import="com.bit.pro2.model.MemberDto"%>
<%@page import="com.bit.pro2.model.ExamDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<!-- CSH
		<< 강사 메뉴 >>
		 
		출석 관리	mg_tea_attend.jsp
		성적 관리	mg_tea_scoremain.jsp
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
	ArrayList<ExamDto> examlist=(ArrayList<ExamDto>)request.getAttribute("examlist");
	ArrayList<MemberDto> teacherlist=(ArrayList<MemberDto>)request.getAttribute("teacherlist");
%>
<body>

	<%@ include file="../template/header.jspf" %>

	<div id="divi">
		<div id="left">
			<div id="h">강사</div>

			<div id="pre"><a href="mg_attend.bit">출석 관리</a></div>
			<div id="pre"><a href="mg_scoremain.bit">성적 관리</a></div>
			<!-- <div id="pre"><a href="#">온라인상담</a></div> -->
		</div>

		<div id="right">

			<h1>[ 성적 관리 ]</h1>
			<table>
				<tr>
					<th>과목</th>
					<th>시험날짜</th>
					<th>시험장소</th>
					<th>강사</th>
				</tr>
				<%
				for(int i=0; i< examlist.size(); i++){
					ExamDto bean=examlist.get(i);
					String teachername =null;
					
					for(int j=0; j<teacherlist.size(); j++){
						MemberDto memDto=teacherlist.get(j);
						if(bean.getSubteach()==memDto.getUsernum()){
							teachername = memDto.getUsername();
						}
					}
				%>
				<tr>
					<td><a href="mg_scoreedit.bit?idx=<%= bean.getExamnum() %>"><%= bean.getSubname() %></a></td>
					<td><a href="mg_scoreedit.bit?idx=<%= bean.getExamnum() %>"><%= bean.getExamdate() %></a></td>
					<td><a href="mg_scoreedit.bit?idx=<%= bean.getExamnum() %>"><%= bean.getSubroom() %></a></td>
					<td><a href="mg_scoreedit.bit?idx=<%= bean.getExamnum() %>"><%= teachername %></a></td>
				</tr>
				<%} %>
			</table>
		</div>
	</div>

	<%@ include file="../template/footer.jspf" %>

</body>

</html>
