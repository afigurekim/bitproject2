<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&amp;subset=korean" rel="stylesheet">
   <link rel="stylesheet" style="text/css" href="../css/main.css"/>
    <link rel="stylesheet" style="text/css" href="../css/join.css"/>

<style type="text/css">

	#divi{
  		width: 960px;
  		height:700px; 
  		}

	form{
//	border: 0.6px solid gray;
	padding: 35px;
	
	}

	form>div{
		width:500px;
		height: 57px;
	}
	
	form>div>label{
	font-weight: bold;
	font-size: 15px;
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
    
    
    var form,id,pw,name,adress,phone,email;
    
    
 

   
    </script>
   
   
</head>
<body>


<%@ include file="../template/header.jspf" %>

<%@ include file="../template/join.jspf" %>
<p><strong>회원정보입력</strong></p>

	<form action="insert.jsp" >

	<div>

	<label>이름&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;</label>

	<input type="text" name="username" style="height:23px; width: 180px">
 
	</div>

	<div>

	<label>아이디*&emsp;&emsp;&emsp;&emsp;</label>

	<input type="text" name="userid" style="height:23px; width: 180px">

	<button>중복확인</button>
		
	<div id="checkMsg">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;아이디를 입력하세요.</div>



	</div>

	<div>

	<label>비밀번호*&emsp;&emsp;&emsp;</label>

	<input type="password" name="userpw" style="height:23px; width: 180px">

	</div>

	<div>

	<label>비밀번호 확인*&emsp;</label>

	<input type="password" name="userpw" style="height:23px; width: 180px">
	<div id="checkPwd">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;동일한 암호를 입력하세요.</div>

	

	</div>

	<div>

	<label>주소*&emsp;&emsp;&emsp;&emsp;&emsp;</label>

	<input type="text" name="useraddr" style="height:23px; width: 300px">

	</div>

	<div>

	<label>핸드폰번호*&emsp;&emsp;&nbsp;</label>

	<input type="text" name="userphone" style="height:23px; width: 180px">

	</div>

	<div>

	<label>이메일*&emsp;&emsp;&emsp;&emsp;</label>

	<input type="text" name="usermail" style="height:23px; width: 230px">
	</div>
	
	<table>
	<input type="submit" value="입 력"> 
	<input type="reset" value="취 소"> 
	
</table>
	

	</form>

	
	
		
	</div>
		</div>




<%@ include file="../template/footer.jspf" %>
</body>
</html>