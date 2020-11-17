<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp ajax 회원가입</title>

<!-- 반응형 웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1"/>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="./css/bootstrap.css"/>
<link rel="stylesheet" type="text/css" href="./css/custom.css"/>
<script type="text/javascript" src="./js/bootstrap.js"></script>

 
<script type="text/javascript">
	function pwCheckFunction() {
		var userPw1 = $('#userPw1').val();
        var userPw2 = $('#userPw2').val();
        if (userPw1 != userPw2) {
            $('#pwCheckMsg').html('비밀번호가 일치하지 않습니다.');
        } else {
            $('#pwCheckMsg').html('비밀번호가 일치합니다.');
        }  
	} 
//	아이디 중복체크함수	
	function registerCheckFunction() {
		var userID = $('#userID').val()	
		//alert(userID);
		$.ajax({
			type: 'POST',					// 요청방식
			url: './UserRegisterCheck',		// 서블릿 이름
			data: {							// 서블릿으로 전송할 데이터
				userID: userID
			},
			success: function(result) {		// ajax요청이 성공하면 실행할 함수
				//alert('연결 성공');
				//alert(result);
				//switch 명령은 js임에도 문자와 숫자의 데이터타입을 구별한다. result로 넘어오는 데이터는 문자열이다.
				
				switch (result) {
				case '0':
					//alert("이미 존재하는 아이디 입니다.");
					$('#idCheckMsg').html('이미 존재하는 아이디 입니다.');
					$('#checkMsg').html('이미 존재하는 아이디 입니다.');
					$('#checkType').attr("class", "modal-content panel-warning")
					break;
				case '1':
					//alert("가입 가능한 아이디 입니다.");
					$('#idCheckMsg').html('가입 가능한 아이디 입니다.');
					$('#checkMsg').html('사용 할 수 있는 아이디 입니다.');
					$('#checkType').attr("class", "modal-content panel-success")
					break;
				case '2':
					//alert("아이디를 입력해 주세요.");
					$('#idCheckMsg').html('아이디를 입력해 주세요.');
					$('#checkMsg').html('아이디를 입력해 주세요.');
					$('#checkType').attr("class", "modal-content panel-warning")
					break;
				default:
					$('#idCheckMsg').html('');
					break;
				}
				$('#checkModal').modal('show');
			},
			error: function(error) {		// ajax요청이 실패하면 실행할 함수
				alert('에러 발생');
			}
		});
	}
</script>   
</head>
<body>
    <div class="container">
        <form action="./UserRegister" method="post">
            <table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #ffffff;">
                <thead>
                    <tr>
                        <th colspan="3"> <h4>회원 등록 양식</h4> </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="width: 120px;">
                            <h5>아이디</h5>
                        </td>
                        <td >
                            <input id="userID" type="text" class="form-control" name="userID" placeholder="아이디를 입력해주세요."/>
                        </td>
                        <td style="width: 100px;">
                            <button type="button" class="btn btn-primary" style="color: black; background-color: aquamarine;" onclick="registerCheckFunction()">중복체크</button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h5>비밀번호</h5>
                        </td>
                        <td colspan="2">
                            <input id="userPw1"  type="password" class="form-control" name="userPw1" placeholder="비밀번호를 입력해주세요." 
                            onkeyup="pwCheckFunction()"/>
                        </td>
                        
                    </tr>
                    <tr>
                        <td>
                            <h5>비밀번호확인</h5>
                        </td>
                        <td colspan="2">
                            <input id="userPw2"  type="password" class="form-control" name="userPw2" placeholder="비밀번호를 다시 한 번 입력해주세요." onkeyup="pwCheckFunction()"/>
                        </td>
                        
                    </tr>
                    <tr>
                        <td>
                            <h5>이름</h5>
                        </td>
                        <td colspan="2">
                            <input id="userName"  type="text" class="form-control" name="userName" placeholder="이름을 입력해주세요."/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h5>나이</h5>
                        </td>
                        <td colspan="2">
                            <input id="userAge"  type="text" class="form-control" name="userAge" placeholder="나이를 입력해주세요."/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h5>성별</h5>
                        </td>
                        <td colspan="2">
                            <div class="form-gruop" style="text-align: left; margin: 0 auto;">
                                <!-- data-toggle 속성을 사용한 div태그로 묶어주면 라디오 상자 대신 버튼으로 표시된다.  -->
                                <!-- <div class="btn-group" data-toggle="buttons" > -->
                                <div class="btn-group">
                                    <label class="btn btn-primary active" style="color: black; background-color: aquamarine;">
                                        <!-- autocomplete="off" 자동완성 기능 = 해제 -->
                                        <input type="radio" name="userGender" autocomplete="off" value="남자" checked="checked" />남자
                                    </label>
                                    <label class="btn btn-primary" style="color: black; background-color: aquamarine;">
                                        <input type="radio" name="userGender" autocomplete="off" value="여자" />여자
                                    </label>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h5>이메일</h5>
                        </td>
                        <td colspan="2">
                            <input id="userEmail"  type="email" class="form-control" name="userEmail" placeholder="E-mail를 입력해주세요."/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="text-align: center;">
                            <!-- 비밀번호 일치 검사결과 메시지가 출력될 영역 -->
                            <h5 id="pwCheckMsg" style="color: red; "></h5>
                            <h5 id="idCheckMsg" style="color: magenta; "></h5>
                            <input class="btn btn-primary" type="submit" style="color: black; background-color: aquamarine;" value="회원가입"/>
                            <input class="btn btn-primary" type="reset" style="color: black; background-color: aquamarine;" value="다시쓰기"/>
                        </td>
                    </tr>
                </tbody>
            </table> 
        </form>
    </div>
