<%@page import="com.bit.pro2.model.PageMaker"%>
<%@page import="com.bit.pro2.model.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
     pageEncoding="UTF-8" import="java.util.ArrayList"%> 
 <!DOCTYPE html> 
 <html> 
 <head> 
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
 <title>Insert title here</title>
 <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&amp;subset=korean" rel="stylesheet">
   <link rel="stylesheet" style="text/css" href="css/main.css"/>
   <link rel="stylesheet" style="text/css" href="css/join.css"/>
	
	 <style type="text/css"> 
	 
	 #divi{
	 	width: 960px;
  		height:700px; 
	 }
 	table{ 
 		width: 600px; 
 		border-collapse: collapse; 
 		
 	} 
 	table th, table td{ 
 	
 		height: 30px;
 	} 
 	
 	table tr:HOVER{ 
 		background-color: rgb(255,200,200); 
 	} 
 	 
 	td>a{ 
 		display: block; 
 		text-decoration: none;
 		text-align: center;
 		font-size: 14px;
 	} 
 	
 	td{
 	border-bottom: 1px solid #9EA2A2;
 	}
 	
 	#up{
 		border-bottom:1px solid #9EA2A2;
 		border-top:1px solid #9EA2A2;
 		color:	black;
 		height: 40px;
 		background-color: #D8D8D8;
 	}
 	
 	#sert{
 		width: 70px;
 		height: 40px;
 		background-color: yellow;
 		float: inherit;
 		 text-align: center;
 		border: 0.8px solid gray;
 	}
 	
 	#sert>a{
	color: black;
 	text-decoration: none;
 	margin: 20px 0 0 0;
 	
 	}
 a{
 	color: gray;
 
 }
 
 #ddd{
 	float: inherit;
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
 <script type="text/javascript"> 
 if(<%=request.getParameter("result")%>)alert(<%=request.getParameter("result")%>); 
  
 </script> 
 </head> 
 <% 
 	ArrayList<BoardDto> list=(ArrayList<BoardDto>)request.getAttribute("alist"); 
 %> 
 <% 
 	PageMaker pm= (PageMaker)request.getAttribute("pagemaker");
 	
 %> 
 <body> 
 
 <%@ include file="template/header.jspf" %>
 <%@ include file="template/advice.jspf" %>

 	<h1>강좌상담</h1> 
 	<table> 
 		<tr id="up"> 
 			<th>번호</th> 
 			<th>이름</th> 
 			<th>휴대폰번호</th> 
 			<th>제목</th> 
 	
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
 		
 		</tr> 
 		<%} %> 
 		
 	
 	</table> 
 	<!--  
 		<div class="text-center">
 			<ul class="pagination">
 			
 			
 			
 			<c:if BoardDto="${pageMaker.prev}">
 				<li><a href="list.bit?page=${pageMaker.startPage -1}">&laquo;</a></li>
 			</c:if>
 		
 			<c:forEach begin="${pageMaker.startPage}"
 			end="${pageMaker.endPage }" var="cri.page">
 			<li 
 			<c:out value="${pageMaker.cri.page==cri.page?'class=active':'' }"/>>
 			<a href="list.bit?page=${cri.page}">${cri.page} </a>
 			</li>
 			</c:forEach>
 			

		
 			<c:if BoardDto="${pageMaker.next && pageMaker.endPage >0 }">
 				<li><a href="list.bit?page=${pageMaker.endPage +1}">&raquo;</a></li>
 			</c:if>
 			
 			</ul>
 		</div>
 		 
 	 -->
 	<a href="add.bit" id="ddd">[입력]</a>
 	
 	</div>
 		</div>
 	
 	<%@ include file="template/footer.jspf" %>
 </body> 
 </html> 
