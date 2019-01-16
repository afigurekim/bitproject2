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
  		height:2300px; 
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
<%@ include file="../template/introduce.jspf" %>
<h1>강사 소개</h1>
<p><strong>서대문점</strong></p>




<img alt="teacher" src="../imgs/you.png" id="teacher">
<h1>유대종</h1>
<p>
■강의특징&수강효과
① 수능을 준비하는 학생들에게 필수적인 개념과 태도를 정립하는 강의
② 내신 문학을 넘어서는 '평가원 문학'의 진수를 알려주는 강의
③ 독해력 교정 및 '메가스터디 문법 1위'의 최신 노하우 전수

■관리 프로그램
① 수업과 밀접한 연관이 있는 현장 자료 제공
② '국어 1등급 조교'의 완벽한 수강생 관리(조교 1명 당 학생7~10명 관리)
③ 질의응답 관리와 국어 학습관리가 병행되는 담임 조교+비담임 조교 제도
④ 매주 테스트를 통해 배운 내용 점검&확인
<p>

<img alt="teacher" src="../imgs/hyun.png" id="teacher">
<h1>현우진</h1>
<p>
■강의특징&수강효과
① 수능을 준비하는 학생들에게 필수적인 개념과 태도를 정립하는 강의
② 내신 문학을 넘어서는 '평가원 문학'의 진수를 알려주는 강의
③ 독해력 교정 및 '메가스터디 문법 1위'의 최신 노하우 전수

■관리 프로그램
① 수업과 밀접한 연관이 있는 현장 자료 제공
② '국어 1등급 조교'의 완벽한 수강생 관리(조교 1명 당 학생7~10명 관리)
③ 질의응답 관리와 국어 학습관리가 병행되는 담임 조교+비담임 조교 제도
④ 매주 테스트를 통해 배운 내용 점검&확인
<p>



<img alt="teacher" src="../imgs/jo.png" id="teacher">
<h1>조정식</h1>
<p>
■강의특징&수강효과
① 수능을 준비하는 학생들에게 필수적인 개념과 태도를 정립하는 강의
② 내신 문학을 넘어서는 '평가원 문학'의 진수를 알려주는 강의
③ 독해력 교정 및 '메가스터디 문법 1위'의 최신 노하우 전수

■관리 프로그램
① 수업과 밀접한 연관이 있는 현장 자료 제공
② '국어 1등급 조교'의 완벽한 수강생 관리(조교 1명 당 학생7~10명 관리)
③ 질의응답 관리와 국어 학습관리가 병행되는 담임 조교+비담임 조교 제도
④ 매주 테스트를 통해 배운 내용 점검&확인
<p>

</div>
		</div>

<%@ include file="../template/footer.jspf" %>

</body>
</html>