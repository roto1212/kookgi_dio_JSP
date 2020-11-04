function pwCheck(obj){
		/*
		// 입력한 비밀번호가 8자 이상 12자 이하인가 검사한다.
		len = obj.pw.value.trim().length;
		if (len < 8 || len > 12){
			alert("비밀번호는 8자 이상 12자 이하로 입력해야 합니다. ")
			obj.pw.value = "";
			obj.repw.value = "";
			obj.pw.focus();
			
			return false;
		}
		//영문자, 숫자, 특수문자 각각 1개 이상 입력되었나 검사한다.
		alphaCount = 0;		// 영문자의 개수를 셀 변수
		numberCount = 0;	// 숫자의 개수를 셀 변수
		etcCount = 0;		// 특수문자의 개수를 셀 변수
		// 입력된 비밀번호의 문자 개수만큼 반복하며 영문자, 숫자, 특수문자의 개수를 센다
		pw = obj.pw.value.trim();
		for (i = 0; i < len; i++){
			if (pw. charAt(i) >= 'a' && pw.charAt(i) <= 'z' || pw.charAt(i) >= 'A' && pw.charAt(i) <= 'Z') {
				alphaCount++;
				
			} else if (pw.charAt(i) >= '0' && pw.charAt(i) <= '9'){
				numberCount++;
			} else {
				etcCount++;
			}
			
		}
//		alert('영문자: '+ alphaCount + '개\n숫자: ' + numberCount + '개\n특수문자' + etcCount + '개')+
		console.log('영문자: '+ alphaCount + '개\n숫자: ' + numberCount + '개\n특수문자' + etcCount + '개')
		if (alphaCount == 0 || numberCount == 0 || etcCount == 0) {
			alert('비밀번호는 영문자, 숫자, 특수문자를 각각 1개이상 입력해야 합니다.')
			obj.pw.value = "";
			obj.repw.value = "";
			obj.pw.focus();
			return false;		
		}
		*/
		pw = obj.pw.value.trim();
//		정규표현식(정규식)을 사용한 영문자, 숫자, 특수문자 각각 1개이상 입력되었고 8자 이상 12자 이하인가 검사한다. 
//		new RegExp('정규식'); '~'안에는 띄어쓰기 하지 않는다.
		
		
//		pattern = new RegExp('^.{8,12}$');		// 글자수 제한. 8자 이상 12자 이하
//		pattern = new RegExp('^.{8}$');			// 글자수 제한. 8자만 허용 
//		pattern = new RegExp('^.{8,}$');		// 글자수 제한. 8자 이상 
//		pattern = new RegExp('^.{1,8}$');		// 글자수 제한. 8자 까지 
//		pattern = new RegExp('^[0-9]{8,12}$');		// 글자수 제한. 8자 이상 12자 이하, 숫자만 입력가능
//		pattern = new RegExp('^[A-Z]{8,12}$');		// 글자수 제한. 8자 이상 12자 이하, 영대문자만 입력가능
//		pattern = new RegExp('^[a-z]{8,12}$');		// 글자수 제한. 8자 이상 12자 이하, 영소문자만 입력가능
//		pattern = new RegExp('^[a-zA-Z]{8,12}$');		// 글자수 제한. 8자 이상 12자 이하, 영문자만 입력가능
//		pattern = new RegExp('^[!@#$%^&*]{8,12}$');		// 글자수 제한. 8자 이상 12자 이하, 특수문자(!@#$%^&*)만 입력가능
//		pattern = new RegExp('^[0-9a-zA-Z!@#$%^&*]{8,12}$');		// 글자수 제한. 8자 이상 12자 이하, 숫자, 영문자, 특수문자(!@#$%^&*)만 입력가능
		
//		(?=.*[a-zA-Z]): 영문자가 포함되어 있나 검사한다.
//		(?=.*[a-z]): 영소문자가 포함되어 있나 검사한다.
//		(?=.*[A-Z]): 영대문자가 포함되어 있나 검사한다.
//		(?=.*[0-9]): 숫자가 포함되어 있나 검사한다.
//		(?=.*[!@#$%^&*]): 특수문자가 포함되어 있나 검사한다.
//		[0-9a-zA-Z!@#$%^&*]: []안에 지정된 문자들로만 구성되었나 검사한다.
		pattern = new RegExp('^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[0-9a-zA-Z!@#$%^&*]{8,12}$');		// 글자수 제한. 8자 이상 12자 이하, 숫자, 영대문자, 영소문자, 특수문자(!@#$%^&*)만 1개 이상씩 입력가능
		
		
		// test() 함수로 인수로 지정된 문자열이 정규식 패턴을 만족하는가 검사해서 만족하면 true, 그렇지 않으면 false를 리턴한다.
		if (!pattern.test(pw)){
			alert("비밀번호는 8자 이상 12자 이하로 숫자, 영대문자, 영소문자, 특수문자를 1개이상 조합해서 입력해야 합니다. ")
			obj.pw.value = "";
			obj.repw.value = "";
			obj.pw.focus();
			
			return false;
		}
		
		
		//입력한 두개의 비밀번호가 같은가 검사한다.
		if (obj.pw.value.trim() != obj.repw.value.trim()) {
			alert("비밀번호를 다시 확인해 주세요.")
			obj.pw.value = "";
			obj.repw.value = "";
			obj.pw.focus();
			
			return false;
		}
		return true;
	}
