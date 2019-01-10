<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&amp;subset=korean" rel="stylesheet">

   <link rel="stylesheet" style="text/css" href="../css/main.css"/>

    <link rel="stylesheet" style="text/css" href="../css/join.css"/>



<style type="text/css">



	#divi{

  		width: 960px;

  		height:950px; 

  		}



	form{

//	border: 0.6px solid gray;

	padding: 35px;

	

	}



	form>div{

		width:500px;

		height: 50px;

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

    



   

    </script>

   

   

</head>

<body>





<%@ include file="../template/header.jspf" %>
<%@ include file="../template/join.jspf" %>


<%
String name=request.getParameter("username");
String id=request.getParameter("userid");
String pw=request.getParameter("userpw");
String addr =request.getParameter("useraddr");
String phone =request.getParameter("userphone");
String mail =request.getParameter("usermail");




String driver="oracle.jdbc.driver.OracleDriver"; 
String url="jdbc:oracle:thin:@localhost:1521:xe"; 
String user="scott"; 
String password="tiger"; 
String result="입력 실패"; 
String sql="INSERT INTO MEMBER(USERNUM,USERNAME,USERID,USERPW,USERADDR,USERPHONE,USERMAIL) VALUES(MEMBER_SEQ.NEXTVAL,?,?,?,?,?,?)";

Connection conn=null; 
PreparedStatement pstmt=null; 


try{
	Class.forName(driver);
	conn=DriverManager.getConnection(url,user,password);
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, id);
	pstmt.setString(3, pw);
	pstmt.setString(4, addr);
	pstmt.setString(5, phone);
	pstmt.setString(6, mail);
	
	pstmt.executeUpdate();
}catch(Exception e){
	
}finally{
	if(pstmt!=null)pstmt.close(); 
	if(conn!=null)conn.close(); 

	
}



%>


<%@ include file="../template/footer.jspf" %>
</body>
</html>