<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 양식</title>
</head>
<!-- <script type="text/javascript" src="pwCheck.js"></script> -->
<body>

<form action="memberOK2.jsp" method="post" onsubmit="return pwCheck(this)">
	<table width="500" align="center" border="1" cellpadding="5" cellspacing="0">
		<tr>
			<th colspan="2">회원가입 </th>
		</tr>		

		<tr>
			<td width="150">ID </td> 
			<td width="350">
				<input type="text" name="id" placeholder="아이디를 입력하세요." />
			</td>	
		</tr>	
			
		<tr>
			<td >이름 </td> 
			<td >
				<input type="text" name="name" placeholder="이름을 입력하세요." />
			</td>	
		</tr>		
		<tr>
			<td >비밀번호 </td> 
			<td >
				<input type="password" name="pw" placeholder="비밀번호를 입력하세요." />
			</td>	
		</tr>		
		<tr>
			<td >비밀번호 확인</td> 
			<td >
				<input type="password" name="repw" placeholder="비밀번호를 한번 더 입력하세요."/ >
			</td>	
		</tr>
		
		<tr>
			<td >나이 </td> 
			<td >
				<input type="text" name="age" placeholder="나이를 입력하세요."/ >
			</td>	
		</tr>		
		<tr>
			<td >성별 </td> 
			<td >
				<input type="radio" name="gender" value="true" checked="checked">남자<br/>
				<input type="radio" name="gender" value="true" >여자<br/>
			</td>	
		</tr>	
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="회원가입"/>
				<input type="reset" value="다시쓰기"/>
			</td>
		</tr>
	</table>
</form>

</body>

</html>