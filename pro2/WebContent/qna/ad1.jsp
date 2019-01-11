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
		<td>실업자내일배움카드는 어떻게 발급 받나요?</td>
	</tr>
	
	<tr>
		<td  colspan="2">실업자내일배움카드는 거주지 관할 고용지원센터에 방문하시거나 노동부에서 정식으로

인가받은 위탁훈련기관에 직접 방문하여 카드를 신청할 수 있습니다.

실업자내일배움카드는 온라인 신청으로 만 카드 신청은 불가능하며 직접 방문해야 합니다.

카드 발급까지는 최소 2주 최대 4주 정도 소요가 됩니다. 

* 카드 발급은 각 관할 고용지원센터 사정에 따라 약간의 차이가 있습니다.

		</td>
	</tr>
	
	
</table>




</div>
		</div>

<%@ include file="../template/footer.jspf" %>

</body>
</html>