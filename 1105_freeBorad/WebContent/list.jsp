<%@page import="com.koreait.service.FreeboardCommentService"%>
<%@page import="com.koreait.vo.FreeboardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.koreait.vo.FreeboardList"%>
<%@page import="com.koreait.service.FreeboardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글목록처리</title>
</head>
<body>
<!-- list.jsp는 insertOK.jsp에서 넘어오는 데이터를 저장해서 리스트 형태로 출력한다. 페이징 처리가 필요하다. 이후 listView.jsp로 데이터를 넘긴다. -->
<%
	request.setCharacterEncoding("UTF-8");
//	이전 페이지에서 넘어오는 화면에 표시할 페이지 번호를 받는다. 
	int currentPage = 1;
	try {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	} catch (NumberFormatException e) {	}
	
	FreeboardService service = FreeboardService.getInstance();
	FreeboardCommentService commentService = FreeboardCommentService.getInstance();
	
//	공지글을 얻어온다.
	ArrayList<FreeboardVO> notices = service.selectNotice();
//	1페이지 분량의 일반글을 얻어온다.
	FreeboardList freeboardList = service.selectList(currentPage);
	
//	공지글과 메인글의 댓글 개수를 얻어와서 VO클래스의 commentCount에 저장한다.
	for (FreeboardVO vo : notices) {
		vo.setCommentCount(commentService.commentCount(vo.getIdx()));
	}
	for (FreeboardVO vo : freeboardList.getList()) {
		vo.setCommentCount(commentService.commentCount(vo.getIdx()));
	}




//	공지글과 일반글을 글 목록을 request영역에 저장한 후 일반글을 화면에 표시하는 페이지로 넘겨준다.
	request.setAttribute("freeboardList", freeboardList);
	request.setAttribute("notices", notices);
	pageContext.forward("listView.jsp");
%>
</body>
</html>