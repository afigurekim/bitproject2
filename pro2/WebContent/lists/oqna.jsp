<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&amp;subset=korean" rel="stylesheet">
   <link rel="stylesheet" style="text/css" href="../css/main.css"/>
   <link rel="stylesheet" style="text/css" href="../css/join.css"/>
  
    <style>

  	#divi{
  		width: 960px;
  		height:850px; 
  		}
  		
  	table{
  		width:600px;
  		height:350px;
  		border: 1px solid black;
  		
  		}
  		
  	#sub{
  		background-color: white;
  		
  		}
  		
  		
  		
  	#num{
  			width: 10%;
  			text-align: center;
  			
  		}
  		
 
  	td{
  		border: 0.8px solid #9EA2A2;
  		cellspacing:"0";
  		}
  	
  	td>a{
  	text-decoration: none;
  	margin: 0 0 0 15px;
  	color: black;
  	}
        
        
    </style>
    <script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="../js/jquery.bxslider.js"></script>    
    <script type="text/javascript">
    $(document).ready(function(){
    	$('#menu>ul>li').mouseover(function(){
    		$(this).children('ol').stop().slideDown(200);
    	}).mouseout(function() {
    		$(this).children('ol').stop().slideUp(200);
			
		});
    	
    	window.setInterval(imgNext, 2000);
    	
    	
    });
    
    function imgNext(){
    	$('#content>#mainimgs>ul').animate({margin:'0px-1000px'},3000,'swing',function(){
    		$('#content>#mainimgs>ul').children().first().appendTo('#content>#mainimgs>ul')
    		$('#content>#mainimgs>ul').css({margin:'10px'});
    	});
    	
    }
    
 

   
    </script>
</head>
<body>


<%@ include file="../template/header.jspf" %>
<%@ include file="../template/advice.jspf" %>
<h1>온라인 상담</h1>
<p><strong>강좌 상담</strong></p>




<table cellspacing="0">
	<tr id="sub">
		<td id="num">번호</td>
		<td>제목</td>
	</tr>
		<tr>
		<td id="num">1</td>
		<td><a href="http://localhost:8080/pro2/qna/ad1.jsp">실업자내일배움카드는 어떻게 발급 받나요?</a></td>
	</tr>
	<tr>
		<td id="num">2</td>
		<td><a href="http://localhost:8080/pro2/qna/ad2.jsp">실업자내일배움카드 신청자격이 따로 있나요?</a></td>
	</tr>
	<tr>
		<td id="num">3</td>
		<td><a href="http://localhost:8080/pro2/qna/ad3.jsp">실업자내일배움카드 지원혜택은 어떻게 되나요?</a></td>
	</tr>
	<tr>
		<td id="num">4</td>
		<td><a href="http://localhost:8080/pro2/qna/ad4.jsp">실업자내일배움카드 지원혜택은 어떻게 되나요?</a></td>
	</tr>
	<tr>
		<td id="num">5</td>
		<td><a href="http://localhost:8080/pro2/qna/ad5.jsp">실업자내일배움카드 지원혜택은 어떻게 되나요?</a></td>
	</tr>
	<tr>
		<td id="num">6</td>
		<td><a href="http://localhost:8080/pro2/qna/ad6.jsp">실업자내일배움카드 지원혜택은 어떻게 되나요?</a></td>
	</tr>
</table>




</div>
		</div>

<%@ include file="../template/footer.jspf" %>

</body>
</html>