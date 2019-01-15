<%@ page language="java" contentType="text/html; charset=UTF-8" 
     pageEncoding="UTF-8" import="com.bit.pro2.model.BoardDto"%> 
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
  		height:1000px; 
  	} 
  	#ftable{
  		width: 650px;
  		height: 400px;
  	//	border: 1px solid red;
  		
  	}
  	
  	#ftable>tr{
  		border-bottom:  1px solid gray;
  		
  	}
  	
  	#ftable>tr>td{
  	
  		border-bottom: 1px solid gray;
  	}
  	
 
  	
  	#first,#second{
  	
  		border-bottom: 1px solid gray;
  		
  	}
  	
  	#second{
  	width:150px;
 }
 	#first,#firsttitle,#firstnum,#firstreq{
 	font-size: 15px;
  		font-weight: bold;
  		width: 100px;
  		height: 22px;
  		text-align: center;
  		background-color: #E6E6E6;
 	}
 	
 	#second,#secondtitle, #secondnum{
 	 text-align: center;
 	}
 	
 	#secondtitle,#secondnum{
 	width: 550px;
 	}
 	
 	#firsttitle,#secondtitle{
 	
 	border-top:1.3px solid #A4A4A4;
 	}
 	
 	#firsttitle,#secondtitle,#firstnum,#secondnum{
 	border-bottom: 1.3px solid #A4A4A4;
 	}
 	
 	#secondcont{
 		margin: 10px 0 0 10px;
 		height: 200px;
 		
 	}
 	
 	#ed{
 		text-decoration: none;
 		
 	}
 	
 	#stable{
 		width: 650px;
  		height: 90px;
 	}
 	
 	#reqcont{
 		width: 550px;
 		height: 100px;
 		margin: 5px 5px 5px 5px;
 	}
 </style> 
 <script type="text/javascript" src="js/jquery-1.12.4.js"></script>
 <script type="text/javascript"> 
 	window.onload=function(){ 
 		var backbtn=document.querySelectorAll('a')[2]; 
 		backbtn.onclick=function(){ 
 			window.history.back(); 
 			return false; 
 		} 
 	}; 
 	
    $(document).ready(function(){
    	$('#menu>ul>li').mouseover(function(){
    		$(this).children('ol').stop().slideDown(200);
    	}).mouseout(function() {
    		$(this).children('ol').stop().slideUp(200);
			
		});
 </script> 
 </head> 
 
 <% 
 	BoardDto dto=(BoardDto)request.getAttribute("bean"); 
 %> 
 <body> 
  <%@ include file="template/header.jspf" %>
 <%@ include file="template/advice.jspf" %>
 
 	<h1>상세 페이지</h1>
		<table cellspacing="0" id="ftable">
			<tr>
				<td id="firsttitle">제목</td>
				<td id="secondtitle" colspan="3" ><%=dto.getQnatitle() %></td>
			</tr>
			<tr>
				<td id="firstnum">번호</td>
				<td id="secondnum" colspan="3"><%=dto.getQnanum() %></td>
			</tr>
			<tr>
				<td id="first">이름</td>
				<td id="second"><%=dto.getQnaname() %></td>
				<td id="first">휴대폰번호</td>
				<td id="second"><%=dto.getQnaphone() %></td>
			</tr>
			<tr style="margin: 10px 0 0 0;">
				<td id="secondcont" colspan="4" style="border:1px solid gray; margin: 10px 0 0 0;"><%=dto.getQnacont() %></td>
			</tr>
			
		</table> 
 	
 		<table id="stable">
 			<tr >
				<%
 					/* CSH 2019/01/15 */
	 				String strreq = "";
	 				if(dto.getQnaresp()==null){
	 					strreq = "답변 대기중 입니다.";
	 				}else{
	 					strreq = dto.getQnaresp();
	 				}
	 			%>
				<td id="firstreq">답글</td>
				<td id="secondreq"><textarea type="text" name="reqcont" id="reqcont" readonly="readonly"><%=strreq %></textarea></td>
			</tr>
		</table>
 	<div>
 		<a href="edit.bit?num=<%=dto.getQnanum() %>" id="ed">[수정]</a> 
 		<a href="delete.bit?num=<%=dto.getQnanum() %>" id="ed">[삭제]</a> 
 		<a href="#" id="ed">[뒤로]</a> 
 	</div>
 	
 	</div>
 		</div>
 
 	<%@ include file="template/footer.jspf" %>
 </body> 
 </html> 
