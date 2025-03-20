<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>boardList.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
    <style>
    a {text-decoration: none}
    a:hover {
      text-decoration: underline;
      color: orange;
    }
  </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<jsp:include page="/WEB-INF/views/include/slide2.jsp" />
<p><br/></p>
<div class="container">
  <h2 class="text-center">게 시 판 리 스 트</h2>
  <table class="table table-borderless m-0 p-0">
  	<tr>
  		<td><a href="" class="btn btn-success btn-sm ">글쓰기</a></td>
  	</tr>
  </table>
  <table class="table table-hover text-center m-0 p-0">
  	<tr>
  		<th>글번호</th>
  		<th>글제목</th>
  		<th>글쓴이</th>
  		<th>글쓴날짜</th>
  		<th>조회수(좋아요)</th>
  	</tr>
  	<c:forEach var="vo" items="${vos }" varStatus="st">
  		<tr>
  			<td>${curScrStartNo}</td>
  			<td><a href="boardContent?idx=${vo.idx}">${vo.title }</a></td>
  			<td>${vo.nickName }</td>
  			<td>${vo.WDate }</td>
  			<td>${vo.readNum}(${vo.good })</td>
  		</tr>
  	</c:forEach>
  </table>
  <br/>
  
  	<!-- 블록페이지 시작(1블록의 크기를 3개(3Page)로 한다. -->
	<div class="text-center">
	  <ul class="pagination justify-content-center">
	    <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="memberList?pag=1">첫페이지</a></li></c:if>
	  	<c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="memberList?pag=${(curBlock-1)*blockSize+1}">이전블록</a></li></c:if>
	  	<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}" varStatus="st">
		    <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link bg-secondary border-secondary" href="memberList?pag=${i}">${i}</a></li></c:if>
		    <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="memberList?pag=${i}">${i}</a></li></c:if>
	  	</c:forEach>
	  	<c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="memberList?pag=${(curBlock+1)*blockSize+1}">다음블록</a></li></c:if>
	  	<c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="memberList?pag=${totPage}">마지막페이지</a></li></c:if>
	  </ul>
	</div>
	<!-- 블록페이지 끝 --> 
  
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>