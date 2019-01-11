<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>


  <script type="text/javascript" src="/js/jquery-1.12.4.js"></script>   
    <script type="text/javascrip">
		function goPage(pageNo){
			var f=document.frm;
		f.method="post"
		f.action="/board/list.do?pageNo="+pageNo+"&act=list";
		f.submit();



	</script>
</head>
<body>
	<form name="frm" id="frm">
		<div class="board-page text-center">
			<ul class="pagination">
				<li>
				<!-- 처음페이지 -->
					<a href="javascript:goPage(${pageVO.firstPageNo })"><span></span></a>
				<!-- 이전페이지 -->
					<a href="javascript:goPage(${pageVO.prevPageNo })"><span></span></a>
			<c:forEach var="i" begin="${startPageNo}" end="${endPageNo}" step="1">
			<c:choose>
				<c:when test="${i eq pageVO.pageNo}">
					<a href="javascript:goPage(${i})" calss="choice">${i}}</a></c:when>
				<c:otherwise><a href="javascript:goPage(${i})"></a></c:otherwise>
			</c:choose>
			</c:forEach>
			</li>
			<li class="a">
				<!-- 다음페이지 -->
				<a href="javascript:goPage(${pageVO.nextPageNo})"><span class="glyphocon"></span></a>
				<!-- 마지막페이지 -->
				<a href="javascript:goPage(${pageVO.fianlPageNo})"><span class="glyphocon"></span></a>
			</li>
			</ul>
		</div>
	</form>

</body>
</html>