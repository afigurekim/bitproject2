<%@page import="com.bit.pro2.model.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<!-- CSH
		 << 관리자 메뉴 >>
		 
		회원 승인	mg_admin_admission.jsp
		강의 관리	mg_admin_subcreate.jsp
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

	<style type="text/css">
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
	
	<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
	<script type="text/javascript" src="js/jquery.bxslider.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#menu>ul>li').mouseover(function() {
				$(this).children('ol').stop().slideDown(200);
			}).mouseout(function() {
				$(this).children('ol').stop().slideUp(200);
			});
			
			$("select").click(function(){
				
				/* alert($(this).val()); */
			});
			
		});
			
		if(<%=request.getParameter("result")%>)alert(<%=request.getParameter("result")%>);
	</script>

</head>
<%
	ArrayList<MemberDto> list=(ArrayList<MemberDto>)request.getAttribute("adlist");
%>
<body>

	<%@ include file="../template/header.jspf" %>

	<div id="divi">
		<div id="left">
			<div id="h">관리자</div>

			<div id="pre"><a href="mg_admission.bit">회원 승인</a></div>
			<div id="pre"><a href="mg_submain.bit">강의 관리</a></div>
			<div id="pre"><a href="mg_consult.bit">온라인상담</a></div>
			<!-- <div id="pre"><a href="#">출석 관리</a></div> -->
			<!-- <div id="pre"><a href="#">성적확인/수정</a></div> -->
			
		</div>

		<div id="right">

			<h1>[ 회원 승인 ]</h1>
			<form action="mg_adsave.bit" method="post">
				<table>
					<tr>
						<th>이름</th>
						<th>아이디</th>
						<th>이메일</th>
						<th>연락처</th>
						<th>직업</th>
					</tr>
					
					<% 
					for(int i=0; i<list.size(); i++){
						
						MemberDto bean=list.get(i);
					%>
					<tr>
						<td><%=bean.getUsername() %></td>
						<td><%=bean.getUserid() %></td>
						<td><%=bean.getUsermail() %></td>
						<td><%=bean.getUserphone() %></td>
						<td>
							<select name="<%=bean.getUsernum() %>" >
								<option value="student" <%if(bean.getUserlevel().equals("student")) out.print("selected=\"selected\""); %>>student</option>
								<option value="teacher" <%if(bean.getUserlevel().equals("teacher")) out.print("selected=\"selected\""); %>>teacher</option>
								<option value="admin" <%if(bean.getUserlevel().equals("admin")) out.print("selected=\"selected\""); %>>admin</option>
							</select>
							
						</td>
					</tr>
					<% } %>
				</table>
				<div>
					<br/>
					<button type="submit" >저장</button>
				</div>
			</form>
			
			</div>
	</div>

	<%@ include file="../template/footer.jspf" %>

</body>

</html>
