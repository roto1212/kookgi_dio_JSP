<%@page import="com.koreait.onlinePoll.PollWrite"%>
<%@page import="com.koreait.onlinePoll.PollRead"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.websocket.SendResult"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pollWrite</title>
</head>
<body>

<!-- pollRead.jsp에서 투표한 항목을 넘겨받아 득표수를 증가시켜 텍스트 파일에 저장한다.  -->
<%
// post방식으로 데이터가 넘어 올때 한글깨짐 방지코드
	request.setCharacterEncoding("UTF-8");
// pollRead.jsp에서 넘어오는 투표데이터를 받는다.
	String temp = request.getParameter("poll");
//	out.print(temp);
	
/*  투표 데이터가 넘어왔나? (null이나 공백인가?) 검사한다. null부터 검사*/
	if (temp != null && temp.trim().length() != 0) {
// 	넘어온 데이터가 숫자인지 검사한다.
	try {
		int result = Integer.parseInt(temp);
//		넘어온 투표데이터가 숫자인 경우 정상적인 투표범위의 데이터인가 검사하기 위해서 텍스트파일을 읽어서 투표항목의 개수를 계산한다.
		String filepath = application.getRealPath("/") + "poll.txt";
		ArrayList<String> poll = PollRead.pollRead(filepath);
		int itemCount = (poll.size()-1)/2;
		
//		넘어온 투표데이터가 정상적인 투표범위인가 검사한다.
		if (result >=1 && result <= itemCount){
			
//		여기까지 왔다는 것은 정상적인 정상적인 투표데이터가 넘어왔다는 것이므로 투표한 항목의 득표수를 증가시킨다.
//		득표수를 1증가 시킬 위치를 계산한다.
			int index = result + itemCount;
//		득표수를 증가시킨다. => 배열목록의 index번째 데이터를 1증가시킨다.
			result = Integer.parseInt(poll.get(index)) + 1;
//		증가된 득표를 다시 배열목록에 저장시킨다.
			poll.set(index, result+"");
			
//		배열목록의 데이터를 텍스트 파일에 저장하는 메소드를 실행한다.
			PollWrite.pollWrite(filepath, poll);
			

//		투표결과보기 페이지로 넘겨준다.
			response.sendRedirect("pollResult.jsp");
		} else {
//			투표데이터가 정상 범위가 아니므로 아니므로 오류메시지를 출력하고 pollRead.jsp로 돌려보낸다.
			out.println("<script>");
			out.println("alert('투표데이터가 정상적인 범위가 아닙니다.')");
			out.println("location.href='pollRead.jsp'");
			out.println("</script>");
		}
		
	} catch (NumberFormatException e) {
//		투표데이터가 숫자가 아니므로 오류메시지를 출력하고 pollRead.jsp로 돌려보낸다.
		out.println("<script>");
		out.println("alert('투표데이터가 숫자가 아닙니다.')");
		out.println("location.href='pollRead.jsp'");
		out.println("</script>");
	}
	} else {
//	투표데이터가 넘어오지 않았으므로 오류메시지를 출력하고 pollRead.jsp로 돌려보낸다.
		out.println("<script>");
		out.println("alert('투표를 해주세요')");
		out.println("location.href='pollRead.jsp'");
		out.println("</script>");
//		jsp는 서버용 스크립트 언어이고, javascript는 클라이언트용 스크립트 언어이다. 하나의 jsp 파일에 서버용 스크립트와 클라이언트용 스크립트를 모두 사용한 경우 서버용이 먼저 실행되고 클라이언트용이 실행된다. 코딩순서는 상관없다.
// 		sendRedirect(): 인수로 지정된 페이지로 이동한다.

//		response.sendRedirect("pollRead.jsp");
	}
	




%>


</body>
</html>