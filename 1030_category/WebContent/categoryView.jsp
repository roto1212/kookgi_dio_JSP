<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 보기</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
// js
/*
	 function formCheck(obj) {
		if (!obj.category.value || obj.category.value.trim().length == 0) {
			alert("입력 똑바로 해라")
			obj.category.value = "";
			obj.category.focus();
			return false;
		} 
		return true;
	} 
*/
//	삭제버튼이 클릭되면  delete.jsp로 form에 입력된 데이터를 전송하는 함수
	function mySubmitDelete(obj) {
		//alert(obj);
		obj.action = 'delete.jsp';			// 인수로 넘어오는 form의 액션페이지를 변경한다. 
		obj.submit();						// action page를 호출하고 form의 데이터를 전송한다.
	}
//복구버튼이 클릭되면  deleteRestore.jsp로 form에 입력된 데이터를 전송하는 함수
	function mySubmitRestore(obj) {
		//alert(obj);
		obj.action = 'deleteRestore.jsp';			 
		obj.submit();						
	}
//	신고 버튼이 클릭되면 deleteReport.jsp로 form에 입력된 데이터를 전송하는 함수
	function mySubmitReport(obj) {
		obj.action = 'deleteReport.jsp';			 
		obj.submit();	
	}
//	수정 버튼이 클릭되면 update.jsp로 form에 입력된 데이터를 전송하는 함수
	function mySubmitUpdate(obj) {
		//alert(obj);
		
		if (!obj.category.value || obj.category.value.trim().length == 0) {
			alert("수정할 카테고리를 입력하세요");
			obj.category.value = "";
			obj.category.focus();
		} else {
			obj.action = 'update.jsp';
			obj.submit();
		}
	}
//==========================================================================================================	
	
// jq
	// 문서가 로드되면
	$(document).ready(function() {
		// form 태그에서 submit 이벤트가 발생했을 때 익명함수의 매개변수로 실행되는 이벤트가 넘어온다.
		$('#main_form').submit(function(event) {
			// $.trim(~) : 인수로 지정된 문자열 앞, 뒤의 공백을 제거한다.
			// $('#category').val() : id가 category인 객체에 입력된 데이터를 얻어온다.
			var category = $.trim($('#category').val()).length;		// 메인 카테고리에 입력된 글자수 
			// #category의 입력값이 null이거나 공백이면
			if (category == 0) {
				alert('정신차려 등신ㅌ같은 ㄳ야');
				// .preventDefault(): event로 넘어온 기본 이벤트의 실행을 중지시킨다.
				event.preventDefault();
				$('#main_form')[0].reset();					// id:form인 폼에서 obj.category.value = "";을 실행한다. => [0]만 사용가능하다.
				$('#category').focus();
			}
		});
		
//		서브카테코리에 아무것도 입력되지 않았는가 검사한다. => 서브카테고리 입력은 여러개가 있기 때문에 class를 지정해서 처리한다.		
		
//		서브카테고리를 입력하는 폼의 개수만큼 반복하며 모든 서브카테고리에 이름이 다른 class 속성을 추가로 지정한다.
//		$('.sub_form').each(function(index, item) {}): sub_form이라는 클래스 속성이 지정된 객체의 개수만큼 인수로 지정된 함수를 반복해서 실행한다. 
//		index: sub_form이란 class가 지정된 객체의 인덱스가 저장된다.
//		item: sub_form이란 class가 지정된 객체의 인덱스번째 객체가 저장된다. 
		$('.sub_form').each(function(index, item) {
			//console.log(index);
			//$(item).addClass: 반복문을 통해서 반복되는 객체(서브카테고리 폼)에 class 속성을 추가한다.
			$(item).addClass('sub_form' + index);
		});
//		서브카테고리를 입력하는 텍스트 상자의 개수만큼 반복하며 모든 서브카테고리를 입력하는 text 상자에 이름이 다른 class 속성을 추가로 지정한다.
		$('.sub_category').each(function(index, item) {
			//console.log(index);
			$(item).addClass('sub_category' + index);
		});
		
		$('.sub_form').each(function(index, item) {
			$('.sub_form'+index).submit(function(event) {
				var sub_category = $.trim($('.sub_category' + index).val()).length;
				if (sub_category == 0) {
					alert('서브카테고리는 반드시 입력해야 합니다.');
					event.preventDefault();		// 이벤트 중단
					$('.sub_form'+index)[0].reset();
					$('.sub_category' + index).focus();
				}
			});	
		});
	});  
