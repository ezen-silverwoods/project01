<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>checkbox, date, file</title>
		<script src="./js/jquery-3.7.1.js"></script>
		<script>
			function setAgree(bool) {
				var agree = $('#agree');
				console.log(agree);
		/* checkbox의 checked 속성 부여 상태를 가져올때의 문제점
			1.	객체.value : checked 상태는 value와 별개의 속성 상태임
			
			2.	객체.getAttribute('속성이름')
				html 태그의 작성 상태를 가져옴 동적 상태는 반영되지 않음 
			
			3.	해결 방법 : 객체.checked
				객체의 checked 상태를 T/F로 반환
				
			4.	checked는 value 속성이 아니기에, JQ객체.val() 사용하지 못함
			
			5.	마찬가지로 JQ객체.attr() 역시 checked의 동적 상태를 가져오지 못함 */
				// JQ객체.prop('속성이름') 속성의 값을 가져옴
				// JQ객체.prop('속성이름','변경값') 속성의 값을 변경
				console.log(agree.prop('checked'));
			
				//agree.prop('checked',true);
				if( agree.is(':checked') ){ // checked T
					console.log('체크되어있습니다')	// submit 진행
				}else{	// checked F
					console.log('이용약관에 동의해주세요')
				}
				agree.prop('checked',bool);
			}
			function setNow(){
				var date = $('#date');
				const today = new Date();
				var year = today.getFullYear();
				var month = String(today.getMonth()+1).padStart(2,'0')
				var day = String(today.getDate()).padStart(2,'0')
				var today_str = year + "-" + month + "-" + day;
				date.val(today_str);
			}
			function CheckFile(){
				var fileInput = $('#file');
				// JQ로 객체를 찾으면 그 결과는 JQ객체를 반환합니다
				// 찾은 객체가 1개일 경우에도 DOM객체를 반환하지 않고
				// JQ객체를 반환합니다
				
				// index를 지정해서, JQ객체 내부에 있는 배열에서 원소를 가져오기
				// JQ객체.get(인덱스)
 				console.log(fileInput.get(0).files);
 				console.log(fileInput.get(0).files.length);
				if( fileInput.get(0).files.length == 0 )
				{
					console.log("파일이 선택되지 않았습니다.");
				}else{
					var file = fileInput.get(0).files[0];
					if( file.size > 5 * 1024 * 1024 ) {
						alert("파일의 크기는 5MB를 초과할 수 없습니다.");
						fileInput.val('');	// 선택된 파일을 제거
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