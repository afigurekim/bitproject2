<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&amp;subset=korean" rel="stylesheet">

   <link rel="stylesheet" style="text/css" href="./css/main.css"/>

    <link rel="stylesheet" style="text/css" href="./css/join.css"/>



<style type="text/css">



	#divi{

  		width: 960px;

  		height:950px; 

  		}



	form{

//	border: 0.6px solid gray;

	padding: 35px;

	

	}



	form>div{

		width:500px;

		height: 50px;

	}

	

	form>div>label{

	font-weight: bold;

	font-size: 15px;

	}











</style>

 

    <script type="text/javascript" src="./js/jquery-1.12.4.js"></script>

    <script type="text/javascript" src="./js/jquery.bxslider.js"></script>    

    <script type="text/javascript">

    $(document).ready(function(){

    	$('#menu>ul>li').mouseover(function(){

    		$(this).children('ol').stop().slideDown(200);

    	}).mouseout(function() {

    		$(this).children('ol').stop().slideUp(200);

			

		});

    	

    	window.setInterval(imgNext, 2000);

    	

    	

    });

    



   

    </script>

   

   

</head>

<body>


<%@ include file="./template/header.jspf" %>
<%@ include file="./template/join.jspf" %>

	<h1>회원가입이 완료되었습니다</h1>
	
	<a href="http://localhost:8080/pro2/main.jsp">HOME</a>
	<a href="http://localhost:8080/pro2/login.jsp">로그인</a>

</div>
	</div>
<%@ include file="./template/footer.jspf" %>
</body>
</html>