<%
	//메시지 출력
	String msgType = null;
	if (session.getAttribute("msgType") != null) {
		msgType = (String) session.getAttribute("msgType");
		out.println("msgType: " + msgType + "<br/>");
	}
	String msgContent = null;
	if (session.getAttribute("msgContent") != null) {
		msgContent = (String) session.getAttribute("msgContent");
		out.println("msgContent: " + msgContent + "<br/>");
	}
	
	if (msgContent != null) {
%>
	<!-- 오류 메시지 모달 팝업창 -->	 
		<div class="modal fade" id="msgModal" tabindex="-1" role="dialog" aria-hidden="true">
           	<!-- vetical-alignment-helper class는 만들어 사용한다. -->
            <div class="vertical-alignment-helper">
           		<!-- vertical-align-center class는 만들어 사용한다. -->
                <div class="modal-dialog vertical-align-center">

                    <!-- 모달 팝업 창의 종류를 설정한다. -->
                    <!-- modal-content class에 스타일 추가 -->
                    <div class="modal-content 
                    <%
						if (msgType.equals("오류 메시지")){
							out.println("panel-warning");
						} else {
							out.println("panel-success");
						}
                    %>
                    ">
                        <!-- 헤더 -->
                        <div class="modal-header pannel-heading">
                            <!-- 헤더 왼쪽에 닫기 버튼 -->
                            <button type="button" class="close" data-dismiss="modal">
                                <!-- × == &times; -->
                                <span aria-hidden="true">&times;</span>
                                <span class="sr-only">Close</span>
                            </button>
                            <h4 class="modal-title">
                                msgType: <%=msgType%>
                            </h4>
                        </div>
                        <!-- 바디 -->
                        <div class="modal-body">
                        	<%=msgContent %>
                        </div>
                        <!-- 풋터 -->
                        <div class="modal-footer">
                        	<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            $('#msgModal').modal('show');
        </script>
<%
//	세션에 저장된 정보를 지운다.
	session.removeAttribute("msgType");
	session.removeAttribute("msgContent");
	}
%>
	<!-- 로그인 메시지 모달 팝업창 => 위의 오류 메시지 모달 팝업창을 복사해서 수정한다. -->
	<!-- id 속성을 checkModal로 수정 -->
	<div class="modal fade" id="checkModal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="vertical-alignment-helper">
                <div class="modal-dialog vertical-align-center">

                    <!-- id속성에 checkType을 추가, class 속성을  modal-content panel-info로 수정 -->
                    <div id="checkType" class="modal-content panel-info">
                        <div class="modal-header pannel-heading">
                            <button type="button" class="close" data-dismiss="modal">
                                <!-- × == &times; -->
                                <span aria-hidden="true">&times;</span>
                                <span class="sr-only">Close</span>
                            </button>
                            <h4 class="modal-title">
                                아이디 중복체크확인 메시지
                            </h4>
                        </div>
                        <!-- 바디: id속성에 checkMsg를 추가 -->
                        <div id="checkMsg"  class="modal-body"></div>
                        <div class="modal-footer">
                        	<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
</body>
</html>