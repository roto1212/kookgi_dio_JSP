<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- include 디렉티브 %@를 사용해서 중복되는 jsp코드 삽입하기 -->
<%@ include file="loginTest.jsp" %>
<hr/>
<!-- include 액션태그를 사용해서 중복되는 jsp코드 삽입하기 -->
<jsp:include page="loginTest.jsp"></jsp:include>
<hr/>
<!-- 
	html은 <tag> ~ </tag> 사이에 아무런 내용을 쓸 필요가 없으면 </tag>을 생략해도 된다. 하지만 jsp 액션태그는 xml문법을 따르기 때문에 </tag>을 생략하면 에러가 발생한다. xml문법에서도 </tag>를 생략할 수 있는 시작태그의 ">"앞에 "/"를 입력해서 <tag />방식으로 사용한다.
 -->
 
 <jsp:include page="loginTest.jsp"/>
<hr/>
</body>
</html>