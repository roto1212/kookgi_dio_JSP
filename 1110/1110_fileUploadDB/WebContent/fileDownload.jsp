<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 다운로드 페이지</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");	
	String uploadDir = application.getRealPath("/upload/");
	//list(): 지정된 디렉토리에 저장된 파일 이름 목록을 얻어온다.
	String[] files = new File(uploadDir).list();
	for (String file : files) {
		//	out.println(file + "<br/>");
%>
<!-- 서블릿을 요청하는 링크를 파일명에 건다.  -->
		<a href="<%=request.getContextPath()%>/downloadAction?file=<%=URLEncoder.encode(file, "UTF-8")%>"><%=file %></a><br/>
<%
	}
%>
<a href="index.jsp">돌아가기</a>
</body>
</html>