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
  		height:1400px; 
  		}
  		
  	#C{
  		width:500px;
  		height: 400px;
  	}
        
     #a{
     
     	width: 580px;
     	height: 200px;
     	border-top: 0.8px solid #9EA2A2;
     	border-bottom: 0.8px solid #9EA2A2;
     	background-color: #D8D8D8;
       
      }
      
      #d{
      	margin: 30px 0 0 0;
      	padding: 10px; 
      }
      
      #b{
      	width: 70px;
      	height: 25px;
      	background-color: #D8D8D8;
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
<%@ include file="../template/course.jspf" %>
<h1>정규 과정</h1>
<p><strong>C과정</strong></p>


	<div id="a">
		<h3>과정개요</h3>
		
		<p>C언어 과정은 C언어를 처음 배우는 이들이 어렵지 않게 C언어의 기본적인 내용을 이해할 수 있도록 다양한 예제와 실습을 통해 진행하고 있습니다. 본 과정을 통해 기본적인 C프로그램의 작성 방법, C언어의 기본 구조와 응용방법 등에 대해 습득하실 수 있습니다.</p>
	</div>
	
	<div id="d">
		<table>
			<tr>
				<td id="b">교육시간</td>
				<td>50시간</td>
			</tr>
		
			<tr>
				<td id="b">모집인원</td>
				<td>30명 내외</td>
			</tr>
			
			<tr>
				<td id="b">교육방식</td>
				<td>이론 및 실습 중심 교육</td>
			</tr>
			
			<tr>
				<td id="b">교육장소</td>
				<td>비트캠프 서대문점</td>
			</tr>
		</table>
	</div>


	<h3>커리큘럼</h3>
	
	<img alt="hello" src="../imgs/Ccourse.PNG">


</div>
		</div>

<%@ include file="../template/footer.jspf" %>

</body>
</html>