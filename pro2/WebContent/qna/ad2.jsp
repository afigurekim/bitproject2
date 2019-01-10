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
  		height:400px; 
  		}
  		
  	table{
  		width:600px;
  		height:350px;
  		border: 1px solid black;
  		cellspacing:"0";
  		}
  		
  	#sub{
  		background-color: #041E42;
  		color: white;
  		}
  		
  		
  		
  	#num{
  			width: 17%;
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
  	
  	#con{
  		colspan:"2";
  	}
        
        
    </style>
    <script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="../js/jquery.bxslider.js"></script>    
    <script type="text/javascript">
    $(document).ready(function(){
    	$('#menu>ul>li').mouseover(function(){
    		$(this).children('ol').stop().slideDown(1000);
    	}).mouseout(function() {
    		$(this).children('ol').stop().slideUp(1000);
			
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





<table>
	<tr id="sub">
		<td id="num">제목</td>
		<td>실업자내일배움카드 신청자격이 따로 있나요?</td>
	</tr>
	
	<tr>
		<td  colspan="2">실업자내일배움카드 신청자격 요건은

- 15세 이상 실업자.

- 현재 고용보험이나 근로소득이 없는 미취업자.

- 고등학교 3학년 재학생으로 대학에 진학하지 않고 취업을 희망하는 자.

- 대학교(전문학교) 최종학년 재학생으로 대학원에 진학하지 않은 졸업예정자(휴학생은 제외)

- 방통대, 사이버대, 야간대 재학생 


		</td>
	</tr>
	
	
</table>




</div>
		</div>

<%@ include file="../template/footer.jspf" %>

</body>
</html>