function moveNext(obj, len, nextObj){
	//obj로 넘어온 객체의 값의 길이가 len과 같으면 nextObj로 커서 포커스를 옮긴다.
	if (obj.value.length == len){
		nextObj.focus();
	}
}
//obj로 넘어온 폼의 유효성을 체크하는 함수
function formCheck(obj){
	//주민번호 앞자리에 데이터를 입력했는지, 6자리를 입력하였는지, 공백을 입력하였는지 검사한다.
	front = obj.juminFront.value
	if (front.trim().length < 6 || front.trim() == "" ){
		alert("주민등록번호 앞자리를 올바르게 입력해 주세요.");
		obj.juminFront.value = "";				// 입력칸을 비운다.
		obj.juminFront.focus();	
		return false;
	}
	//주민번호 앞자리에 숫자외의 데이터를 입력했는지 검사한다.
	if (isNaN(Number(front.trim()))) {
		alert("주민등록번호는 숫자만 입력해 주세요.");
		obj.juminFront.value = "";
		obj.juminFront.focus();
		return false;
	}
	back = obj.juminBack.value
	if (back.trim().length < 6 || back.trim() == "" ){
		alert("주민등록번호 뒷자리를 올바르게 입력해 주세요.");
		obj.juminBack.value = "";
		obj.juminBack.focus();
		return false;
	}
	
	if (isNaN(Number(back.trim()))) {
		alert("주민등록번호는 숫자만 입력해 주세요.");
		obj.juminBack.value = "";
		obj.juminBack.focus();
		return false;
	}
	//앞 뒤 나눠서 입력받은 주민번호를 하나의 변수에 저장한다.
	juminNum = front + back;
	//console.log(juminNum);
	
	// 주민번호 유효성검사를 한다. 가중치 234567892345, 둘리 주번: 8304221185600. 가중치 12자리를 주민번호 12자리에 1자리씩 곱하고 각각 구한 값을 모두 더한다. 둘리 주민번호의 계산 값은 143이다.
	
	sum = 0;
	for (i = 0; i <= 11; i++){
		sum += juminNum.charAt(i) * (i < 8 ?  i + 2 : i - 6);
	}
	console.log(sum);
	
	// 가중치 계산값에 11을 나눈 나머지에 11을 뺀 결과가 주민번호 마지막 숫자의 값과 일치해야 한다. 이때 10이상이 나온경우 10의 자리는 버리고 비교한다.
	result = (11 - sum % 11) % 10;
	console.log(result);
	if (result != juminNum.charAt(12)){
		alert("유효하지 않은 주민등록번호입니다.");
		front = "";
		back = "";
		obj.juminFront.focus();
		return false;
	}
	
	//모든 검사를 통과했다면 juminFormOK.jsp로 넘어간다.
	return true;
}