<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import ="java.text.SimpleDateFormat" %>
<%@ page import="com.bit.pro2.model.CheckinDto" %>
<%@ page import="javax.servlet.http.HttpSession" %>
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
	<% String userid = (String) session.getAttribute("id"); %>
	<p><strong>출석확인</strong></p>
	<p><strong><%= userid %>님의 출석내역</strong></p>
	<div>
		<table>
			<tr>
				<th>출석일</th>
				<th>입실</th>
				<th>퇴실</th>
				<th>비고</th>
				<th>강사확인</th>
			</tr>
			<%
			ArrayList<CheckinDto> list = (ArrayList<CheckinDto>)request.getAttribute("alist");
			for(CheckinDto bean:list){ 
				String datebean = bean.getCheckdate();
				String inbean = bean.getCheckin();
				String outbean = bean.getCheckout();
				String chkstatus = null;
				
				int innum = Integer.parseInt(inbean);
				int outnum = Integer.parseInt(outbean);
				
				Date datedate = new SimpleDateFormat("yyyyMMdd").parse(datebean);
				Date indate = new SimpleDateFormat("HHmmss").parse(inbean);
				Date outdate = new SimpleDateFormat("HHmmss").parse(outbean);
				
				String datestring = new SimpleDateFormat("yyyy/MM/dd").format(datedate);
				String instring = new SimpleDateFormat("HH:mm:ss").format(indate);
				String outstring = new SimpleDateFormat("HH:mm:ss").format(outdate);
				
				if(innum<94000 && outnum>182000){ chkstatus="출석"; }
				else if(innum<94000 && outnum<=182000 && outnum>143000){ chkstatus="조퇴"; }
				else if(innum<94000 && outnum<=143000){ chkstatus="결석"; }
				else if(innum>=94000 && innum<143000 && outnum>182000){ chkstatus="지각"; }
				else if(innum>=94000 && innum<143000 && outnum<=182000){
					String[] inArray = instring.split(":", 3);
					String[] outArray = outstring.split(":", 3);
					int inMins = (Integer.parseInt(inArray[0])*60)+(Integer.parseInt(inArray[1]));
					int outMins = (Integer.parseInt(outArray[0])*60)+(Integer.parseInt(outArray[1]));
					if((outMins-inMins)>370){ chkstatus="지각조퇴"; } else { chkstatus="결석"; }
				}
				else if(innum>=143000){ chkstatus="결석"; }
				
				String chkteach = null;
				int chkbean = bean.getCheckchk();
				
				if(chkbean==1){ chkteach = "확인"; } else { chkteach = "미확인"; }
			%>
			<tr>
				<td><%= datestring %></td>
				<td><%= instring %></td>
				<td><%= outstring %></td>
				<td><%= chkstatus %></td>
				<td><%= chkteach %></td>
			</tr>
			<% } %>
		</table>
	</div>
	</div>
	
	</div>

	<%@ include file="../template/footer.jspf" %>
</body>
</html>