<%@page import="com.koreait.service.FreeboardService"%>
<%@page import="com.koreait.vo.FreeboardVO"%>
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
	int currentPage = Integer.parseInt(request.getParameter("currentPage")); 
	%>
	<jsp:useBean id="vo" class="com.koreait.vo.FreeboardVO">
		<jsp:setProperty property="*" name="vo"/>
	</jsp:useBean>
	
	<%
		FreeboardService service = FreeboardService.getInstance();
		FreeboardVO original = service.selectByIdx(vo.getIdx());	//넘어온 글과 관련정보 1건이 저장된 변수
		//삭제글 비밀번호와 입력비밀번호 비교
		out.println("<script>");
		if(original.getPw().trim().equals(vo.getPw().trim())) {	// 넘어온 패스워드와 원래 패스워드 비교
			service.delete(vo.getIdx());
			out.println("alert('"+vo.getIdx()+"번글 삭제 완료')");
		} else {
			out.println("alert('비밀번호가 일치하지 않습니다.')");
		}
		//selectByIdx.jsp?idx=2&currentPage=26&job=delete
		out.println("location.href='list.jsp?currentPage=" + currentPage + "'");
		out.println("</script>");
		
	%>
</body>
</html>