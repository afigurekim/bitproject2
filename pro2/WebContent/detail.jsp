<%@ page language="java" contentType="text/html; charset=UTF-8" 
     pageEncoding="UTF-8" import="pro2.model.BoardDto"%> 
 <!DOCTYPE html> 
 <html> 
 <head> 
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
 
 <title>Insert title here</title>
 
 <style type="text/css"> 
 	div>div{ 
 		display: inline-block; 
 	} 
 	div>div:first-child{ 
 		width: 150px; 
 		background-color: gray; 
 	} 
 	div>div:last-child{ 
 		border-bottom: 3px solid gray; 
 		box-sizing:border-box; 
 		width: 450px; 
 	} 
 </style> 
 <script type="text/javascript"> 
 	window.onload=function(){ 
 		var backbtn=document.querySelectorAll('a')[2]; 
 		backbtn.onclick=function(){ 
 			window.history.back(); 
 			return false; 
 		} 
 	}; 
 </script> 
 </head> 
 
 <% 
 	BoardDto dto=(BoardDto)request.getAttribute("bean"); 
 %> 
 <body> 
 
 	<h1>상세 페이지</h1> 
 	<div> 
 		<div>번호</div> 
 		<div><%=dto.getQnanum() %></div> 
 	</div> 
 	<div> 
 		<div>이름</div> 
 		<div><%=dto.getQnaname() %></div> 
 	</div> 
 	<div> 
 		<div>휴대폰번호</div> 
 		<div><%=dto.getQnaphone() %></div> 
 	</div> 
 	<div> 
 		<div>제목</div> 
		<div><%=dto.getQnatitle() %></div> 
 	</div> 
 	<div> 
 		<div>내용</div> 
 		<div><%=dto.getQnacont() %></div> 
 	</div> 
 	<div> 
 		<a href="edit.bit?num=<%=dto.getQnanum() %>">수정</a> 
 		<a href="delete.bit?num=<%=dto.getQnanum() %>">삭제</a> 
 		<a href="#">뒤로</a> 
 	</div> 
 	
 
 </body> 
 </html> 
