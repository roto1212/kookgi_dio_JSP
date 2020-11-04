<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.koreait.memolist.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출첵게시판</title>
</head>
<body>

<!-- 입력화면 설계 -->
<form action="memoInsert.jsp" method="post">
	<table width="1000" align="center" border="1" cellpadding="5" cellspacing="0">
		<tr>
			<th colspan="3">아주 많이 허접해 보이는 출첵게시판 ver.0.01</th>
		</tr>		
		<tr>
			<td width="100" align="center">이름</td>
			<td width="100" align="center">비밀번호</td>
			<td width="800" align="center">메모</td>
		</tr>
		<tr>
			<td align="center">
				<input type="text" name="name" size="7"/>
			</td>
			<td align="center">
				<input type="password" name="pw" size="7"/>
			</td>
			<td align="center">
				<input type="text" name="memo" size="98"/>
				<input type="submit" value="저장"/>
			</td>
		</tr>
	</table>
</form>
<!-- 입력화면 설계 끝 -->

<hr size="3" color="red"/>

<!-- 테이블에 저장된 글목록 전체를 글번호의 내림차순(최신글부터) 불러온다. -->
<%
	Connection conn = DBUtil.getMysqlConnection();
	String sql = "SELECT * FROM memolist ORDER BY idx DESC";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery(); // select처리한 데이터를 기억하는 인터페이스
	
//	ResultSet 객체에 다음글이 없을 때 까지 반복하며 글을 출력한다.
//	next(): ResultSet 객체에 저장된 다음 데이터로 접근한다. 다음데이터가 없으면 true, 없으면 false를 리턴한다.
	/*	
	if (rs.next()) {
		//테이블에 저장된 글이 있으면
		//위에서 한번 비교 했으므로 데이터를 한번 출력하고 다음글이 잇으면 반복을 하고 아니면 빠져나간다.
		do {
			out.println(rs.getInt("idx")+ ",");
			out.println(rs.getString("name")+ ",");
			out.println(rs.getString("pw")+ ",");
			out.println(rs.getString("memo")+ ",");
			out.println(rs.getTimestamp("writeDate")+ ",");
			out.println(rs.getString("IP")+ "<br/>");
		} while (rs.next());
	} else {
		//테이블에 저장된 글이 없으면 
		out.println("저장된 글이 없습니다.");
	}
	*/
	
%>
<table width="1200" align="center" border="1" cellpadding="5" cellspacing="0">
	<tr>
		<th width="80">글번호</th>
		<th width="80">이름</th>
		<th width="800">메모</th>
		<th width="120">작성일</th>
		<th width="120">IP</th>
	</tr>
	<%
	if(rs.next()) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd(E)");
		do {
	%>
		<tr>
			<td align="center"><%= rs.getInt("idx") %> </td>
			<td align="center"><%= rs.getString("name") %> </td>
			<td><%= rs.getString("memo") %> </td>
			<td align="center"><%= sdf.format(rs.getTimestamp("writeDate")) %> </td>
			<td align="center"><%= rs.getString("IP") %> </td>
		</tr>		
	<% 
		} while (rs.next());
	} else {
	%>	
		<tr>
			<td colspan="5">
			<marquee>저장된 글이 없습니다.</marquee>
			</td>
		</tr>
	<%
	}
	%>
</table>

</body>
</html>