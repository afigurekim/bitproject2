<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&amp;subset=korean" rel="stylesheet">
   <link rel="stylesheet" style="text/css" href="./css/main.css"/>
    <link rel="stylesheet" style="text/css" href="./css/join.css"/>

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
		width:520px;
		height: 57px;
	}
	
	form>div>label{
	font-weight: bold;
	font-size: 15px;
	}





</style>
   <script type="text/javascript" src="./js/jquery-1.12.4.js"></script>
    <script type="text/javascript">
    
   	function idcheck2(){
   		var sid=document.getElementsByName("userid");
   		alert(sid[0].value);
   /*			var sid=document.getElementById("userid");
   			alert(sid.value);
   	*/	
   		$.ajax({
   			url:"/pro2/idcheck.bit",
   			data:{
   				userid:sid[0].value
   			},
   			success:function(data){
   				alert(data);
   				
   				if(data==0){
   					alert("아이디 사용가능합니다");
   				}else{
   					alert("이미 사용 중인 아이디 입니다.");
   				}
   				
   			}
   			
   		})
   		
   	}
   	
   	
   	function pwcheck2(){
   		var spw=document.getElementById("userpw");
   		var spwchk=document.getElementById("userpwck");
   		
   		if(spw.value!=''&& spwchk.value!=''){
   			if(spw.value==spwchk.value){
   				document.getElementById("same").innerHTML='비밀번호가 일치합니다';
   				document.getElementById("same").style.color='blue';
   			}else{
   				document.getElementById("same").innerHTML='비밀번호가 일치하지않습니다.';
   				document.getElementById("same").style.color='red';
   			}
   		}
   		
   	}
    
    
    
    </script>
</head>
<body>


<%@ include file="/template/header.jspf" %>

<%@ include file="/template/join.jspf" %>
<p><strong>회원정보입력</strong></p>

	<form action="insertjoin.bit" method="post"
		  name="userInfo" onsubmit="return checkValue()">

	<div>

	<label>이름&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;</label>

	<input type="text" name="username" style="height:23px; width: 180px">
 
	</div>

	<div>

	<label>아이디*&emsp;&emsp;&emsp;&emsp;</label>

	<input type="text" name="userid" id="userid" style="height:23px; width: 180px">

	<input type="button" value="중복확인" onclick="idcheck2()">
	
		
	<div id="checkMsg">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;아이디를 입력하세요.</div>



	</div>

	<div>

	<label>비밀번호*&emsp;&emsp;&emsp;</label>

	<input type="password" name="userpw" id="userpw" style="height:23px; width: 180px" onchange="pwcheck2()">

	</div>

	<div>

	<label>비밀번호 확인*&emsp;</label>

	<input type="password" name="userpwck" id="userpwck"  style="height:23px; width: 180px" onchange="pwcheck2()">&ensp;<span id="same"></span>
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
	<input type="submit" value="입 력" > 
	<input type="reset" value="취 소"> 
	
</table>
	

	</form>

	
	
		
	</div>
		</div>




<%@ include file="/template/footer.jspf" %>
</body>
</html>