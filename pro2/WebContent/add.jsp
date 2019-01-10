<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>입력페이지</h1> 
 	<form action="insert.bit" method="post"> 
 		 
 		<div> 
 			<label for="name">name</label> 
 			<input type="text" name="name" id="name" /> 
 		</div> 
 		<div> 
 			<label for="pw">pw</label> 
 			<input type="text" name="pw" id="pw" /> 
 		</div> 
		<div> 
 			<label for="phone">phone</label> 
 			<input type="text" name="phone" id="phone" /> 
 		</div> 
 		<div> 
 			<label for="title">title</label> 
 			<input type="text" name="title" id="title" /> 
 		</div> 
 		<div> 
 			<label for="cont">content</label> 
 			<input type="text" name="cont" id="cont" /> 
 		</div> 
 	
 		<div> 
 			<button type="submit">입력</button> 
 			<button type="reset">취소</button> 
 			<button type="button">뒤로</button> 
 		</div> 
 	</form> 


</body>
</html>