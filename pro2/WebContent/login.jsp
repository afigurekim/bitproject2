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
	<div id="hh">
	<form  method="post">
				<div>
					<label for="id">id</label><input type="text" name="userid" id="id" />
				</div>
				<div>
					<label for="pw">pw</label><input type="password" name="userpw" id="pw" />
				</div>
				<div>
					<button type="submit">로그인</button>
					<button type="reset">취소</button>
				</div>
			</form>
		</div>	
			
			
			</div>
		</div>


 <%@ include file="template/footer.jspf" %>
</body>
</html>