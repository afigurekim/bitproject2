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
   
   <style type="text/css">
   
   #out{
   	width: 300px;
   	height: 100px;
   	border: 2px solid black;
   	padding: 80px;
   	margin: 100px 0 0 10px;
   }
   
   #out>div{
   	height: 40px;
   }
   
   #out>div>label{
   	font-weight: bold;
   }
   

   
   #button{
   	margin: 15px; 
   }
   
   </style>
   

     <script type="text/javascript" src="./js/jquery-1.12.4.js"></script>
     <script type="text/javascript">
     	$(function(){
     		$("#hh>form").submit(function(e){
     			alert("안녕하세요");

     			e.preventDefault();
     			
     			$.getJSON("/pro2/login.bit",$(this).serialize(),function(data){
     				
     				if(data==1){
     					
     					location.href="main.jsp";
     				}else{
     					alert("로그인실패");
     				}
     				
     			});
     			
     		});
     	});
     	
    
     	
     </script>
   
   
</head>
<body>
 <%@ include file="template/header.jspf" %>
 <%@ include file="template/advice.jspf" %>
 <h1>로그인</h1>
	<div id="hh">
	<form  method="post">
			<div id="out">
				<div>
					<label for="id">아이디&nbsp;&emsp;&emsp;</label><input type="text" name="userid" id="id" style="width:180px; height:20px;"/>
				</div>
				<div>
					<label for="pw">비밀번호&nbsp;&emsp;</label><input type="password" name="userpw" id="pw" style="width:180px; height:20px;"/>
				</div>
				<div>
					<button type="submit">로그인</button>
					<button type="reset">취소</button>
				</div>
			</div>
			
			</form>
		</div>	
			
			
			</div>
		</div>


 <%@ include file="template/footer.jspf" %>
</body>
</html>