<%@page import="com.koreait.service.CategoryService"%>
<%@page import="com.koreait.category.CategoryList"%>
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
		// 테이블에 저장된 전체 카테고리 목록을 얻어와서 CategoryList 클래스의 배열목록에 저장한 후 CategoryList 클래스 객체를 request 영역에 저장시켜 카테고리 목록을 출력하는 페이지(categoryView.jsp)로 넘겨준다.
		CategoryList categoryList = CategoryService.getInstance().selectList();
		request.setAttribute("categoryList", categoryList);
		pageContext.forward("categoryView.jsp");			// 리퀘스트에 저장된 데이터를 가지고 인수의 페이지로 넘아간다. 주소는 변하지 않는다.
	%>
	
</body>
</html>