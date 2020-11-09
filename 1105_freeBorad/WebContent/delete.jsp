<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="deleteOK.jsp" method="post">
	<table width="600" align="center" border="1" cellpadding="5" cellspacing="0"> 
	<tr> 
		<th colspan="4">게시글 삭제</th>
	</tr>
	<tr> 
		<th width="80">글번호</th>
		<th width="120">이름</th>
		<th width="320">작성일</th>
		<th width="80">조회수</th>
	</tr>
	<tr> 
	<jsp:useBean id="date" class="java.util.Date"/>
	<tr> 
		<td align="center"> ${vo.idx}</td>
		<td align="center">
			<c:set var="name" value="${fn:replace(fn:trim(vo.name),'<','&lt;') }"/>
			<c:set var="name" value="${fn:replace(name,'>','&gt;') }"/>
			${name} 
		</td>
		<td align="center">
			<c:if test="${date.year == vo.writeDate.year && date.month == vo.writeDate.month && date.date == vo.writeDate.date}">
				<fmt:formatDate value="${vo.writeDate}" pattern="HH:mm:ss"/>
			</c:if>
			<c:if test="${date.year != vo.writeDate.year || date.month != vo.writeDate.month || date.date != vo.writeDate.date}">
				<fmt:formatDate value="${vo.writeDate}" pattern="yyyy-MM-dd(E) HH:mm:ss"/>
			</c:if>
		</td>
		<td align="center">${vo.hit} </td>
	</tr>
	
	<tr>
		<td>제목</td>
		<td colspan="3">
			<c:set var="subject" value="${fn:replace(fn:trim(vo.subject),'<','&lt;') }"/>
			<c:set var="subject" value="${fn:replace(subject,'>','&gt;') }"/>
			${subject}
		</td>
	</tr>
	<tr>
		<td>내용</td>
		<td colspan="3">
			<c:set var="content" value="${fn:replace(fn:trim(vo.content),'<','&lt;') }"/>
			<c:set var="content" value="${fn:replace(content,'>','&gt;') }"/>
			<c:set var="content" value="${fn:replace(content,enter,'<br/>') }"/>
			${content}
		</td>
	</tr>
	<tr>
		<td colspan="4" align="center">  
			<input type="password" name="pw" placeholder="비밀번호"/>
			<input type="submit" value="삭제하기"/>
			<input type="reset" value="다시쓰기"/>
			<input type="button" value="돌아가기" onclick="history.back()"/>
			<input type="button" value="목록보기" onclick="location.href='list.jsp?currentPage=${currentPage}'"/>
			
			<!-- hidden으로 삭제할 글번호, 삭제 후 돌아갈 페이지 번호,  -->
			<input type="hidden" name="idx" value="${vo.idx}"/>
			<input type="hidden" name="currentPage" value="${currentPage}"/>
		</td>
	</tr>
	</table>
</form>
</body>
</html>