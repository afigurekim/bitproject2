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
        
        #web,#web1{
        width: 500px;
        height: 400px;
        }
        
        #num{
		text-decoration: none;
		color: red; 
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
<%@ include file="../template/subject.jspf" %>
<h1>학과목안내</h1>
<p><strong>Web</strong></p>




<img alt="web" src="../imgs/web.jpg" id="web">
<img alt="web" src="../imgs/web2.jpg" id="web1">

<p>
<h2><a id="num">1.</a> 강좌 소개</h2><br>
데이터통신과 컴퓨터 네트워크의 기초 개념, 계층별 특징과 각종 프로토콜,
성능 분석과 네트워크 기술, 네트워크 응용 기술과 차세대 기술에 대하여 학습한다.
y 교재: 데이터통신과 컴퓨터 네트워킹: 기초이론과 최신 응용 (강문석 저, 한빛미디어
</br>
<br>
<h2><a id="num">3.</a> 강좌 특징</h2><br>
- 교재: 데이터통신과 컴퓨터 네트워킹: 기초이론과 최신 응용 (강문석 저, 한빛미디어)<br>

</p>






</div>
		</div>

<%@ include file="../template/footer.jspf" %>

</body>
</html>