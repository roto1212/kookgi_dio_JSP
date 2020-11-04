<%@page import="javax.websocket.SendResult"%>
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
//	login버튼이 클릭되면 넘어오는 데이터(id, pw)
	String id = "";
	String pw = "";
	try {
		id = request.getParameter("id").trim();
		pw = request.getParameter("pw").trim();
		
 	} catch(NullPointerException e) {	} 
	
//	id가 hong 이고 password가 123456이면 로그인 처리한다.
	out.println("<script>");
	
	if (id.equals("hong") && pw.equals("123456")){
		//로그인처리
		//로그인 되었으므로 로그인 정보를 session에 저장한다.
		session.setAttribute("id", id);
		session.setAttribute("name", "관리자");
		session.setAttribute("login", "yes");
		out.println("alert('"+ session.getAttribute("name")+"님 환영합니다.')");
		
	} else if (id.length() + pw.length() != 0) {
		//에러 메시지
		out.println("alert('일치하는 정보가 없습니다.')");
	}
	out.println("</script>");
	//로그아웃 버튼이 클릭되면 넘어오는 데이터(logout)를 받는다.
	String logout = request.getParameter("logout");
	
	//로그아웃 정보가 넘어왔으면 로그아웃 처리를 한다.
	if (logout != null && logout.trim().equals("yes")){
		out.println("<script>");
		out.println("alert('"+ session.getAttribute("name")+"님 잘가요.')");
		out.println("</script>");
		//로그아웃되었으므로 session에서 로그인 정보를 제거한다.
		session.removeAttribute("id");
		session.removeAttribute("name");
		session.removeAttribute("login");
	}
	
	// session에서 로그인 정보를 읽어와서 로그인 상태, 로그아웃 상태의 화면을 브라우저에 표시한다.
	String login = (String) session.getAttribute("login");
	if (login != null && login == "yes") {
		// 로그인 상태일경우 브라우저에 표실되 내용
%>		
		로그인 성공<br>
		<%= session.getAttribute("name") %>님 안녕하세요.<br>
		${name }님 오늘도 못생기셨네요.<br>
		
		관리자 모드 <input type="button" value="로그아웃" onclick="location.href='?logout=yes'"> 

		
<% 

	} else {
%>
		<!-- 로그아웃 상태일 경우 브라우저에 표실될 내용 -->
		<form action="?" method="post">
		
		<table width="300" border="1" collpadding="5" cellspacing="0">
			<tr>
				<td width="50" align="right">
					<label for="id">ID</label>
				</td>
				<td width="250">
					<input id="id" type="text" name="id">
				</td>	
			</tr>
			<!--  
			<tr> 	
				<td colspan="2">
					<label>
						ID <input type="text" name="id">
					</label>
				
				</td>
			</tr>
			-->
			
			<tr>
				<td width="50" align="right">
					<label for="pw">PW</label>
				</td>
				<td width="250">
					<input id="pw" type="text" name="pw">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="Login" name="login">
				</td>
			</tr>
			
		</table>
		</form>

	<% 
	}
	%>
</body>
</html>