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
		<td>근로자 직업능력개발훈련 지원대상자는 어떻게 되나요?</td>
	</tr>
	
	<tr>
		<td  colspan="2">- 우선지원대상기업(중소기업)에 재직중인 근로자

- 고용보험료 체납액이 없는 자영업자

- 3년간 훈련이력이 없는 근로자

- 무급 휴직중인 자

- 이직 예정 근로자

- 대규모 기업에 재직중인 만45세 이상인 근로자

- 육아 휴직자


		</td>
	</tr>
	
	
</table>




</div>
		</div>

<%@ include file="../template/footer.jspf" %>

</body>
</html>