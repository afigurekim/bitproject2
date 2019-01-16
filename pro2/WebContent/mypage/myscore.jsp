<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import ="java.text.SimpleDateFormat" %>
<%@ page import="com.bit.pro2.model.StuscoreDto" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>성적확인</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&amp;subset=korean" rel="stylesheet">
<link rel="stylesheet" style="text/css" href="css/main.css"/>
<link rel="stylesheet" style="text/css" href="css/mypage.css"/>
<style type="text/css">

	#divi{
	  		width: 960px;
	  		height: 1050px; 
	  		}
	  		
	table{
			width: 80%;
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
	<%@ include file="../template/header.jspf" %>

	<%@ include file="../template/mypage.jspf" %>
	
	<p><strong>성적확인</strong></p>
	<table>
		<tr>
			<th>시험일자</th>
			<th>교육과정</th>
			<th>강사</th>
			<th>성적</th>
		</tr>
		<%
			ArrayList<StuscoreDto> list = (ArrayList<StuscoreDto>) request.getAttribute("alist");
			for(StuscoreDto bean : list){
				String datebean = bean.getExamdate();
				Date datedate = new SimpleDateFormat("yyyy-MM-dd").parse(datebean);
				String datestring = new SimpleDateFormat("yyyy/MM/dd").format(datedate);
		%>
		<tr>
			<td><%= datestring %></td>
			<td><%= bean.getSubname() %></td>
			<td><%= bean.getTeachname() %></td>
			<td><%= bean.getExamscore() %></td>
		</tr>
		<% 	} %>
	</table>
	
	</div>
	
	</div>
	
	<%@ include file="../template/footer.jspf" %>

</body>
</html>