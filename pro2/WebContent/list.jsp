<%@ page language="java" contentType="text/html; charset=UTF-8" 
     pageEncoding="UTF-8" import="java.util.ArrayList,pro2.model.BoardDto"%> 
 <!DOCTYPE html> 
 <html> 
 <head> 
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
 <title>Insert title here</title>
 <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&amp;subset=korean" rel="stylesheet">
   <link rel="stylesheet" style="text/css" href="../css/main.css"/>
   <link rel="stylesheet" style="text/css" href="../css/join.css"/>
	
	 <style type="text/css"> 
 	table{ 
 		width: 600px; 
 		border-collapse: collapse; 
 	} 
 	table th, table td{ 
 		border: 1px solid gray; 
 	} 
 	table tr:nth-child(2n){ 
 		background-color: rgb(200,200,200); 
	} 
 	table tr:HOVER{ 
 		background-color: rgb(255,200,200); 
 	} 
 	 
 	td>a{ 
 		display: block; 
 	} 
 </style> 
 <script type="text/javascript"> 
 if(<%=request.getParameter("result")%>)alert(<%=request.getParameter("result")%>); 
  
 </script> 
 </head> 
 <% 
 	ArrayList<BoardDto> list=(ArrayList<BoardDto>)request.getAttribute("alist"); 
 %> 
 <body> 
 
 <%@ include file="../template/header.jspf" %>
 <%@ include file="../template/introduce.jspf" %>

 	<h1>리스트 페이지</h1> 
 	<table> 
 		<tr> 
 			<th>번호</th> 
 			<th>이름</th> 
 			<th>휴대폰번호</th> 
 			<th>제목</th> 
 			<th>내용</th> 
 		</tr> 
		<% 
 		for(int i=0; i<list.size();i++){  
 		BoardDto bean=list.get(i); 
 		%> 
 		<tr> 
 			<td><a href="detail.bit?qnanum=<%=bean.getQnanum() %>"><%=bean.getQnanum() %></a></td> 
 			<td><a href="detail.bit?qnanum=<%=bean.getQnanum() %>"><%=bean.getQnaname() %></a></td> 
 			<td><a href="detail.bit?qnanum=<%=bean.getQnanum() %>"><%=bean.getQnaphone() %></a></td> 
 			<td><a href="detail.bit?qnanum=<%=bean.getQnanum()%>"><%=bean.getQnatitle() %></a></td> 
 			<td><a href="detail.bit?qnanum=<%=bean.getQnanum()%>"><%=bean.getQnacont() %></a></td> 
 		</tr> 
 		<%} %> 
 		 
 	</table> 
 	 
 	<a href="add.bit">[입력]</a> 
 	
 	<%@ include file="../template/footer.jspf" %>
 </body> 
 </html> 
