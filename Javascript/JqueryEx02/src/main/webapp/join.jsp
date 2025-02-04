<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<!DOCTYPE html>
<html>
	<head>
		<title>아이디 중복 검사</title>
		<script src="./js/jquery-3.7.1.js"></script>
		<script>
			function DoAjax(){
				var input_id = $('[name="userid"]').val(); // id 입력값을 가져옵니다
				if( input_id == "" ) {
					$('.msg_box').html("");
					return;
				}
				// 변수 == 'ezen' / 변수.equeals("문자열") -> 1가지의 경우만 확인
				// 정규표현식 /^[문자범위]+$/
				// 형식은 //사이에 작성 ^는 문자열 시작 $는 문자열 끝 []는 범위 형식 +는 여러글자
				var idPattern = /^[a-zA-Z]+$/;	// 영문 대소문자로만 구성된 문자열
				if( idPattern.test(input_id) == false ){
					$('.msg_box').html("<span style='color:red;'>ID 형식에 맞지 않습니다</span>");
					return;
				}else{
					$('.msg_box').html(""); // 형식에 맞을 경우, 메세지 초기화
				}
				// 가져온 값의 문자 개수가 5개 미만이면, ajax 통신을 하지 않고, 함수를 종료합니다
				if( input_id.length < 4 ){ return; }
				$.ajax({
					url : './idCheck.jsp',
					type : 'post',
					data : { uid : input_id },
					success : function(result){
					// result의 앞뒤 공백을 제거하고
					// 'OK'이면 msg_box에 '사용할수 있는 id입니다'
					// 'DUPLE' : '중복된 아이디입니다 / "ERROR" : '오류가 발생했습니다'
						var msg_str = "";
						if( result.trim() == 'OK' ) {
							msg_str ="<span style='color:blue;'>사용할수 있는 ID입니다</span>"
						}else if( result.trim() == 'DUPLE' ) {
							msg_str ="<span style='color:red;'>중복된 아이디입니다</span>"
						}else {
							msg_str ="<span style='color:red;'>오류가 발생했습니다</span>"
						}
						$('.msg_box').html(msg_str);
					}
				});
			}
		</script>
	</head>
	<body>
		<form name="join" method="post" action="joinok.jsp" 
			onsubmit="return DoSubmit();">
			<table border="0" style="width:100%;">
				<tr>
					<td style="height:40px">
						<span style="font-weight:bold; color:red;">※ 회원가입</span>
					</td>
				</tr>
			</table>
			<table border="1" style="width:100%;">
				<tr>
					<td style="width:130px;">아이디 (*)</td>
					<td>
						<input type="text" name="userid" onkeyup="DoAjax();"
							placeholder="아이디는 영문자로만 입력하세요." style="width:95%">
						<br>
						<span class="msg_box"></span><br>
						<button type="button" onclick="DoAjax();">중복검사</button>
					</td>
				</tr>
				<tr>
					<td>비밀번호 (*)</td>
					<td><input type="password" name="userpw"  style="width:95%"></td>
				</tr>
				<tr>
					<td>비밀번호 확인 (*)</td>
					<td><input type="password" name="pwcheck" style="width:95%"></td>
				</tr>			
				<tr>
					<td>이름 (*)</td>
					<td><input type="text" name="name"  style="width:95%"></td>
				</tr>		
				<tr>
					<td>성별 (*)</td>
					<td>
						<input type="radio" name="gender" value="M" checked>남자
						<input type="radio" name="gender" value="F">여자
					</td>
				</tr>		
				<tr>
					<td>취미 (*)</td>
					<td>
						<select name="hobby" >
							<option value="1">낚시</option>
							<option value="2">여행</option>
							<option value="3" selected>게임</option>
						</select>
					</td>
				</tr>		
				<tr>
					<td>관심분야</td>
					<td>
						<input type="checkbox" value="1" name="fav"  checked>책
						<input type="checkbox" value="2" name="fav">영화					
						<input type="checkbox" value="3" name="fav">유튜브
					</td>
				</tr>		
				<tr>
					<td colspan="2" style="text-align:center;">
						<input type="submit" value="가입완료">
						<input type="button" onclick="DoCancel();" value="취소">
					</td>							
				</tr>																															
			</table>
		</form>
</body>
</html>