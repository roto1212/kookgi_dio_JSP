<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

//	pageContext.setAttribute("var", "scopeTest.jsp 파일의 pageContext 영역변수");
	request.setAttribute("var", "scopeTest.jsp 파일의 request 영역변수");
//	session.setAttribute("var", "scopeTest.jsp 파일의 session 영역변수");
//	application.setAttribute("var", "scopeTest.jsp 파일의 application 영역변수");
%>

<!--
	영역변수에 저장된 데이터를 얻어올 때 영역이름Scope 객체를 사용하지 않고 변수이름만 사용하면 EL은 pageContext => request => session => application 영역을 순서대로 검사해서 얻어오려는 변수가 존재할 경우 변순에 저장된 값을 얻어온다.
-->

${var }<br>
${pageContextScope.var }<br>
${requestScope.var }<br>
${sessionScope.var }<br>
${applicationScope.var }<br>
</body>
</html>