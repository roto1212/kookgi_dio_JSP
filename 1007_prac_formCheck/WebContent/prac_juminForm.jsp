<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주민번호 검사하기</title>
<script type="text/javascript" src="prac_formCheck.js"></script>
</head>
<body onload="document.juminForm.juminFront.focus()">
	<form action="juminFormOK.jsp" method="post" name="juminForm" onsubmit="return formCheck(this)">
		주민번호
		<input type="text" name="juminFront" maxlength="6" onkeyup="moveNext(this, 6, document.juminForm.juminBack)">
		-
		<input type="text" name="juminBack" maxlength="7" onkeyup="moveNext(this, 7,document.juminForm.sendBtn)">
		<input type="submit" value="검사하기" name="sendBtn">
	</form>
</body>
</html>