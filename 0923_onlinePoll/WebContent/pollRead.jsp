<%@page import="java.util.ArrayList"%>
<%@page import="com.koreait.onlinePoll.PollRead"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>online Poll</title>
</head>
<body>
<!-- 투표항목이 저장된 텍스트파일의 데이터를 읽어서 웹브라우저에 출력한다. -->
<%
//	D:\SDB\JSP\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\0923_onlinePoll
// 	=> 웹서비스가 구현되는 실제 경로
//	이클립스는 웹서비스가 구현되는 실제경로에 프로젝특 이름으로 폴더를 생성한 후 웹페이지를 실행한다.
//	getRealPath("/"): 웹서비스가 실행되는 서버의 실제경로를 얻어온다. "/"는 웹서비스가 실행되는 web의 root이다.
//	out.print(application.getRealPath("/"));
	String filepath = application.getRealPath("/") + "poll.txt";
//	out.print(filepath);
//	텍스트파일의 데이터를 읽어오는 메소드를 실행해서 리턴되는 결과를 배열목록에 저장한다.
	ArrayList<String> poll = PollRead.pollRead(filepath);
//	out.print(poll); 
//  읽어들인 텍스트 파일의 데이터 전체를 출력한다.
//	for (String str : poll) {
//		out.print(str + "<br>");
//	}
	
//	투표항목의 개수를 계산한다.
	int itemCount = (poll.size()-1)/2;
//	out.print(itemCount);
%>

<form action="pollWrite.jsp" method="post">
	<!-- cellpadding: 안여백,셀과 셀내부의 데이터와의 간격을 지정한다. 
	cellspacing: 셀간격,셀과 셀사이의 간격을 지정한다.
	 -->
	<table width="500" align="center" border="1" cellpadding="5" cellspacing="0"> 
	<!--  
		<tr>
			<th><%out.print(poll.get(0)); %></th>
			out.print( ); → '='로 대체
		</tr>
	-->
		<tr height="70">
			<th><%= poll.get(0) %></th>
		</tr>
		<!-- 투표항목의 개수만큼 반복하며 라디오버튼과 투표항목을 출력한다. -->
		<% 
		for (int i = 1; i <= itemCount; i++ ){
		%>
		
		<tr height="50">
			<td>
			 <!-- 
			 
			<%
			if( i==1 ){ 
			%>
				<input type="radio" name="poll" value="<%= i %>" checked="checked"><%= poll.get(i) %>
			<%
			} else {
			%>
				<input type="radio" name="poll" value="<%= i %>" ><%= poll.get(i) %>
			<%
			} 
			%>
			 -->
			
			<input type="radio" name="poll" value="<%= i %>" ><%= poll.get(i) %>
			</td>
		</tr>
		
		<%	
		}
		%>
		
		<tr height="50">
		 	<td align="center">
			 	<input type="submit" value="투표하기">
			 	<input type="button" value="결과보기" onclick="location.href='pollResult.jsp'">
		 	</td>
		</tr>
	</table>
	
</form>
</body>
</html>