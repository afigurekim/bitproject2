<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.bit.pro2.model.MemberDto" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개인정보수정</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&amp;subset=korean" rel="stylesheet">
<link rel="stylesheet" style="text/css" href="css/main.css"/>
<link rel="stylesheet" style="text/css" href="css/mypage.css"/>
<style type="text/css">

	#divi{
	  	width: 960px;
	  	height: 1050px; 
	}
	  		
	form{
	padding: 35px;
	}

	form>div{
		width: 500px;
		height: 50px;
	}
	
	form #addressBlock{
		width: 500px;
		height: 100px;
	}
	
	form>div>label{
	font-weight: bold;
	font-size: 15px;
	}
	
	form>div>input{
		width: 175px;
	}
	
	form>div #address{
		width: 360px;
	}
	
	form>div #postsearch{
		padding: 5px;
		width: 120px;
		font-size: 12px;
	}
	
	form .btn{
   		padding: 5px;
   		width: 100px;
   		font-size: 12px;	
	}
	
	
</style>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
    	$('#menu>ul>li').mouseover(function(){
    		$(this).children('ol').stop().slideDown(200);
    	}).mouseout(function() {
    		$(this).children('ol').stop().slideUp(200);
		});
    });
</script>
</head>
<body>
	<%@ include file="../template/header.jspf" %>

	<%@ include file="../template/mypage.jspf" %>
	<% String userid = (String) session.getAttribute("id"); %>
	<p><strong>개인정보수정</strong></p>
	<% String pwchk = (String) session.getAttribute("pwchk");
	if(pwchk==null || pwchk.equals("true")){}
	else if(pwchk.equals("false")) { %><div>*비밀번호가 일치하지 않습니다. 비밀번호를 동일하게 입력해주세요.</div> <% } %>
		<form action="myupdate.bit" method="post">
		<div><label>ID</label>&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;&nbsp;<%= userid %><input type="hidden" name="userid" value="<%= userid %>"/></div>
		<%
			ArrayList<MemberDto> list = (ArrayList<MemberDto>) request.getAttribute("alist");
			for(MemberDto bean : list){
		%>
		<div><label>이름</label>&emsp;&emsp;&emsp;&emsp;&emsp;<input type="text" name="username" value="<%= bean.getUsername() %>" placeholder="홍길동"/></div>
		<div><label>비밀번호</label>&emsp;&emsp;&emsp;&nbsp;<input type="password" name="userpw" value="<%= bean.getUserpw() %>" placeholder="비밀번호"/></div>
		<div><label>비밀번호 확인</label>&emsp;&nbsp;<input type="password" name="userpwchk" value="<%= bean.getUserpw() %>"placeholder="비밀번호"/></div>
		<div id="addressBlock">
			<label>주소</label>&emsp;&emsp;&emsp;&emsp;&ensp;&nbsp;
			<input type="text" name="addrcode" id="postcode" placeholder="우편번호"/>
			<input type="button" id="postsearch" onclick="execDaumPostcode()" value="우편번호 찾기"/><br />
			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;&nbsp;<input type="text" name="addrmain" id="address" value="<%= bean.getUseraddr() %>" placeholder="주소"/><br />
			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;&nbsp;<input type="text" name="addrdetail" id="detailAddress" placeholder="상세주소"/>
			<input type="text" name="addrextra" id="extraAddress" placeholder="참고항목"/>
		</div>
		
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script>
		    function execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var addr = ''; // 주소 변수
		                var extraAddr = ''; // 참고항목 변수
		
		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }
		
		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                    // 조합된 참고항목을 해당 필드에 넣는다.
		                    document.getElementById("extraAddress").value = extraAddr;
		                
		                } else {
		                    document.getElementById("extraAddress").value = '';
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('postcode').value = data.zonecode;
		                document.getElementById("address").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("detailAddress").focus();
		            }, 
		        	theme: {
		        		searchBgColor: "#044879", //검색창 배경색
		        		queryTextColor: "#FFFFFF" //검색창 글자색
		        	}
		        }).open();
		    }
		</script>
				
		<div><label>연락처</label>&emsp;&emsp;&emsp;&emsp;&nbsp;<input type="text" name="userphone" value="<%= bean.getUserphone() %>" placeholder="010-0000-0000"/></div>
		<div><label>이메일</label>&emsp;&emsp;&emsp;&emsp;&nbsp;<input type="text" name="usermail" value="<%= bean.getUsermail() %>" placeholder="honggildong@email.com"/></div>
		<input type="submit" class="btn" value="수정"/>
		<input type="button" class="btn" onclick="goBack()" value="취소"/>
		<script>
			function goBack(){
				window.history.back();
			}
		</script>
	</form>
	
	<%
		}
	%>

	</div>
	
	</div>
	
	<%@ include file="../template/footer.jspf" %>
</body>
</html>