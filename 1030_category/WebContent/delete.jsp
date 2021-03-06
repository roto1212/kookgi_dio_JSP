<%@page import="java.util.ArrayList"%>
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
		// 삭제한 카테고리 이름을 삭제 완료 메시지에 표시하기 위해 삭제할 카테고리 한 건을 테이블에서 얻어온다.
		CategoryVO original = service.selectByIdx(vo.getIdx());
//		out.println(original);
//		1. 삭제버튼이 클릭되면 해당 카테고리를 테이블에서 삭제한다.
//		service.delete(vo.getIdx());
		
//		2. 삭제버튼이 클릭되면 해당 카테고리 자체를 "삭제된 카테고리입니다."로 수정한다.
//		service.deleteCategory(vo.getIdx());

//		3. 삭제버튼이 클릭되면 deleteCheck 필드의 값을 yes로 수정한다.
//		service.deleteCheck(vo.getIdx());

//		4. 삭제버튼이 클릭되면 삭제한 카테고리의 모든 서브 카테고리도 일괄적으로 삭제한다.
//		삭제할 카테고리와 삭제할 카테고리의 모든 서브 카테고리 목록을 얻어와서 배열목록에 저장한다.
		ArrayList<CategoryVO> deleteList = service.deleteList(vo);
		for (int i = 0; i < deleteList.size(); i++) {
//			삭제할 카테고리 seq(deleteList.get(i).getSeq())에 1을 더한 값이 다음에 삭제하려는  seq(deleteList.get(i +1).getSeq())와 같으면 다음에 삭제할 서브 카테고리가 잇는 것이므로 계속 반복하며 카테고리를 삭제하면 되고 같지 않다면 다음에 삭제할  서브 카테고리가 없는 것이므로 반복을 탈출시킨다.
//			삭제할 카테고리 목록의 마지막 카테고리 다음에는 삭제할 카테고리가 없으므로 아래의 if 명령을 실행하다 배열목록의 인덱스 값이 범위를 초과해 IndexOutOfBoundsException이 발생되므로 예외처리를 해야한다.  			

			//out.println(deleteList.get(i) + "<br/>");//test
			service.delete(deleteList.get(i).getIdx());
			try { 
				if (deleteList.get(i).getSeq() + 1 != deleteList.get(i + 1).getSeq()){
					break;
				}				
			} catch (IndexOutOfBoundsException e) {}
			
			
			/*
			if ( deleteList.get(i).getSeq() != deleteList.get(0).getSeq()+i) {break;} 
			service.delete(deleteList.get(i).getIdx());
			//out.println(deleteList.get(i) + "<br/>");//test
			*/
			
			//out.println(seq+i + "<br/>");
			//out.println(deleteList.get(i).getSeq() + "<br/>");
		}
//		삭제작업이 실행된 카테고리 그릅(ref)의 seq를 0부터 1씩 증가하게 다시 부여하는 메소드를 실행한다.
		service.reSeq(original.getRef());
		
//		out.println(deleteList);

		out.println("<script>");
//		out.println("alert('"+ original.getCategory() +" 카테고리 삭제 완료!')");
		out.println("alert('"+ original.getCategory() +" 카테고리와 이 카테고리의 서브 카테고리 삭제 완료!')");
		out.println("location.href='list.jsp'");
		
		out.println("</script>");
	%>
</body>
</html>