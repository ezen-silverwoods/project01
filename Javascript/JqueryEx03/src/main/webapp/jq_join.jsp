<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Jq를 이용한 join</title>
		<script src="./js/jquery-3.7.1.js"></script>
		<script>
			function CheckValue(){
				// input 객체들의 value 값을 가져옴
				var userName = $('#username');
				var email = $('#email');
				var passwd = $('#passwd');
				var cpw = $('#confirmpasswd');
				var age = $('#age');
				var phone = $('#phone');
				
/*  				console.log("이름 객체 : ", userName);
				console.log("이름 입력값 : ", userName.val());
				console.log("이메일 객체 : ", email);
				console.log("이메일 입력값 : ", email.val());
				console.log("비번 객체 : ", passwd);
				console.log("비번 입력값 : ", passwd.val());
				console.log("비번확인 객체 : ", cpw);
				console.log("비번확인 입력값 : ", cpw.val());
				console.log("나이 객체 : ", age);
				console.log("나이 입력값 : ", age.val());
				console.log("전화 객체 : ", phone);
				console.log("전화 입력값 : ", phone.val());
				return false; */
				
				// 각각의 유형에 맞는 유효성 검사를 수행
				if( userName.val().trim() == "" ) {
					alert("사용자 이름을 입력해주세요");
					// 이름 입력 객체에 커서 이동
					userName.focus();
					return false;
				}
				
				// 이메일 형식 검사
				if( email.val().trim() == "" ) {
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
				if( emailPattern.test(email.val()) == false) {
					alert("유효한 이메일 주소를 입력하세요");
					email.val("");		// 입력되어있는 값을 지움
					email.focus();		// 입력 객체로 커서 이동
					return false;		// submit 중단
				}
				// 비번 입력 확인
				if( passwd.val().length < 4 ){	// 4글자 이상 입력했는지 체크
					alert('비밀번호는 최소 4글자 이상이어야 합니다');
					passwd.val("");		// 입력값 삭제
					passwd.focus();		// 커서 이동 
					return false;		// submit 중단
				}

				// 비번 입력값과 비번확인 입력값이 일치하는지 체크
				if( passwd.val() != cpw.val() ) {
					alert('비번과 비번확인이 일치하지 않습니다');
					passwd.val("");	// 비번확인 입력값 삭제
					cpw.val("");		// 비번 입력값 삭제
					passwd.focus();		// 커서 이동
					return false;		// submit 중단
				}
				
				// 나이 검사
				// NaN 여부 체크하는 함수
				// NaN -> type number
				// 입력값이 "", NaN, 음수 여부 확인
				if( age.val() == "" || isNaN(age.val()) || age.val() < 0 ) {
					alert("유효한 나이를 입력해 주세요");
					age.val("");		// 입력값 삭제
					age.focus();		// 커서 이동
					return false;		// submit 중단
				}
				
				// 전화번호 형식 검사
				var PhonePattern = /^\d{2,3}-\d{3,4}-\d{4}$/; 
				if( !PhonePattern.test(phone.val()) ){
					alert('유효한 전화번호를 입력해 주세요 예) 010-1234-5678');
					phone.val("");		// 입력값 삭제
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
		</form>
	</body>
</html>