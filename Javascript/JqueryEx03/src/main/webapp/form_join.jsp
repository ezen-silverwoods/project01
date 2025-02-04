<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>forms를 이용한 join</title>
		<script src="./js/jquery-3.7.1.js"></script>
		<script>
			function CheckValue(){
				// id를 이용한 객체 찾기
				//var item = document.getElementById('username');
				var item = username; // id 자체를 명시하여 객체 찾기
				//var username = get...
				console.log(item);
				
				// form객체의 name 속성을 이용해서 input 찾기
				item = document.joinform.username;
				console.log(item);
				
				// forms form 객체중에 특정한 name을 갖는 객체를 찾고,
				// 하위 객체의 name속성으로 input 객체를 찾는 문법
				//document.forms['form name']['input name'] 
				item = document.forms['joinform']['username'];
				console.log(item);
				
				// input 객체들의 value 값을 가져옴
				var userName = document.forms['joinform']['username'];
				var email = document.forms['joinform']['email'];
				var passwd = document.forms['joinform']['passwd'];
				var cpw = document.forms['joinform']['confirmpasswd'];
				var age = document.forms['joinform']['age'];
				var phone = document.forms['joinform']['phone'];
				
				//return false;

				// 각각의 유형에 맞는 유효성 검사를 수행
				if( userName.value.trim() == "" ) {
					alert("사용자 이름을 입력해주세요");
					// 이름 입력 객체에 커서 이동
					userName.focus();
					return false;
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
		<form name="joinform" onsubmit="return CheckValue();">
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
		</form>
	</body>
</html>