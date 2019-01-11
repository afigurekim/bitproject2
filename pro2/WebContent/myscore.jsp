<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	<p><strong>성적확인</strong></p>
	<table>
		<tr>
			<th>교육과정</th>
			<th>시험회차</th>
			<th>성적</th>
		</tr>
		<tr>
			<td>과정명</td>
			<td>1</td>
			<td>70</td>
		</tr>
		<tr>
			<td>과정명</td>
			<td>2</td>
			<td>80</td>
		</tr>
		<tr>
			<td>과정명</td>
			<td>3</td>
			<td>95</td>
		</tr>
	</table>
	
	</div>
	
	</div>
	
	<%@ include file="template/footer.jspf" %>

</body>
</html>