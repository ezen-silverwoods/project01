<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="./js/jquery-3.7.1.js"></script>
		<script>
			function DoCall(){
				$.ajax({
					url : './data.json',
					type : 'get',
					success : function(result){
						// 콘솔에 result를 출력하세요
						console.log(result);
						// result는 array입니다 원소가 여러개에요
						for( item of result ){
							// item이라는 변수에 result 배열의 원소를 하나씩 넣어가며
							// 반복문을 실행
							console.log(item);
							// json(js obj)의 키이름으로 값 가져오기
							console.log(item.name);
							console.log("이름 : ", item["name"]);
							// 나이, 성별을 출력해보세요
							console.log("나이 : ", item["age"]);
							console.log("성별 : ", item["gender"]);
							// html 태그에 정보를 넣어서 문자열을 완성
							var html_str = "<li>"+ item["name"] + " " + item["age"] + "</li>";
							// 객체를 찾아 뒷부분에 새로운 객체를 추가
							$(".userList").append(html_str);
							
						}
						for( idx in result ){
							// idx 변수에 reult 배열의 각 원소의 인덱스 값을 넣어가며
							// 반복문을 실행
							console.log(result[idx]);
							//console.log( idx + " " + JSON.stringify(result[idx]));
						}
					}
				});
			}
		</script>
	</head>
	<body>
	 <button type="button" onclick="DoCall();">ajax 요청</button><br>
	 <ul class="userList"></ul>
	</body>
</html>