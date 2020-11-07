<%@page import="com.koreait.category.CategoryVO"%>
<%@page import="com.koreait.service.CategoryService"%>
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
	%>
	<jsp:useBean id="vo" class="com.koreait.category.CategoryVO">
		<jsp:setProperty property="*" name="vo"/> 
	</jsp:useBean>
	
	<%
		CategoryService service = CategoryService.getInstance();
// 		복구할 카테고리 이름을 복구 완료 메시지에 표시하기 위해 삭제할 카테고리 한 건을 테이블에서 얻어온다.
		CategoryVO original = service.selectByIdx(vo.getIdx());
//		out.println(original);
//		복구버튼이 클릭되면 deleteCheck 필드의 값을 no로 수정한다.
		service.deleteRestore(vo.getIdx());
		out.println("<script>");
		//vo.getDeleteReport()에는 기본값이 들어있다. 이전페이지에서 이것과 관련된 데이터를 넘겨주지 않았기 때문이다. original.getDeleteReport()에는 해당 인덱스번호의 데이터가 들어있다.
		if (original.getDeleteReport() > 10) {
			out.println("alert('"+ original.getCategory() +"는 신고 누적으로 복구 할수 없습니다.')");
			
		} else {
			out.println("alert('"+ original.getCategory() +" 카테고리 복구 완료!')");
			
		}
		
		out.println("location.href='list.jsp'");
		out.println("</script>");
	%>
</body>
</html>