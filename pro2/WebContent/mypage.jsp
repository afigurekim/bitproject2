<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

</style>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
    	$('#menu>ul>li').mouseover(function(){
    		$(this).children('ol').stop().slideDown(200);
    	}).mouseout(function() {
    		$(this).children('ol').stop().slideUp(200);
		});
    });
</script>
</head>
<body>
	<%@ include file="template/header.jspf" %>

	<%@ include file="template/mypage.jspf" %>
	
	<p><strong><!-- 여기에 ID 또는 이름 -->님 로그인을 환영합니다!</strong></p>
	
	<p><strong>출석</strong></p>
		<form action="#">
			<input type="button" value="입실" />
			<input type="button" value="퇴실" />
		</form>
	
	</div>
	
	</div>
		
	<%@ include file="template/footer.jspf" %>
</body>
</html>