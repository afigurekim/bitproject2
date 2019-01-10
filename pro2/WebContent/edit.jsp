<%@page import="pro2.model.BoardDto"%>
<%@page import="pro2.model.BoardDao"%>
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
 	<form action="update.bit" method="post"> 
 	
 	<%
 		BoardDto dto=(BoardDto)request.getAttribute("a");
 	%>
 		<div> 
 			<label for="num">num</label> 
 			<input type="text" name="num" id="name" value=<%=dto.getQnanum()%>    readonly="readonly"/> 
 		</div> 
 		
 		<div> 
 			<label for="name">name</label> 
 			<input type="text" name="name" id="name" value="<%=dto.getQnaname()%> "   readonly="readonly"/> 
 		</div> 
 	
		<div> 
 			<label for="phone">phone</label> 
 			<input type="text" name="phone" id="phone" value="<%=dto.getQnaphone()%>"  readonly="readonly"/> 
 		</div> 
 		<div> 
 			<label for="title">title</label> 
 			<input type="text" name="title" id="title" value="<%=dto.getQnatitle() %>"/> 
 		</div> 
 		<div> 
 			<label for="cont">content</label> 
 			<input type="text" name="cont" id="cont" value="<%=dto.getQnacont() %>"/> 
 		</div> 
 	
 		<div> 
 			<button type="submit">수정</button> 
 			<button type="reset">취소</button> 
 			<button type="button">뒤로</button> 
 		</div> 
 	</form> 


</body>
</html>