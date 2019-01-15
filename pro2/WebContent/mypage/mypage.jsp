<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bit.pro2.model.CheckinDto" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Page</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&amp;subset=korean" rel="stylesheet">
<link rel="stylesheet" style="text/css" href="css/main.css"/>
<link rel="stylesheet" style="text/css" href="css/mypage.css"/>
<style type="text/css">

	#divi{
	  		width: 960px;
	  		height: 1050px; 
	}
	  		
	form{
			display: inline-block;
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
	<%@ include file="../template/header.jspf" %>

	<%@ include file="../template/mypage.jspf" %>
	<% String userid = (String) session.getAttribute("id"); %>
	<p><strong><%= userid %>님 로그인을 환영합니다!</strong></p>
	
	<p><strong>출석</strong></p>
		<% 
			CheckinDto bean = (CheckinDto) request.getAttribute("bean"); 
			if(bean!=null && bean.getCheckin()!=null){ %>
		<div>입실 처리 되었습니다.</div>
		<% 	} 
			if(bean!=null && bean.getCheckout()!=null){ %>
		<div>퇴실 처리 되었습니다.</div>
		<%  } %>
		<form action="mypagein.bit" method="post">
			<input type="submit" class="btn" value="입실" />
		</form>
		<form action="mypageout.bit" method="post">
			<input type="submit" class="btn" value="퇴실" />
		</form>
	</div>
	
	</div>
		
	<%@ include file="../template/footer.jspf" %>
</body>
</html>