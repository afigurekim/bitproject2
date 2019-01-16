<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&amp;subset=korean" rel="stylesheet">
   <link rel="stylesheet" style="text/css" href="./css/main.css"/>
    <link rel="stylesheet" style="text/css" href="./css/join.css"/>

<style type="text/css">
	#divi{
  		width: 960px;
  		height:700px; 
  		}
	form{
//	border: 0.6px solid gray;
	padding: 35px;
	
	}
	form>div{
		width:520px;
		height: 57px;
	}
	
	form>div>label{
	font-weight: bold;
	font-size: 15px;
	}
	
	form #addressBlock{
		width: 520px;
		height: 100px;
	}
</style>
   <script type="text/javascript" src="./js/jquery-1.12.4.js"></script>
    <script type="text/javascript">
    
   	function idcheck2(){
   		var sid=document.getElementsByName("userid");
   		alert(sid[0].value);
   /*			var sid=document.getElementById("userid");
   			alert(sid.value);
   	*/	
   		$.ajax({
   			url:"/pro2/idcheck.bit",
   			data:{
   				userid:sid[0].value
   			},
   			success:function(data){
   				alert(data);
   				
   				if(data==0){
   					alert("아이디 사용가능합니다");
   				}else{
   					alert("이미 사용 중인 아이디 입니다.");
   				}
   				
   			}
   			
   		})
   		
   	}
   	
   	
   	function pwcheck2(){
   		var spw=document.getElementById("userpw");
   		var spwchk=document.getElementById("userpwck");
   		
   		if(spw.value!=''&& spwchk.value!=''){
   			if(spw.value==spwchk.value){
   				document.getElementById("same").innerHTML='비밀번호가 일치합니다';
   				document.getElementById("same").style.color='blue';
   			}else{
   				document.getElementById("same").innerHTML='비밀번호가 일치하지않습니다.';
   				document.getElementById("same").style.color='red';
   			}
   		}
   		
   	}
    
    
   	if(<%=request.getParameter("result")%>)alert(<%=request.getParameter("result")%>);
    </script>
</head>
<body>


<%@ include file="/template/header.jspf" %>

<%@ include file="/template/join.jspf" %>
<p><strong>회원정보입력</strong></p>

	<form action="insertjoin.bit" method="post"
		  name="userInfo" onsubmit="return checkValue()">

	<div>

	<label>이름&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;</label>

	<input type="text" name="username" style="height:23px; width: 180px">
 
	</div>

	<div>

	<label>아이디*&emsp;&emsp;&emsp;&emsp;</label>

	<input type="text" name="userid" id="userid" style="height:23px; width: 180px">

	<input type="button" value="중복확인" onclick="idcheck2()">
	
		
	<div id="checkMsg">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;아이디를 입력하세요.</div>



	</div>

	<div>

	<label>비밀번호*&emsp;&emsp;&emsp;</label>

	<input type="password" name="userpw" id="userpw" style="height:23px; width: 180px" onchange="pwcheck2()">

	</div>

	<div>

	<label>비밀번호 확인*&emsp;</label>

	<input type="password" name="userpwck" id="userpwck"  style="height:23px; width: 180px" onchange="pwcheck2()">&ensp;<span id="same"></span>
	<div id="checkPwd">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;동일한 암호를 입력하세요.</div>

	

	</div>
	
	<div id="addressBlock" style="padding: 10px 0px">
			<label>주소*</label>&emsp;&emsp;&emsp;&emsp;&ensp;&nbsp;
			<input type="text" name="addrcode" id="postcode" style="height:23px; width: 180px" />
			<input type="button" id="postsearch" onclick="execDaumPostcode()" value="우편번호 찾기"/><br />
			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;&ensp;<input type="text" name="addrmain" id="address" style="height:23px; width: 360px" /><br />
			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;&ensp;<input type="text" name="addrdetail" id="detailAddress" style="height:23px; width: 180px" />
			<input type="text" name="addrextra" id="extraAddress" style="height:23px; width: 180px" />
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

	<div>

	<label>핸드폰번호*&emsp;&emsp;&nbsp;</label>

	<input type="text" name="userphone" style="height:23px; width: 180px">

	</div>

	<div>

	<label>이메일*&emsp;&emsp;&emsp;&emsp;</label>

	<input type="text" name="usermail" style="height:23px; width: 230px">
	</div>
	
	<table>
	<input type="submit" value="입 력" > 
	<input type="reset" value="취 소"> 
	
</table>
	

	</form>

	
	
		
	</div>
		</div>




<%@ include file="/template/footer.jspf" %>
</body>
</html>
