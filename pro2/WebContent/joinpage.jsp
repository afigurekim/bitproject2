<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&amp;subset=korean" rel="stylesheet">
   <link rel="stylesheet" style="text/css" href="css/main.css"/>
    <link rel="stylesheet" style="text/css" href="css/join.css"/>

<style type="text/css">

	#divi{
  		width: 960px;
  		height:950px; 
  		}

	form{
//	border: 0.6px solid gray;
	padding: 35px;
	
	}

	form>div{
		width:500px;
		height: 50px;
	}
	
	form>div>label{
	font-weight: bold;
	font-size: 15px;
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
    
    
    var form,id,pw,name,adress,phone,email;
    
    
 

   
    </script>
   
   
</head>
<body>


<%@ include file="template/header.jspf" %>

<%@ include file="template/join.jspf" %>
<p><strong>회원정보입력</strong></p>

	<form action="#" method="post">
	<div>
	<label>이름&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;</label>
	<input type="text" id="name">
	<button>중복확인</button>
	</div>
	<div>
	<label>아이디*&emsp;&emsp;&emsp;&emsp;</label>
	<input type="text" id="id">
	</div>
	<div>
	<label>비밀번호*&emsp;&emsp;&emsp;</label>
	<input type="text" id="pw">
	</div>
	<div>
	<label>비밀번호 확인*&emsp;</label>
	<input type="text" id="pw">
	</div>
	<div>
	<label>주소*&emsp;&emsp;&emsp;&emsp;&emsp;</label>
	<input type="text" id="address">
	</div>
	<div>
	<label>핸드폰번호*&emsp;&emsp;&nbsp;</label>
	<input type="text" id="phone">
	</div>
	<div>
	<label>이메일*&emsp;&emsp;&emsp;&emsp;</label>
	<input type="text" id="email">@<input type="text" id="email">
	</div>
	</form>
	
	
	
		
	</div>
		</div>




<%@ include file="template/footer.jspf" %>
</body>
</html>
