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





<table>
	<tr id="sub">
		<td id="num">제목</td>
		<td>실업자내일배움카드 지원혜택은 어떻게 되나요?</td>
	</tr>
	
	<tr>
		<td  colspan="2">1인당 최대 300만원의 훈련비를 지원받으실 수 있습니다. 또한 취업성공패키지의 

경우 월 최대 416,000원(훈련참여지원수당 + 훈련장려금)의 지원금을 지급 받으실 수 있습니다.

*단, 단위 기간 중 출석률 80% 이상일 경우

		</td>
	</tr>
	
	
</table>




</div>
		</div>

<%@ include file="../template/footer.jspf" %>

</body>
</html>