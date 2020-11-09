<%@page import="com.koreait.service.FreeboardCommentService"%>
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
		int mode = Integer.parseInt(request.getParameter("mode"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage")); 
		
	%>
	<jsp:useBean id="vo" class="com.koreait.vo.FreeboardCommentVO">
		<jsp:setProperty property="*" name="vo"/>
	</jsp:useBean>
	
	<%
	
	FreeboardCommentService service =  FreeboardCommentService.getInstance();
	// contentView.jsp에서 넘어온 mode에 따라 1은 댓글저장, 2는 댓글 수정, 3은 댓글삭제 작업을 실행한다.
	out.println("<script>");
	switch (mode) {
	case 1: // 댓글을 저장하는 메소드를 호출한다.
		if (service.insertComment(vo)) {
			out.println("alert('댓글저장 성공')");
		} else {
			out.println("alert('댓글저장 실패')");
		}
		break;
	case 2: // 댓글을 수정하는 메소드를 호출한다.
		if (service.updateComment(vo)) {
			out.println("alert('댓글수정 성공')");
		} else {
			out.println("alert('댓글수정 실패')");
		}
		
		break;
	case 3: // 댓글을 삭제하는 메소드를 호출한다.
		if (service.deleteComment(vo)) {
			out.println("alert('댓글삭제 성공')");
		} else {
			out.println("alert('댓글삭제 실패')");
		}
		break;
	}
	// 댓글 저장, 수정, 삭제가 완료되면 댓글 작업을 하던 메인글이 화면에 표시되어야 하므로 메인글을 얻어오는 selectByIdx.jsp로 넘겨준다.
	// idx=" + vo.getRef(): 댓글을 수정, 삭제하기 위해 선택하면 idx가 1번부터 시작되도록 변경되기 때문에 idx와 같은 ref를 만들어 수정 삭제가 완료되면 ref로 idx를 변경한다. 
	out.println("location.href='selectByIdx.jsp?idx=" + vo.getRef() + "&currentPage=" + currentPage + "&job=contentView'");
	out.println("</script>");
	
	
	%>
</body>
</html>