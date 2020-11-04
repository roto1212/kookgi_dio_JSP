<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- html 주석 -->
<%-- JSP 주석 --%>
<%--
	<%@ ~ %>: 디렉티브, 대부분 자동으로 입력된다. import같이 설정에 관련된 정보를 적는다. 
	<%! ~ %>: 선언부, 프로그램에서 사용할 변수나 메소드를 정의한다. => java파일로 뽑아내서 사용한다.
	<%= ~ %>: 표현식, 변수에 저장된 데이터나 연산결과를 출력한다. => EL(${ ~ }$)로 대체해서 사용한다.
	<% ~ %>: 스크립트 릿, 일반적인 jsp 코드를 적는다.=> JSTL로 대체해서 사용한다.
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 정보 입력</title>
</head>
<body>
<!--  
	HTML은 spacebar를 여러번 눌러도 한칸 밖에 떨어지지 않고 enter 키를 여러번 눌러도 줄이 변경되지 않는다.
	2칸 이상 띄우려면 &nbsp;를 띄울 칸 개수만큼 입력하고 줄을 변경하려면 <br>태그를 사용한다.
	
	현재 페이지에 입력한 데이터를 특정페이지로 전송하려면 전송할 데이터를 입력하는 코드를 <form action=""> ~ </form> 사이에 작성.
	action 속성에는 전송(submit) 버튼이 클릭되면 form에 입력한 데이터가 전송될 페이지 이름을 적는다. => "?"만 입력하면 현재 페이지를 의미한다.

method=속성은 action페이지로 데이터가 전송될 때 전송되는 정보가 url칸에 표시여부를 지정한다.
method는 생략시 get이 기본값으로 사용되며 전송되는 데이터가 url창에 표시되고 post로 변경하면 전송되는 정보가 url칸에 표시 되지 않는다. 

-->
myInfo.jsp입니다. <br>
<form action="myInfoOK.jsp" method="post">
	
	<label>
	이 름  <input type="text" name="name">
	</label><br><br>
	아이디 <input type="text" name="ID"><br><br>
	<!-- type="password"는 한글을 타이핑해도 입력할 수 없다. -->
	비밀번호 <input type="password" name="password"><br><br>
	나이 <input type="text" name="age"><br><br>
	<!--
		radio와 checkbox는 같은 그룹끼리 반드시 같은 이름의 name 속성을 지정해야 그룹을 묵인다.  
		radio와 checkbox는 컨트롤 자체를 브라우저에 표시하는 기능밖에 없기 때문에 선택했을 때 다음 페이지로 넘겨줄 데이터를 value속성을 사용해서 넣어줘야 한다. value속성을 지정하지 않고 선택하면 무조건 on이 넘어간다.
	-->
	<fieldset style="width: 130px;">
		<legend>성별</legend>
	 	<input type="radio" name="gender" value="true" checked="checked"> 남자
		<input type="radio" name="gender" value="false"> 여자
	</fieldset><br>
	<fieldset style="width: 300px">
	<legend>취미</legend>
		 <input type="checkbox" name="hobbies" value="늦잠자기"> 늦잠자기
	 	 <input type="checkbox" name="hobbies" value="지각하기"> 지각하기
		 <input type="checkbox" name="hobbies" value="qr늦게찍기"> qr늦게찍기
	</fieldset><br><br>
	<!-- 콤보상자 만들기  -->
	가고 싶은 여행지는? 
	<select style="width: 200px" name="trip">
		<option>괌</option> 
		<option>코타키나발루</option> 
		<option>다낭</option> 
		<option>나트랑</option> 
		<option selected="selected">보라카이</option> 
		<option>팔라완</option> 
		<option>대만</option> 
		
	</select><br>
	<!-- 목록상자 만들기  -->
	가고 싶은 여행지는? <br>
	<select style="width: 200px" name="travel" multiple="multiple" size="6">
		<option>괌</option> 
		<option>코타키나발루</option> 
		<option>다낭</option> 
		<option>나트랑</option> 
		<option>보라카이</option> 
		<option>팔라완</option> 
		<option>대만</option> 
		
	</select><br>	 
	메모 <br>
	<textarea rows="10" cols="80" name="contents" style="resize: none;"></textarea><br>
		
	<input type="submit" value="회원가입">

</form>

</body>
</html>