// 바디 코딩이 자바스크립트에 종속적일 경우 로딩이 걸리더라도 헤드부분에 자바스크립트 코딩한다.
// javascript 함수의 형식
// function 함수이름([매개변수, ...]) {
//		함수가 실행할 문장;
//		...;
//		[return 값;]
// }

//	이벤트가 실행되는 객체에 최대 글자수만큼의 문자가 입력되면 포커스를 넘겨줄 객체로 포커스를 넘겨준다.
//	moveNext(이벤트가 실행되는 객체, 최대 글자수, 포커스를 넘겨줄 객체)
	function moveNext(obj, len, nextObj) {
//		alert("moveNext() 함수가 실행됨");
//		value: 객체에 입력된 데이터, 객체의 밸류 속성으로 지정된 데이터 
//		alert(obj.value);
//		value를 if조건으로 사용하면 데이터가 입력되어 있으면 true, 그렇지 않으면 false를 의미한다.
//		length: 객체에 입력된 문자의 개수를 얻어온다. 
		if (obj.value.length == len) {
			nextObj.focus();
		}
	}
//	매개변수로 넘어온 폼의 유효성을 검사하고 정상이면 true를 리턴하고 아니면 오류메시지를 출력하고  false를 리턴한다.
//	formCheck(유효성 검사를 할 폼)
	function formCheck(obj) {
//		obj로 this가 넘어오므로 obj에는 document.juminForm이 저장된다.
		
//		주민등록번호 앞자리에 입력여부를 검사해 입력되지 않앗으면 메시지를 출력후 주민번호 앞자리의 데이터를 모두지우고, 커서 포커스를 옮긴 뒤 false를 리턴한다.
//		if ( !obj.juminFront.value || obj.juminFront.value.trim().length == 0) {
		if ( obj.juminFront.value.length < 6 || obj.juminFront.value.trim() == "") {
			alert('주민등록번호 앞 자리를 올바르게 입력하세요.');
			obj.juminFront.value = "";
			obj.juminFront.focus();
			return false
		}
//		주민등록번호 앞 자리에 숫자만 입력되었나 검사해서 숫자만 입력되지 않았으면 메시지를 출력후 false를 리턴한다.
//		Number()	=> 인수로 지정된 문자열을 숫자로 변환한다.
//		isNaN()		=> NaN(Not a Number), 인수로 지정된 데이터가 숫자가 아니면 true, 숫자면 false를 리턴한다.
		if (isNaN(Number(obj.juminFront.value.trim()))) {
			alert('주민등록번호는 숫자만 입력하세요.');
			obj.juminFront.value = "";
			obj.juminFront.focus();
			return false
		}

		if ( obj.juminBack.value.length < 7 || obj.juminBack.value.trim() == "") {
			alert('주민등록번호 뒷 자리를 올바르게 입력하세요.');
			obj.juminBack.value = "";
			obj.juminBack.focus();
			return false
		}
		if (isNaN(Number(obj.juminBack.value.trim()))) {
			alert('주민등록번호는 숫자만 입력하세요.');
			obj.juminBack.value = "";
			obj.juminBack.focus();
			return false;
		}
//	여기까지 왔다는 것은 주민등록번호가 13자리의 숫자가 입력되었다는 것이다. 
//	주민등록번호 유형성 검사를 하기위해 따로 입력된 주민등록번호를 하나의 문자열로 합친다. 덧셈은 Number()함수를 이용해 숫자로 변환한다.

		juminWhole = obj.juminFront.value.trim() + obj.juminBack.value.trim();
//	juminWhole = obj.juminFront.value.trim() - obj.juminBack.value.trim();
//	juminWhole = obj.juminFront.value.trim() * obj.juminBack.value.trim();
//	juminWhole = obj.juminFront.value.trim() / obj.juminBack.value.trim();
//	juminWhole = obj.juminFront.value.trim() % obj.juminBack.value.trim();
//	juminWhole = Number(obj.juminFront.value.trim()) + Number(obj.juminBack.value.trim());
	
//	자바스크립트는 숫자로만 구성된 문자열을 사칙연산 중 덧셈은 문자열을 이어주지만, 다른 연산은 숫자로 바꿔서 연산이 이루어진다.

//	alert(juminWhole);
//	alert() 함수를 사용하면 메시지 창에서 일일히 닫아주는 작업을 해야하므로 console.log() 함수를 사용해 개발자모드의 콘솔창에 연산의 중간결과를 확인한다. 
		console.log(juminWhole);
		
//		주민등록번호 유효성을 검사한다. 가중치: 234567892345, 둘리 주민번호: 8304221185600, 둘리 주민번호 각 자리수 *  가중치 각 자리수 한것을 모두 더하면 143이 나온다. 
		sum = 0;
//		validate = 234567892345
		
		for (i =0; i <= 11; i++){
			
//			sum += juminWhole.charAt(i)*validate.charAt(i);
			sum += juminWhole.charAt(i) * (i < 8 ? i + 2 : i - 6);
//			sum += juminWhole.charAt(i) * (i % 8 + 2);
			
		}
		console.log(sum);
//		sum에 저장된 값을 11로 나눈 나머지를 11에서 뺀 결과가 주민등록번호의 마지막 숫자와 같아야한다.
// 		11로 나눈 나머지를 11에서 뺀 결과가 10 이상일 경우 10자리는 버려야 하므로 10으로 나눈 나머지와 주민등록번호의 마지막 자리를 비교한다.
		result = (11 - sum % 11) % 10;
		console.log(result);
		
//		"=="와 "!="는 데이터만 비교한다. => 문자를 알아서 숫자로 바꿔 비교한다. => "1"와 1는 같은 데이터로 취급한다.
//		"==="와 "!=="는 데이터와 자료형을 모두 비교한다. => "1"와 1은 다른 값으로 취급한다.
		if ( result !== Number(juminWhole.charAt(12))){
			alert('주민등록번호가 올바르지 않습니다.');
			obj.juminFront.value = "";
			obj.juminBack.value = "";
			obj.juminFront.focus();
			return false
		}
		
		
		
//	모든 오류체크를 무사히 통과하면 마지막 true를 리턴시킨다.
		return true;
	}