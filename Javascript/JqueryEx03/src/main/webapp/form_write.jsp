<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Select-Option Textarea</title>
		<script>
			function CheckValue(){
				// 제목, 카테고리, 내용 입력 객체 찾아오기
				var title = document.forms['writeForm']['title'];
				var content = document.forms['writeForm']['content'];
				var category = document.forms['writeForm']['category'];
				
				// 입력값 확인하기
				if( title.value.trim() == "" ){
					alert("제목을 입력해 주세요");
					title.focus();
					return false;
				}
				if( category.value == "" ) {
					alert("카테고리를 선택해주세요");
					return false;
				}
				if( content.value.trim() == "") {
					alert("내용을 입력해 주세요");
					content.focus();
					return false;
				}
				// submit 진행하기
				if( confirm("등록하시겠습니까?") ){
					return true;
				}else{
					return false;
				}
			}
		</script>
	</head>
	<body>
		<h2>글쓰기</h2>
		<form onsubmit="return CheckValue();" name="writeForm">
			<label for="title">제목 : </label>
			<input type="text" name="title" id="title"><br>
			
			<label for="category">카테고리 : </label>
			<select id="category" name="category">
				<option value="">선택하세요</option>
				<option value="jv">자바</option>
				<option value="js">자바스크립트</option>
				<option value="jq">Jquery</option>
				<option value="py">파이썬</option>
			</select><br>
			<label for="content">내용 : </label>
			<textarea id="content" name="content" row="10" cols="30"></textarea><br>
			<input type="submit" value="등록하기">
		</form>
	</body>
</html>