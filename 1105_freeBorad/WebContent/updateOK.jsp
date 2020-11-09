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
		//수정글 비밀번호와 입력비밀번호 비교
		FreeboardVO original = service.selectByIdx(vo.getIdx());	//넘어온 글과 관련정보 1건이 저장된 변수
		out.println("<script>");
		if(original.getPw().trim().equals(vo.getPw())) {	// 넘어온 패스워드와 원래 패스워드 비교
//			공지글을 내용만 수정하고 전송버튼을 클릭하면 체크박스에 체크가 되어 있을 경우 value 속성이 지정되지 않으면 "on"이 넘어오므로 그대로 공지글 상태를 유지하기 위해서 notice멤버변수를 "notice"로 수정한다.
			if (vo.getNotice().equals("on") ){
				vo.setNotice("notice");
			} 
			service.update(vo);
			out.println("alert('"+vo.getIdx()+"번글 수정 완료')");
		} else {
			out.println("alert('비밀번호가 일치 하지 않습니다.')");
			
		}
		//selectByIdx.jsp?idx=2&currentPage=26&job=delete
		out.println("location.href='list.jsp?currentPage="+currentPage + "'");
		out.println("</script>");
		
	%>

</body>
</html>