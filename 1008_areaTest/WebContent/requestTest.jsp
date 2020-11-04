<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request Area</title>
</head>
<body>
	requestTest.jsp입니다.<br>
	
	<%
//	out.println("일반변수: " + var + "<br>");  //var라는 일반변수를 선언하지 않았으므로 에러가 발생한다.
	out.println("areaTest.jsp 파일의 pageContext 영역변수: " + pageContext.getAttribute("pageContextVar") + "<br>");
	out.println("areaTest.jsp 파일의 request 영역변수: " + request.getAttribute("requestVar") + "<br>");
	out.println("areaTest.jsp 파일의 session 영역변수: " +  session.getAttribute("sessionVar")+ "<br>");
	out.println("areaTest.jsp 파일의 application 영역변수: " + application.getAttribute("applicationVar") + "<br>");
	%>
	
	<%--
	EL(Expression Language, 표현 언어) 내장 객체: jsp의 표현식(<%= ~ %>)을 대신해서 간단한 출력에 사용된다. => %{변수이름} 또는 %{객체이름.변수이름} => getter메소드를 사용한 효과가 있다.
	jsp를 사용해서 영역변수의 내용을 출력할 때 영역변수에 저장된 데이터가 없으면 null을 출력하지만 EL을 사용하면 아무것도 출력하지 않는다.
	 
	 영역 객체 => 영역이름Scope
	 --%>
	 <hr>
	 areaTest.jsp 파일의 pageContext 영역변수(jsp표현식): <%=pageContext.getAttribute("pageContextVar") %><br>
	 areaTest.jsp 파일의 pageContext 영역변수(EL): ${ pageContextScope.pageContextVar }<br>
	 areaTest.jsp 파일의 request 영역변수(EL): ${requestScope.requestVar }<br>
	 areaTest.jsp 파일의 session 영역변수(EL): ${sessionScope.sessionVar }<br>
	 areaTest.jsp 파일의 application 영역변수(EL): ${applicationScope.applicationVar }<br>
	 
</body>
</html>















