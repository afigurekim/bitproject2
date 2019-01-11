<%@page import="com.bit.pro2.model.MemberDto"%>
<%@page import="java.util.ArrayList"%>
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
		table{
			width: 600px;
			border-collapse: collapse;
			text-align: center;
			line-height: 28px;
		}
		table th{
			background-color: rgb(180,180,180);
			width: 150px;
		}
		table th, table td{
			border: 1px solid black;
		}
		input{
			display:inline-block;
			vertical-align:;
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
	ArrayList<MemberDto> list=(ArrayList<MemberDto>)request.getAttribute("adlist");
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
			<form action="mg_scsave" method="post">
				<table>
					<tr>
						<th>과정명</th>
						<td><input type="text" name="progname" id="progname" value=""/></td>
					</tr>
					<tr>
						<th>강사</th>
						<td>
							
							<select>
								<%
									for(int i=0; i<list.size();i++){
									MemberDto bean=list.get(i);
									
									if(bean.getUserlevel().equals("teacher")){
								%>
								<option value="<%=bean.getUsernum() %>"><%=bean.getUsername() %></option>
								<%}} %>
							</select>
						</td>
					</tr>
					<tr>
						<th>강의실</th>
						<td><input type="text" name="progroom" id="progroom" value=""/></td>
					</tr>
					<tr>
						<th>시작일</th>
						<td><input type="date" name="progstart" id="progstart" value=""/></td>
					</tr>
					<tr>
						<th>종료일</th>
						<td><input type="date" name="progend" id="progend" value=""/></td>
					</tr>
					<tr>
						<th>강의시작시간</th>
						<td>
							<select>
								<option value="AM 09:00">AM 09:00 </option>
								<option value="AM 09:30">AM 09:30 </option>
								<option value="AM 10:00">AM 10:00 </option>
								<option value="AM 10:30">AM 10:30 </option>
								<option value="PM 12:00">PM 12:00 </option>
								<option value="PM 12:30">PM 12:30 </option>
								<option value="PM 13:00">PM 13:00 </option>
								<option value="PM 13:30">PM 13:30 </option>
							</select>
						</td>
					</tr>
					<tr>
						<th>강의시간</th>
						<td>
							<select>
								<option value=60>60 분</option>
								<option value=120>120 분</option>
								<option value=180>180 분</option>
								<option value=240>240 분</option>
								<option value=300>300 분</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>교육인원</th>
						<td>
						<select>
								<option value=10>10 명</option>
								<option value=15>15 명</option>
								<option value=20>20 명</option>
								<option value=25>25 명</option>
								<option value=30>30 명</option>
								<option value=35>35 명</option>
								<option value=40>40 명</option>
							</select>
						</td>
					</tr>
				</table>
				<br/>
				<button type="submit">저장</button>
				<button type="reset">취소</button>
			</form>
			
		</div>
	</div>

	<%@ include file="../template/footer.jspf" %>

</body>

</html>
