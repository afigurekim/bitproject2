<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import ="java.text.SimpleDateFormat" %>
<%@ page import="com.bit.pro2.model.CheckinDto" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>출석확인</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&amp;subset=korean" rel="stylesheet">
<link rel="stylesheet" style="text/css" href="css/main.css"/>
<link rel="stylesheet" style="text/css" href="css/mypage.css"/>
<style type="text/css">

	#divi{
	  		width: 960px;
	  		height: 1050px; 
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
	<%@ include file="template/header.jspf" %>

	<%@ include file="template/mypage.jspf" %>
	<% String userid = request.getParameter("userid"); %>
	<p><strong>출석확인</strong></p>
	<p><strong><%= userid %>님의 출석내역</strong></p>
	<div>
		<table>
			<tr>
				<th>출석일</th>
				<th>입실</th>
				<th>퇴실</th>
			</tr>
			<%
			ArrayList<CheckinDto> list = (ArrayList<CheckinDto>)request.getAttribute("alist");
			for(CheckinDto bean:list){ 
				String datebean = bean.getCheckdate();
				String inbean = bean.getCheckin();
				String outbean = bean.getCheckout();
				
				Date datedate = new SimpleDateFormat("yyyyMMdd").parse(datebean);
				Date indate = new SimpleDateFormat("HHmmss").parse(inbean);
				Date outdate = new SimpleDateFormat("HHmmss").parse(outbean);
				
				String datestring = new SimpleDateFormat("yyyy/MM/dd").format(datedate);
				String instring = new SimpleDateFormat("HH:mm:ss").format(indate);
				String outstring = new SimpleDateFormat("HH:mm:ss").format(outdate);
			%>
			<tr>
				<td><%= datestring %></td>
				<td><%= instring %></td>
				<td><%= outstring %></td>
			</tr>
			<% } %>
		</table>
	</div>
	</div>
	
	</div>

	<%@ include file="template/footer.jspf" %>
</body>
</html>