<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&amp;subset=korean" rel="stylesheet">
   <link rel="stylesheet" style="text/css" href="css/main.css"/>
   <link rel="stylesheet" style="text/css" href="css/join.css"/>
  
    <style>

  	#divi{
  		width: 960px;
  		height:1500px; 
  		}
  		
  		img{
  		size: 500px;
  		}
        
        
    </style>
    <script type="text/javascript" src="./js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="./js/jquery.bxslider.js"></script>    
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


<%@ include file="template/header.jspf" %>
<%@ include file="template/introduce.jspf" %>
<h1>공지사항</h1>
<p><strong>서대문점</strong></p>




<img alt="notice" src="./imgs/notice.jpg">






</div>
		</div>

<%@ include file="template/footer.jspf" %>

</body>
</html>