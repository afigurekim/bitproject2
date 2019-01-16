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
  		height:1800px; 
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
<p><strong>Datebase</strong></p>




<img alt="database" src="../imgs/Database.png">
<img alt="database" src="../imgs/data.png">

<p>
<h2><a id="num">1.</a> 강좌 소개</h2><br>
정보시스템의 근간 기술인 데이터베이스의 관리와 이와 관련된 기반 지식에서부터 출발해 기본 기술과 응용 기술통해 전체적인 개념을 확실히 정립한다. 
또한 데이터베이스 모델링 및 설계를 통해 데이터활용법을 이해함과 동시에 이에 관련한 언어들에 대한 학습을 진행한다.
마지막으로 데이터베이스의 고급기능들에 대해 학습한다.
</br>
<br>
<h2><a id="num">3.</a> 강좌 특징</h2><br>
- 전자칠판 동영상 강의 기반 서비스<br>
- LMS시스템상 참여 학습(과제, 토론, 학습계획 등)<br>
- 오프라인 특강(과목 특성에 따라 학기 1~2회) : 신청자<br>

</p>


</div>
		</div>

<%@ include file="../template/footer.jspf" %>

</body>
</html>