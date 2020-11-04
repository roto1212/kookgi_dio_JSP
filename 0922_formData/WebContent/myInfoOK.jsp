<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
myinfoOK.jsp 입니다.<br>
<!-- myInfo.jsp에서 전송되는 데이터를 받는다. -->
<%
// form에 입력된 데이터가 post방식으로 전송될 때 한글이 깨지는 현상을 방지한다. 한글 깨짐을 방지하려면 최초의 request.getParamete() 가 실행되기 전에 아래의 내용을 코딩한다.
	request.setCharacterEncoding("UTF-8");
// tomcat server 7.0이전에는 get 방식도 한글이 깨졌다.
// get 방식에서 한글이 깨지지 않게 하려면 서버에서 한글이 깨지지 않도록 설정해야 한다. 
// Servers 폴더의 server.xml파일을 열고 63번 줄의 Connector태그에  URIEncoding="UTF-8" 속성을 추가하면 get방식에서 한글이 깨지지 않는다.
// <Connector URIEncoding="UTF-8" connectionTimeout="20000" port="9090" protocol="HTTP/1.1" redirectPort="8443"/>

// request.getParameter(): 이전 페이지에서 submit 버튼이 클릭되서 넘어오는 데이터를 무조건 문자열로 받는다.
	String name = request.getParameter("name");
	out.println(name+"님 안녕하세요.<br>");
	String ID = request.getParameter("ID");
	out.print(name+"님("+ID+") 안녕하세요.<br>");
	String password = request.getParameter("password");
	out.print(name+"님("+ID+") 안녕하세요." + password +"입니다.<br>");
	try {
		int age = Integer.parseInt(request.getParameter("age")) ;
		out.print(name+"님("+ID+")은 " + age +"세 입니다.<br>");
		out.print(name+"님("+ID+")은 내년에 " + (age+1) +"세 입니다.<br>");
		
	} catch (NumberFormatException e){
		out.print("잘못된 나이를 입력했습니다.<br>");
		out.print("<script>");
		out.print("alert('잘못된 나이를 입력했습니다.')");
		out.print("</script>");
	}
	boolean gender = Boolean.parseBoolean(request.getParameter("gender")) ;
	out.print(name+"님은 " + (gender ? "남자" : "여자") + "입니다.<br>");
//	String hobbies = request.getParameter("hobbies");
//	out.print(name+"님의 취미는 " + hobbies + "입니다.<br>");

//	checkbox는 여러항목을 선택할 수 있는데 위와 같이 getParameter()메소드를 이용하면 첫번째 데이터만 받을 수 있다.
// 	checkbox에서 넘어오는 데이터를 받을 때는 넘어오는 항목이 여러개일 경우 getParameterValues() 메소드로 받아서 배열에 저장시켜 처리한다.
	String[] hobbies = request.getParameterValues("hobbies");
	out.print(name+"님의 취미는 : ");
	try {
		for ( int i = 0; i < hobbies.length; i++){
			out.println(hobbies[i] + ", ");
		}
		out.print("입니다.<br>");
		
	} catch (NullPointerException e) {
		out.println("없어요ㅜㅜ<br>");
	}
	String trip = request.getParameter("trip");
	out.println(name+"님은 " + trip + "에 가고 싶어합니다.<br>" );
	String[] travel = request.getParameterValues("travel");
	out.print(name+"님은 ");
	try {
	for (int i =0; i < travel.length; i++){
		out.println(travel[i] + " " );
	}
	out.print("에 가고 싶어합니다.<br>");
		
	} catch (NullPointerException e){
		out.print("집콕!<br><br>");
	}
	
	String contents = request.getParameter("contents");
//	태그 사용가능, 줄바꿈 불가능
//	out.print(name + "님이 남긴말<br>"+ contents + "<br><br>");
//	태그 사용 불가능, 줄바꿈 불가능
//	out.print(name + "님이 남긴말<br>"+ contents.replace("<","&lt;").replace(">", "&gt;") + "<br><br>");
//	태그 사용 가능, 줄바꿈 가능
//	out.print(name + "님이 남긴말<br>"+ contents.replace("\r\n","<br>") + "<br><br>");
//	태그 사용 불가능, 줄바꿈 가능
	out.print(name + "님이 남긴말<br>"+ contents.replace("<","&lt;").replace(">", "&gt;").replace("\r\n","<br>") + "<br><br>");

	
%>
	
<a href="myInfo.jsp">돌아가기</a>
</body>
</html>