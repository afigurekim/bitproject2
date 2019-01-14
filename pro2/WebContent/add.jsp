<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&amp;subset=korean" rel="stylesheet">
   <link rel="stylesheet" style="text/css" href="css/main.css"/>
   <link rel="stylesheet" style="text/css" href="css/join.css"/>
   
   <style type="text/css">
 	#divi{
  		width: 960px;
  		height:1000px; 
  	} 
   
  
   
   #big>div{
   	
     border: 0.4px solid gray;
   }
   
 
   
   
   #outout>#la,#te{ 
 		display: inline-block; 
 		
 	} 
 	
 	#out>#la,#te{
 		display: inline-block;
 	}
 	#outout>#la{ 
 		width: 90px; 
 		height:21px;
 	
 		
 		 
 	} 
 	#outout>#te{ 
 		
 		box-sizing:border-box; 
 		width: 450px; 
 		height:45px;
 	} 
 	
 	#out>#la{
 		width: 90px; 
 		height:21px;
 		
 	}
 	
 	#out>#te{
 		box-sizing:border-box; 
 		width: 450px; 
 		height:45px;
 	}
 	
 	
 	

 	
 	#outoutout>#concon{
 		box-sizing:border-box; 
 		width: 450px; 
 		height:300px;
 	}
 	
 	
 	#outout>#te>input{
 		width: 250px;
 		height: 24px;
 		margin: 7px 0 0 0;
 	}
 	
 	
 	#out>#te>#title{
 		width: 480px;
 		height: 24px;
 		margin: 7px 0 0 0;
 	}
 	

 	#outoutout>#con{
 		width: 250px; 
 		height:30px;
 		margin: 10px 0 0 20px;
 		font-weight: bold;
 		color: black;
 	}
 	
 	#outoutout>#concon>#cont{
 		width: 628px;
 		height: 270px;
 		margin: 5px 20px 20px 20px;
 	}
   
   
   #la{
   text-align: center;
   font-weight: bold;
   color: black;
   }
   
   </style>
	
	
	 <script type="text/javascript" src="js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="js/jquery.bxslider.js"></script>    
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
<%@ include file="template/header.jspf" %>
 <%@ include file="template/advice.jspf" %>
<h1>상담</h1> 
 	<form action="insert.bit" method="post"> 
 	<div id="big">
 		<div id="out"> 
 			<div id="la">제목&emsp;&emsp;</div>
 			<div id="te"><input type="text" name="title" id="title" /> </div>
 		</div>
 		 
 		<div id="outout">
 			<div id="la">이름&emsp;&emsp;</div>
 			<div id="te"><input type="text" name="name" id="name" /></div> 
 		</div>
 		
 		<div id="outout">
 			<div id="la">비밀번호</div>
 			<div id="te"><input type="text" name="pw" id="pw" /></div>
 		</div> 
 		
		<div id="outout">
 			<div id="la">핸드폰번호&nbsp;</div>
 			<div id="te"><input type="text" name="phone" id="phone" /> </div>
 		</div>
 	
 		<div id="outoutout"> 
 			<div id="con">내용을 입력해주세요</div>
 			<div id="concon"><textarea  name="cont" id="cont" ></textarea></div>
 		</div> 
 	
 		
 			<button type="submit">입력</button> 
 			<button type="reset">취소</button> 
 			<button type="button">뒤로</button> 
 		
 	</div>
 	</form> 

	
</body>

 
</html>