</script>

</head>
<body>
<h1>category Project</h1>

<!-- 
js 함수로 메인 카테고리 폼 체크
<form action="insert.jsp" id="cateForm" method="post" onsubmit="return formCheck(this)"> -->

<!-- jq로 메인 카테고리 폼체크 -->
<form id="main_form" action="insert.jsp"  method="post">
	<input id="category" type="text" name="category"/>
	<input type="submit" value="메인 카테고리"/>
	
</form>
<hr size="3" color="red">

<%-- ${categoryList} test--%>

<!-- 여기부터 카테고리 개수만큼 반복하며 카테고리 목록을 출력한다. -->
<c:forEach var="vo" items="${categoryList.list}" >
	<%-- ${vo}<br/> --%>
	<!-- 서브카테고리를 입력하는 모든 폼에 다른 이름이 지정되야 식별이 가능하므로 폼 이름을 만든다.  -->
	<c:set var="formName" value="form${vo.idx}"/>
	<!-- 자바스크립트 함수로 서브 카테고리 폼체크 -->
	<%-- <form action="reply.jsp" method="post" onsubmit="return formCheck(this)" name="${formName}"> --%>
	<!-- jq로 메인 카테고리 폼체크 -->
	<form class="sub_form" action="reply.jsp" method="post" name="${formName}">
		<!-- idx, ref, lev, seq를 표시하는 텍스트 상자로 우선만들어서 코딩을 하고 테스트가 완료되면 모두 hidden으로 처리한다. -->
		<input type="text" name="idx" value="${vo.idx}" size="1"/> 
		<input type="text" name="ref" value="${vo.ref}" size="1"/>
		<input type="text" name="lev" value="${vo.lev}" size="1"/>
		<input type="text" name="seq" value="${vo.seq}" size="1"/>
		
		
		<!-- 카테고리 lev에 따른 들여쓰기를 한다.-->
		<c:if test="${vo.lev > 0}">
			<c:forEach var="i" begin="1" end="${vo.lev}" step="1">
				&nbsp;&nbsp;
			</c:forEach>
			<!-- <img alt="리플" src="./repl_arr.png" width="15" > -->
			└
		</c:if>
		
		<c:if test="${fn:trim(vo.deleteCheck) == 'yes'}">
			삭제한 카테고리입니다.
		</c:if>
		<c:if test="${fn:trim(vo.deleteCheck) != 'yes'}">
			<c:if test="${vo.deleteReport > 10 }">
				신고 만땅 먹은 카테고리입니다.
			</c:if>
			<c:if test="${vo.deleteReport <= 10 }">
				${vo.category}(신고 횟수: ${vo.deleteReport}번)
			</c:if>
		</c:if>
		
		<input class="sub_category" type="text" name="category"/>
		<input type="submit" value="서브카테고리 만들기"/>
		<%-- <input type="button" value="삭제" onclick="location.href='delete.jsp?idx=${vo.idx}'"/> --%>
		<input type="button" value="삭제" onclick="mySubmitDelete(${formName})"/>
		<input type="button" value="복구" onclick="mySubmitRestore(${formName})"/>
		<input type="button" value="신고" onclick="mySubmitReport(${formName})"/>
		<input type="button" value="수정" onclick="mySubmitUpdate(${formName})"/>
	</form>	

</c:forEach>




 
</body>
</html>