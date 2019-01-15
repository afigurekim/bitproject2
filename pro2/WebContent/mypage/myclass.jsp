<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import ="java.text.SimpleDateFormat" %>
<%@ page import="com.bit.pro2.model.MemberDto" %>
<%@ page import="com.bit.pro2.model.ProgramDto" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수강신청</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&amp;subset=korean" rel="stylesheet">
<link rel="stylesheet" style="text/css" href="css/main.css"/>
<link rel="stylesheet" style="text/css" href="css/mypage.css"/>
<style type="text/css">

	#divi{
	  		width: 960px;
	  		height: 1050px; 
	  		}
	
	table{
			width: 60%;
			border-collapse: collapse;
			border: 2px solid black;
	}
	table th, td{
			border: 2px solid black;
	}
	table th{
			background-color: LightGray;
	}
	table td{
			text-align: center;
	}
	
	form .dropdown{
			padding: 5px;
			width: 360px;
			font-size: 12px;
	}
	
	form .btn{
			padding: 5px;
			width: 100px;
			font-size: 12px;
	}

</style>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
    	$('#menu>ul>li').mouseover(function(){
    		$(this).children('ol').stop().slideDown(1000);
    	}).mouseout(function() {
    		$(this).children('ol').stop().slideUp(1000);
		});
    });
</script>
</head>
<body>
	<% String userid = request.getParameter("userid"); %>
	<%@ include file="../template/header.jspf" %>

	<%@ include file="../template/mypage.jspf" %>
	
	<p><strong>수강신청</strong></p>
	<% if(request.getParameter("app")==null || request.getParameter("app").equals("false")){}
	else if(request.getParameter("app").equals("true")) { %><div><strong>수강신청이 성공적으로 완료되었습니다.</strong></div> <% } %>
	<% 
		MemberDto membean = (MemberDto) request.getAttribute("membean");
		int userprog = membean.getUserprog();
		if(userprog!=0){
		ArrayList<ProgramDto> progonelist = (ArrayList<ProgramDto>) request.getAttribute("progonelist");
	%>
		<p><strong><%= userid %>님께서 최근에 신청한 강의는 다음과 같습니다.</strong></p>
	<%		
			for(ProgramDto dto : progonelist){ %>
				<table>
					<tr>
						<th>과정명</th>
						<td><%= dto.getProgname() %></td>
					</tr>
					<tr>
						<th>강의실</th>
						<td><%= dto.getProgroom() %></td>
					</tr>
					<tr>
						<th>개강일</th>
						<td><%= dto.getDatestart() %></td>
					</tr>
					<tr>
						<th>종강일</th>
						<td><%= dto.getDateend() %></td>
					</tr>
					<tr>
						<th>시작시간</th>
						<td><%= dto.getTimestart() %></td>
					</tr>
					<tr>
						<th>반 규모</th>
						<td><%= dto.getProgsize() %>명</td>
					</tr>
				</table><br />
	<%	}	} else { %>
	<p><strong><%= userid %>님께서는 최근에 신청한 강의가 없습니다.</strong></p>
	<%	} %>	
	<form action="myclassapp.bit" method="post">
		<p><strong>신청 가능한 과정</strong></p>
		<select name="appnum" class="dropdown">
		<%
			ArrayList<ProgramDto> proglist = (ArrayList<ProgramDto>) request.getAttribute("proglist");
			for(ProgramDto dto : proglist){
				Date datestart = dto.getDatestart();
				Date dateend = dto.getDateend();
				String startdate = null;
				String enddate = null;
				String progname = dto.getProgname();
				int size = dto.getProgsize();
				int cnt = dto.getProgcnt();
				int num = dto.getPrognum();
				if(size > cnt){
					startdate = new SimpleDateFormat("yyyy/MM/dd").format(datestart);
					enddate = new SimpleDateFormat("yyyy/MM/dd").format(dateend);
		%>
			<option value="<%= num %>"><%= startdate %>~<%= enddate %> <%= progname %></option>
		<%
			} }
		%>
		</select><br />
		<input type="hidden" name="userid" value="<%= userid %>" />
		<input type="hidden" name="userprog" value="<%= userprog %>" />
		<input type="submit" class="btn" value="신청"/>
	</form>
	
	</div>
	
	</div>
	
	<%@ include file="../template/footer.jspf" %>
</body>
</html>