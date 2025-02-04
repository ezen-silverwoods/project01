<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JS를 이용한 join</title>
		<script src="./js/jquery-3.7.1.js"></script>
		<script>
			function CheckValue(){
				// input 객체들의 value 값을 가져옴
				var userName = document.querySelector('#username');
				var email = document.querySelector('#email');
				var passwd = document.querySelector('#passwd');
				var cpw = document.querySelector('#confirmpasswd');
				var age = document.querySelector('#age');
				var phone = document.querySelector('#phone');
				
				// 객체를 잘못 찾거나, 객체이름.value 호출시 선언되지 않은
				// 객체이름명을 사용할때에, 오류가 발생됩니다
				// 하지만, 함수 실행만 멈출뿐, submit가 진행되기에,
				// 기대하는 작업을 수행하지 못합니다
/* 				console.log("이름 객체 : ", userName);
				console.log("이름 입력값 : ", userName.value);
				console.log("이메일 객체 : ", email);
				console.log("이메일 입력값 : ", uemail.value);
				console.log("비번 객체 : ", passwd);
				console.log("비번 입력값 : ", passwd.value);
				console.log("비번확인 객체 : ", cpw);
				console.log("비번확인 입력값 : ", cpw.value);
				console.log("나이 객체 : ", age);
				console.log("나이 입력값 : ", age.value);
				console.log("전화 객체 : ", phone);
				console.log("전화 입력값 : ", phone.value); */
				
				// 각각의 유형에 맞는 유효성 검사를 수행
				// .trim() -> submit시에도 trim()
				// .jsp에서 .getPara...()시 trim()
				// userName이나 UserID 입력시 '공백문자'를 정규식으로 체크
				// ID에 영문자, 숫자만 사용하게 허용 -> 한글, 특수문자, '공백문자'
				if( userName.value.trim() == "" ) {
					alert("사용자 이름을 입력해주세요");
					// 이름 입력 객체에 커서 이동
					userName.focus();
					return false;
				}else{ // submit 이전에 공백 제거하는 예시
					userName.value = userName.value.trim();
				}
				
				// 이메일 형식 검사
				if( email.value.trim() == "" ) {
					alert("이메일을 입력하세요");
					email.focus();
					return false;
				}
				// 단어@서버이름.코드
				// 코드 2~3[.2~3]
				//var emailPattern = /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-z0-9-.]+$/;
				// 정규식 참고
				// https://velog.io/@haru/frequently-used-regexp
				var emailPattern = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
				if( emailPattern.test(email.value) == false) {
					alert("유효한 이메일 주소를 입력하세요");
					email.value = "";	// 입력되어있는 값을 지움
					email.focus();		// 입력 객체로 커서 이동
					return false;		// submit 중단
				}
				// 비번 입력 확인
				if( passwd.value.length < 4 ){	// 4글자 이상 입력했는지 체크
					// 대문자, 소문자, 특수문자, 숫자가 최소한 1개 이상은 포함
					alert('비밀번호는 최소 4글자 이상이어야 합니다');
					passwd.value = "";	// 입력값 삭제
					passwd.focus();		// 커서 이동 
					return false;		// submit 중단
				}

				// 비번 입력값과 비번확인 입력값이 일치하는지 체크
				if( passwd.value != cpw.value ) {
					alert('비번과 비번확인이 일치하지 않습니다');
					passwd.value = "";	// 비번확인 입력값 삭제
					cpw.value = "";		// 비번 입력값 삭제
					passwd.focus();		// 커서 이동
					return false;		// submit 중단
				}
				
				// 나이 검사
				// NaN 여부 체크하는 함수
				// NaN -> type number
				// 입력값이 "", NaN, 음수 여부 확인
				if( age.value == "" || isNaN(age.value) || age.value < 0 ) {
					alert("유효한 나이를 입력해 주세요");
					age.value = "";		// 입력값 삭제
					age.focus();		// 커서 이동
					return false;		// submit 중단
				}
				
				// 전화번호 형식 검사
				var PhonePattern = /^\d{2,3}-\d{3,4}-\d{4}$/; 
				if( !PhonePattern.test(phone.value) ){
					alert('유효한 전화번호를 입력해 주세요 예) 010-1234-5678');
					phone.value = "";	// 입력값 삭제
					phone.focus();		// 커서 이동
					return false;		// submit 중단
				}
				
				// 검사를 통과하면 submit 진행
				return true;
			}
		</script>
	</head>
	<body>
		<h2>회원가입</h2>
		<!-- form action 속성을 지정하지 않으면 자기 자신에게 보냅니다 -->
		<form onsubmit="return CheckValue();">
			<label for="username">사용자 이름 : </label>
			<input type="text" name="username" id="username"><br>
			<label for="email">이메일 : </label>
			<input type="email" id="email" name="email"><br>
			<label for="passwd">비밀번호 : </label>
			<input type="password" id="passwd" name="passwd"><br>
			<label for="confirmpasswd">비밀번호 확인 : </label>
			<input type="password" id="confirmpasswd" name="confirmpasswd"><br>
			<label for="age">나이 : </label>
			<input type="number" id="age" name="age"><br>
			<label for="phone">전화번호 : </label>
			<input type="tel" id="phone" name="phone"><br>
			<input type="submit" value="회원가입">
			<input type="reset" value="입력취소">
			<button type="button" onclick="CheckValue();">함수확인</button>
		</form>
	</body>
</html>