<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>checkbox, date, file</title>
		<script>
			function setAgree(bool) {
				// checkbox의 checked 속성
				var agree = document.querySelector('#agree');
				console.log(agree);
				//console.log(agree.getAttribute('checked'));
				// checked 속성의 부여 여부 -> T/F
				console.log(agree.checked);
/* 				agree.setAttribute('속성이름') = '바꿀값'
				agree.getAttribute('checked') */
				//agree.checked = true;
				agree.checked = bool;
				// 기존의 값을 뒤집어서 토글 버튼으로 만들수 있습니다
				//agree.checked = !agree.checked;
			}
			function setNow(){
				var date = document.querySelector('#date');
				console.log(date);
				console.log(date.value);
				//date.value = '2024-12-05';
 				// Date객체를 이용한 날짜 설정
				const today = new Date();
				console.log(today);
				console.log('----------------');
				console.log(today.getFullYear());
				console.log(today.getMonth());
				console.log(today.getDate());
				console.log('----------------');
				console.log(String(today.getMonth()+1).padStart(2,'0'));
				console.log(String(today.getDate()).padStart(2,'0'));
				
				var year = today.getFullYear();
				var month = String(today.getMonth()+1).padStart(2,'0')
				var day = String(today.getDate()).padStart(2,'0')
				
				var today_str = year + "-" + month + "-" + day;
				// 데이터 바인딩 / `문자열` -> 템블릿 리터럴
				// jsp에도 \${} 바인딩이 존재하기에, \를 사용하지 않으면 동작하지 않습니다
				today_str = `\${year}-\${month}-\${day}`;
				//today_str = `\${year}년 \${month}월 \${day}일`;
				console.log(today_str);
				date.value = today_str;
			}
			function CheckFile(){
				var fileInput = document.querySelector('#file');
				console.log(fileInput.files.length);
				if( fileInput.files.length == 0 )
				{
					console.log("파일이 선택되지 않았습니다.");
				}else{
					var file = fileInput.files[0];
					console.log("파일이 "+ fileInput.files.length +"개 선택되었습니다.");
					console.log(file);
					console.log(file.name);
					console.log(file.size);
					// 1byte -> 8bit / 1kbyte 1024byte 2^10
					// 36분 후 초단위 1분 60초 36 *60
					//  312 * 24 * 60 * 60
					// 5MB를 byte로 표기 
					if( file.size > 5 * 1024 * 1024 ) {
						alert("파일의 크기는 5MB를 초과할 수 없습니다.");
						fileInput.value = '';	// 선택된 파일을 제거
					} 
				}
			}
		</script>
	</head>
	<body>
		<h2>나머지 input type 실습하기</h2>
		<form name="extra" onsubmit="return CheckValue();">
			<label for="date">날짜 : </label>
			<input type="date" id="date" name="date">
			<button type="button" onclick="setNow();">오늘로</button>
			<br>
			<label>이용 약관에 동의합니다
				<input type="checkbox" name="agree" id="agree">
			</label>
			<button type="button" onclick="setAgree(true);">동의하기</button>
			<button type="button" onclick="setAgree(false);">취소하기</button>
			<br>
			<label for="file">파일 업로드 : </label>
			<input type="file" id="file" name="file" onchange="CheckFile();">
			<br>
			<input type="submit" value="제출하기">
		</form>
	</body>
</html>