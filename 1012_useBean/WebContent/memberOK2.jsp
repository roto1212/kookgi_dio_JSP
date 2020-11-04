<%@page import="java.util.Date"%>
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
//	Date date = new Date();		 //test
//	out.println(date + "<br/>"); //test

%>

<!-- useBean 액션태그는 객체를 만들 때 사용한다. -->
<!-- 
	useBean 액션태그의 id 속성에 만들려는 객체의 이름을 쓴다.
	useBean 액션태그의 class 속성에는 객체를 만들려하는 클래스 이름을 같이쓴다.
	
 -->

<jsp:useBean id="date" class="java.util.Date"/> <!-- Date date = new Date(); -->
${date }<br/>
<!-- MemberVO vo  = new MemberVO();와 같은 기능을 실행한다. -->
<jsp:useBean id="vo" class="com.koreait.useBean.MemberVO">
	<!-- jsp:setProperty 액션태그는 setter메소드를 실행한다. 클래스에 setter메소드가 작성되어 있어야 한다. -->
	<!-- 
	jsp:setProperty property=""의 속성에는 setter 메소드를 실행할 멤버변수 이름을 쓴다. name 속성에는 setter메소드를 실행할 멤버변수가 작성된 클래스의 객체이름을 쓴다.
	
	 String id = request.getParameter("id");
	 vo.setId(id);
	 위의 2줄과 같은 기능이 실행된다. 
	 
	 Integer.parseInt(), Boolean.parseBoolean()를 사용하지 않아도 자동으로 데이터가 변환되서 저장된다.
	 -->
	 <!-- 
	<jsp:setProperty property="id" name="vo"/>
	<jsp:setProperty property="name" name="vo"/>
	<jsp:setProperty property="pw" name="vo"/>
	<jsp:setProperty property="age" name="vo"/>
	<jsp:setProperty property="gender" name="vo"/>
	  -->
	<!-- setProperty액션태그의 property속성에 "*"을 입력하면 form의 name속성에 입력한 이름과 같은 모든 멤버변수의 setter 메소드가 실행된다.  -->
	<jsp:setProperty property="*" name="vo"/>
	  
	  
</jsp:useBean>

<!-- useBean액션태그로 만든객체에 저장할 데이터 중에서 form에 저장되서 넘어오지 않은 데이터는 별도로 받아서 넣어줘야 한다. -->
<%
	String ip = request.getRemoteAddr();
	vo.setIp(ip);
%>

${vo}<br/>

















</body>
</html>

















