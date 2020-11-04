<%@page import="com.koreait.useBean.MemberVO"%>
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
	request.setCharacterEncoding("UTF-8");
//	member.jsp에서 넘어오는 데이터를 받는다.
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
	int age = Integer.parseInt(request.getParameter("age")) ;
	boolean gender = Boolean.parseBoolean(request.getParameter("gender")) ;
//	getRemoteAddr(): 접속자 IP주소를 받는다.
	String ip = request.getRemoteAddr();
	
	MemberVO vo  = new MemberVO();
	vo.setId(id);
	vo.setPw(pw);
	vo.setName(name);
	vo.setAge(age);
	vo.setGender(gender);
	vo.setIp(ip);
	
	out.println(vo + "<br/>");
%>

</body>
</html>