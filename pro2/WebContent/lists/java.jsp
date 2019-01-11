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
  		height:1500px; 
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
<p><strong>Java</strong></p>

<img alt="java" src="../imgs/java.jpg">

<p>
<h2><a id="num">1.</a> 강좌 소개</h2><br>
성수 메이커 스페이스 에서 제공하는 실전 자바 강좌 입니다. JAVA, JSP, SPRING 시리즈 강좌의 첫번쨰 순서로 자바의 기본에서부터 실전, 실무에서 자바 개발자로서 필요한 지식과 개념을 총 망라해 강의를 제공합니다. 총 15시간이 넘는 긴 분량으로 깔끔하면서도 개념을 잘 짚어주는 설명으로 누구나 이해하기 쉬우면서도, 개념이 잘 정리됩니다.

기본적이고 충실한 기본 개념을 통해 여러가지 예제들을 실습도 제공됩니다. 학사 관리 프로그램, 어린이집 식대관리, 로봇장난감 등 여러가지 실제로 만들어보는 자바 코딩을 배울수 있습니다.
<br>
<br>
<h2><a id="num">2.</a> 도움이되는 분들</h2><br>
프로그래밍을 배우고 싶은 분<br>
프로그래머로 취업을 원하는 문과 대학생<br>
초급 자바 개발자</br>
개념을 정확히 알고싶은 중급 자바 개발자</br>
안드로이드 개발에 기본언어인 자바를 익히고 싶은분</br>
아무나</br>
</br>
<h2><a id="num">3.</a> 강좌 특징</h2><br>
＊ 다루는 기술 : JAVA 프로그래밍 언어</br>
＊ 관련된 강좌 : 신입 프로그래머를 위한 실전 JSP 강좌, 신입 프로그래머를 위한 자바 스프링 (Spring) 프레임워크 강좌
</p>




</div>
		</div>

<%@ include file="../template/footer.jspf" %>

</body>
</html>