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
<style type="text/css">
	.button {
	  background-color: white;	/* 배경색 */
	  border: 0px solid black;	/* 테두리: 두께 종류 색깔 */
	  color: black;				/* 글자색 */
	  padding: 6px 6px;			/* 안여백: 높이 너비 */
	  text-align: center;		/* 텍스트정렬 */
	  text-decoration: none;	/* 텍스트장식 */
	  display: inline-block;	/* 같은줄에 표시 */
	  font-size: 15px;			/* 글자크기 */
	  margin: 4px 2px;			/* 바깥 여백 */
	  transition-duration: 0.4s;/* 투명도 변경시간 */
	  cursor: pointer;			/* 마우스 포인터 모양 */
	  width: 50px;				/* 가로크기 */
	  height: 35px;				/* 세로크기 */
	}

	.button1 {
	  background-color: white; 
	  color: #4CAF50; 
	  font-weight: bold;
	  border: 2px solid gray;
	}
																								
	.button2:hover {
	  background-color: #4CAF50;
	  color: white;
	}
	.button3 {
	  background-color: gray; 
	  color: black; 
	  border: 2px solid gray;
	}
	
		
</style>
</head>
<body>

<!-- 입력화면 설계 -->
<form action="memoInsert.jsp" method="post">
	<table width="1000" align="center" border="1" cellpadding="5" cellspacing="0">
		<tr>
			<th colspan="3">이제 그럭저럭 봐줄만한 출첵게시판 ver.0.49</th>
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
//	페이지 작업에 사용할 8개의 변수를 선언한다. 계산에 의한 값을 가져야 하는 변수는 0으로 초기화 한다.
 
	int pageSize = 10;		
	int totalCount = 0; 	
	int totalPage = 0; 		
	int currentPage = 1; 	
	int startNo = 0; 		
	int endNo = 0;			
	int startPage = 0;		// 페이지 이동 하이퍼링크 또는 버튼에 표시될 시작 페이지 번호
	int endPage = 0; 		// 페이지 이동 하이퍼링크 또는 버튼에 표시될 마지막 페이지 번호
	
	Connection conn = DBUtil.getMysqlConnection();
	String sql = "select count(*) from memolist";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	totalCount = rs.getInt(1);
	
//	out.println("테이블에 저장된 전체글의 개수: " + totalCount + "<br/>");
	totalPage = (totalCount - 1) / pageSize + 1;
//	out.println("전체 페이지 개수: " + totalPage + "<br/>");
	
	try {
		currentPage = Integer.parseInt(request.getParameter("currentPage")); 
		currentPage = currentPage > totalPage ? totalPage : currentPage;
		
	} catch (NumberFormatException e) {
		
	}
	
	startNo = (currentPage - 1) * pageSize ; 
	endNo = startNo + pageSize -1;
	endNo = endNo > totalCount ? totalCount : endNo;
	
	sql = "SELECT * FROM memolist ORDER BY idx DESC limit ?, ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, startNo);
	pstmt.setInt(2, pageSize);
	rs = pstmt.executeQuery(); 
	
%>
<table width="1200" align="center" border="1" cellpadding="5" cellspacing="0">
	<tr>
		<th width="80">글번호</th>
		<th width="80">이름</th>
		<th width="800">메모</th>
		<th width="120">작성일</th>
		<th width="120">IP</th>
	</tr>
	<tr>
		<td colspan="5" align="right">
			게시글 전체 <%=totalCount%>개(<%=currentPage %> / <%=totalPage %>)Page
		 </td>
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
	
	<tr> 
		<td colspan="5" align="center">
		<%
//		페이지 이동 버튼의 시작페이지 번호와 마지막 페이지 번호를 계산한다.		
		startPage = (currentPage - 1)  / 10 * 10 + 1 ;
		endPage = startPage +  9;
//		페이지 이동 버튼의 마지막 페이지 번호가 전체 페이지 수보다 커지면 존재하지 않는 페이지 번호가 표시되므로 마지막 페이지 번호를 전체 페이지 수로 변경한다.		
		endPage = endPage > totalPage ?  totalPage : endPage; 

//		맨 앞으로 버튼, 현재페이지가 1보다 크다면 이전페이지가 있다.
	    if (currentPage > 1) {
			%>
			<input type="button" class="button button2" value="맨앞" onclick="location.href='?currentPage=1'" title="첫 페이지로 이동하기"/>
			<% 
	    } else {
	    	%>
			<input type="button" class="button button3" value="맨앞" disabled="disabled" onclick="location.href='?currentPage=1'" title="첫 페이지 입니다."/>
			<%
	    }
//		10페이지 앞으로 이동 버튼을 출력한다.
//		startPage가 1보다 크다면 이전페이지 목록이 있다.
		if (startPage > 1) {
		%>
			<input type="button" class="button button2" value="이전" onclick="location.href='?currentPage=<%=startPage -1 %>'" title="이전 페이지 목록으로 이동하기"/>
		<%
		} else {
		%>
			<input type="button" class="button button3" value="이전" disabled="disabled" title="이미 첫 페이지 목록 입니다."/>
		<%
		}
		
		
//		10페이지 단위로 페이지 이동 버튼을 출력한다.		
		for (int i = startPage; i <= endPage; i++ ){
			if (currentPage == i) {
		%>		
				<input type="button" class="button button1" value="<%=i %>" disabled="disabled">
		<%
			} else {
		%>
				<input type="button" class="button button2" value="<%=i %>" onclick="location.href='?currentPage=<%=i %>'" >
		<% 
			}
		}
		
//		10페이지 뒤로 이동 버튼을 출력한다.
//		endPage가 totalPage보다 작다면 다음페이지 목록이 있다.
		if (endPage < totalPage) {
		%>
		
			<input type="button" class="button button2" value="다음" onclick="location.href='?currentPage=<%=endPage + 1 %>'" title="다음 페이지 목록으로 이동하기"/>
		<%
		} else {
		%>
			<input type="button" class="button button3" value="다음" disabled="disabled" title="이미 마지막 페이지 목록 입니다."/>
		<%
		}
//		맨 뒤로 버튼, 현재페이지가 totalPage보다 작다면 다음페이지 목록이 있다.
	    if (currentPage < totalPage) {
		%>
			<input type="button" class="button button2" value="맨뒤" onclick="location.href='?currentPage=<%=totalPage%>'" title="마지막 페이지로 이동하기"/>
		<% 
	    } else {
	    	%>
			<input type="button" class="button button3" value="맨뒤" disabled="disabled"  title="이미 마지막 페이지 입니다."/>
			<%
	    }
		%>
		</td>
	</tr>
	
	
</body>
</html>