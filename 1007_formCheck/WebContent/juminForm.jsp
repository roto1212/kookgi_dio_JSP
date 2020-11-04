<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주민번호 검사하기</title>
<!-- src="별도의 자바스크립트 파일이름" -->
<script type="text/javascript" src="formCheck.js"></script>
</head>

<!-- onload()라는 이벤트는 현재 페이지가 브라우저에 표시되고 난 후 자동으로 실행된다.  -->

<body onload="document.juminForm.juminFront.focus()">
	
	<!-- 
		onsubmit라는 이벤트는 form의 submit 버튼이 클릭되면 실행되는 이벤트이다. onsubmit라는 이벤트에서 함수를 실행해서 form에 입력된 데이터가 정상적인 데이터인가 유효성 검사를 한다. 정상이면 true, 오류가 있으면 false를 리턴하게 만든다.
		onsubmit="return javascript함수(this)" 형태로 코딩하며 javascript함수 실행결과 return 값이 true이면 action속성에서 지정한 페이지로 넘겨주고 return값이 false면 현재 페이지에 머문다. 
	 -->
	
	
	<form action="juminFormOK.jsp" method="post" name="juminForm" onsubmit="return formCheck(this)">
	
	<!-- 
		onkeydown	: 키보드를 누르는 순간 실행되는 이벤트, 누른 키보드에 해당되는 문자가 입력되기전에 실행된다.
		onkeypress	: 키보드를 누르고 있을 때 실행되는 이벤트
		onkeyup		: 키보드에서 손가락이 떨어질때 실행되는 이벤트, 누른 키보드에 해당되는 문자가 입력한 후에 실행된다. 
	-->
	
		주민번호(앞자리 숫자 6자리, 뒷자리 숫자 7자리)<br>
		<input type = "text" name="juminFront" maxlength="6" onkeyup="moveNext(this, 6, document.juminForm.juminBack)">
		-
		<input type = "text" name="juminBack" maxlength="7" onkeyup="moveNext(this, 7, document.juminForm.sendBtn)">
		<input type = "submit" value="검사하기" name="sendBtn">
		
	</form>
</body>
</html>

