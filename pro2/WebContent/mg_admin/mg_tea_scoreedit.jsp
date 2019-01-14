<%@page import="com.bit.pro2.model.ScoreDto"%>
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
		
		input{
			text-align: center;
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
	ExamDto exdto=(ExamDto)request.getAttribute("exdto");
	ArrayList<MemberDto> teacherlist=(ArrayList<MemberDto>)request.getAttribute("tealist");
	ArrayList<MemberDto> studentlist=(ArrayList<MemberDto>)request.getAttribute("stulist");
	ArrayList<ScoreDto> scorelist=(ArrayList<ScoreDto>)request.getAttribute("scolist");
	
	System.out.println("studentlist :"+studentlist.size());
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
			<table>
				<h1>[ 성적 수정 ]</h1>
				
				<tr>
					<th>과목</th>
					<td><%= exdto.getSubname() %></td>
				</tr>
				<tr>
					<th>날짜</th>
					<td><%= exdto.getExamdate() %></td>
				</tr>
				<tr>
					<th>강의실</th>
					<td><%= exdto.getSubroom() %></td>
				</tr>
				<%
				String teachername =null;
				
				for(int j=0; j<teacherlist.size(); j++){
					MemberDto memDto=teacherlist.get(j);
					if(exdto.getSubteach()==memDto.getUsernum()){
						teachername = memDto.getUsername();
					}
				}
				%>
				<tr>
					<th>강사</th>
					<td><%= teachername %></td>
				</tr>

			</table>
			<br/>
			<form action="#" method="post">
				<table>
					<tr>
						<th>이름</th>
						<th>성적</th>
					</tr>
					<%
					for(int i=0; i<scorelist.size(); i++){
						ScoreDto bean = scorelist.get(i);
						MemberDto memDto=studentlist.get(i);
					%>
					<tr>
						<td><%= memDto.getUsername() %></td>
						<%-- <td><%= bean.getExamscore() %></td> --%>
						<td><input type="text" name="score" value="<%= bean.getExamscore() %>"/></td>
					</tr>
					<%} %>
				</table>
				<br/>
				<tr>
					<button type="submit">입력</button>
					<button type="reset">취소</button>
				</tr>
			</form>
		</div>
	</div>

	<%@ include file="../template/footer.jspf" %>

</body>

</html>
