<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.koreait.memolist.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memoDB</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
	String memo = request.getParameter("memo");
// 접속자 IP를 받는다.
	String ip = request.getRemoteAddr();
	
	
//	데이터베이스에 접속한다.
	Connection conn = DBUtil.getMysqlConnection();
	/*
//	Statement를 사용해서 넘겨받은 데이터를 테이블에 저장한다.
//	sql 명령을 만든다.
	String sql = "insert into memolist (name, pw, memo, ip) values('"+ name +"', '" + pw + "', '" + memo + "', '" + ip +"')";
//	String sql = String.format("insert into memolist (name, pw, memo, ip) values('%s', '%s', '%s', '%s')", name, pw, memo, ip);
//	out.println(sql);
//	Statement를 사용해서 sql 명령을 실행할 준비를 한다.
	Statement stmt = conn.createStatement();
//	sql명령을 실행한다. 
//	executeQuery(sql):테이블 갱신되지 않는 명령어(select)
//	executeUpdate(sql):테이블 갱신되지 않는 명령어(insert, delete, update)
	stmt.executeUpdate(sql);
	*/
//	PreparedStatement를 사용해서 넘겨받은 데이터를 테이블에 저장한다.
//	sql명령을 만든다. 
	String sql = "insert into memolist (name, pw, memo, ip) values(?, ?, ?, ?)";
//	PreparedStatement를 사용해서 sql명령을 임시로 실행한다.
	PreparedStatement pstmt = conn.prepareStatement(sql);
// 	?에 데이터를 넣어준다.
	pstmt.setString(1, name);
	pstmt.setString(2, pw);
	pstmt.setString(3, memo);
	pstmt.setString(4, ip);
//  sql명령을 실행한다.
	pstmt.executeUpdate();
	
	DBUtil.close(conn);
	
//	테이블에 저장된 데이터를 브라우저에 출력하기 위해서 memolist.jsp로 넘겨준다.
	response.sendRedirect("memoList4.jsp");
%>
</body>
</html>